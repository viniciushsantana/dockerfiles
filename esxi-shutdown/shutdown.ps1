# Functions
function outputLog($string) {
    $time = Get-Date -format "dd/MM/yyyy HH:mm:ss"

    Write-Output "$time - $string"
}

# User Variables
$esxiUsername = $env:esxiusername
$esxiPassword = $env:esxipassword
$esxiIP = $env:esxiip
$esxiTimeout = $env:esxitimeout
$esxiVmNameToSkip = $env:esxivmnametoskip

# System Variables
$vmsWithoutTools = 0

# Skip certificate validation
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false | Out-Null

# Disable VMware Customer Experience Improvement Program
Set-PowerCLIConfiguration -ParticipateInCEIP $false -Confirm:$false | Out-Null

# Connect to the ESXi host
outputLog("Connecting to ESXi host...")
Connect-VIServer -Server $esxiIP -User $esxiUsername -Password $esxiPassword | Out-Null
$esxHost = Get-VMHost

# VM Shutdown Loop
outputLog("VM Shutdown sequence started.")

Foreach ($vm in ($esxHost | Get-VM)) {
    $vmName = $vm.Name

    $vmToolsVersion = $vm | Get-VMGuest
    $vmToolsVersion = $vmToolsVersion.ToolsVersion


    if ($vm.PowerState -eq "PoweredOn") {

        if($vm.Name -eq $esxiVmNameToSkip) {
            outputLog("$vmName is online but is set to be skipped...")
            $vmsWithoutTools++
            continue
        }

        outputLog("Trying to shutting down $vmName...")

        if($vmToolsVersion) {
            $vm | Shutdown-VMGuest -Confirm:$false | Out-Null
            sleep 2.0
        } else {
            $vmsWithoutTools++
            outputLog("$vmName doesn't have VMWare Tools installed, unable to shutdown gracefully.")
        }

    } else {
        outputLog("$vmName appears to be offline already, skipping...")
    }

}

$time = [math]::Round((Get-Date).TimeofDay.TotalSeconds)
Do {
    # Total number of online VMs
    $totalOnlineVMs = ($esxHost | Get-VM | Where { $_.PowerState -eq "poweredOn" }).Count
    # Number of VMs that are online *AND* we can turn off gracefully
    $capableOnlineVMs = $totalOnlineVMs - $vmsWithoutTools

    $timeleft = $esxiTimeout - $newTime;

    if($capableOnlineVMs -eq 0) {
        outputLog("No supported VMs left to shutdown.")
        break
    } else {
        outputLog("Waiting for shutdown of $capableOnlineVMs VMs or until $timeleft seconds...")
        sleep 10.0
        $newTime = [math]::Round((Get-Date).TimeofDay.TotalSeconds) - $time
    }
} Until (($capableOnlineVMs -eq 0 -or $newTime -ge $esxiTimeout))

# Shut down the ESXi Hosts
if($totalOnlineVMs -gt 0) {
    outputLog("$totalOnlineVMs VMs kept online due to missing VMware Tools or for being set to be skipped.")
}
outputLog("Shutting down ESXi host...")
$esxHost | Foreach {Get-View $_.ID} | Foreach {$_.ShutdownHost_Task($TRUE)}
outputLog("Shutdown completed.")
Disconnect-VIServer -Server $esxiIP -Confirm:$false

