## vmware-backup

Retrieves hosts firmware information using PowerCLI, useful for backuping vCenter Server or ESXi host configuration.

The script is a modification of [pcli_core_docker_sample2.ps1
](https://github.com/lamw/powerclicore-docker-container-samples/blob/master/pcli_core_docker_sample2.ps1) by William Lam. You can read more about it on [his blog](https://www.virtuallyghetto.com/2016/10/5-different-ways-to-run-powercli-script-using-powercli-core-docker-container.html).

### Tags

* `0.1`, `latest` ([0.1/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/vmware-backup/0.1/Dockerfile))

### Usage

Dump the backup on the current directory:

```
docker run --rm \
-e VI_SERVER=192.168.1.10 \
-e VI_USERNAME=administrator \
-e VI_PASSWORD=my_safe_password \
-v $(pwd):/app \
vegbrasil/vmware-backup:latest
```

If everythig goes well, check for the file `.tgz` file:

```
$ ls -lh
total 28K
-rwxr--r-- 1 root root 18K Jan 26 10:31 configBundle-192.168.1.10.tgz
```

In cases where the file already exists, it may fail.