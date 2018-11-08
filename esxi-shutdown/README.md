# esxi-shutdown

> Small script to shutdown gracefully an ESXi host.

## How It Works

Using PowerCLI, the script fetches all the VMs with VMware Tools installed (what we call "Supported VMs") and try to shut them down. VMs without VMware Tools will issue an alert but nothing else can be done.

After all supported VMs are switched off, the script will proceed to shutdown the host itself.

This Docker image is tested with ESXi hosts version 6.5 and above but may work with older versions.

## Environment Variables

| Name           | Description                                                   | Required | Default Value |
|----------------|---------------------------------------------------------------|----------|---------------|
| `esxiUsername` | Login username for the ESXi host                              | Yes      |               |
| `esxiPassword` | Login password for the ESXi host                              | Yes      |               |
| `esxiIP`       | ESXi Host IP                                                  | Yes      |               |
| `esxiTimeout`  | Max time in seconds to wait until all supported VMs shutdown. | No       | 120           |

## Usage

```bash
docker run --rm \
    -e "esxiUsername=root" \
    -e "esxiPassword=mypassword" \
    -e "esxiIP=192.168.1.10" \
    vegbrasil/esxi-shutdown
```

## Roadmap

* Find a way to suppress the "VMware's Customer Experience Improvement Program" alert;
* Pass the credentials in a safer way;
* Check the environment variables before executing;
* Make the invalid certificate action configurable.
* Alert sytem (eg. using E-mail, Telegram or Slack)

Issues and pull requests are always welcome.