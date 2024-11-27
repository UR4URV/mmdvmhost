## Cloning the repository and building the image
```
# cd /opt/
# git clone https://github.com/UR4URV/mmdvmhost.git
# cd /opt/mmdvmhost/
# docker build . --no-cache --compress --tag mmdvmhost
```

## Creating folders and editing the configuration file
```
# cd /opt/mmdvmhost/
# mkdir config log
# vim config/MMDVM.ini
```

## Creating and running a container "mmdvmhost" from local repo
```
# docker run -it --name "mmdvmhost" \
  --hostname "mmdvmhost" \
  --device /dev/ttyS0:/dev/ttyACM0 \
  --device /dev/ttyS1:/dev/ttyACM1 \
  --device /dev/ttyS2:/dev/ttyACM2 \
  --device /dev/ttyS3:/dev/ttyACM3 \
  -v ./config/:/usr/local/etc/ \
  -v ./log/:/var/log/ \
  -v /etc/timezone:/etc/timezone:ro \
  -v /etc/localtime:/etc/localtime:ro \
  --restart unless-stopped \
  -d mmdvmhost
```

---
## Creating and running a container "mmdvmhost" from DockerHub
```
# docker run -it --name "mmdvmhost" \
  --hostname "mmdvmhost" \
  --device /dev/ttyS0:/dev/ttyACM0 \
  --device /dev/ttyS1:/dev/ttyACM1 \
  --device /dev/ttyS2:/dev/ttyACM2 \
  --device /dev/ttyS3:/dev/ttyACM3 \
  -v mmdvmhost_config:/usr/local/etc/ \
  -v mmdvmhost_log:/var/log/ \
  -v /etc/timezone:/etc/timezone:ro \
  -v /etc/localtime:/etc/localtime:ro \
  --restart unless-stopped \
  -d ur4urv/mmdvmhost
```
