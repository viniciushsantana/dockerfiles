FROM vmware/powerclicore

ADD shutdown.ps1 /opt/

ENV esxiTimeout 120

CMD ["/bin/pwsh", "/opt/shutdown.ps1"]