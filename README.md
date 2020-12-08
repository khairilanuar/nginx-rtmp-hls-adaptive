# Nginx-RTMP-HLS-Adaptive
Docker image to run an Nginx RTMP/HLS server, with multiple ffmpeg transcoding for adaptive HLS stream.

* Alpine version: **alpine:latest**
* NGINX version: **1.19.5**
* nginx-rtmp-module version: **master**

### Running

Use the following command to run the container and bind the port 1935 and 80 to the host machine:
```
docker run -p 1935:1935 -p 80:80 infinitumtech/nginx-rtmp-hls-adaptive
```

### OBS Studio Configuration
Under Settings > Stream, set the following parameters:
```
Streaming Service: Custom streaming server
Server: rtmp://<Server ip>/live
Stream Key: <Stream key>
```

### Streaming URLs
rtmp://&lt;Server ip&gt;/live/&lt;Stream key&gt;
http://&lt;Server ip&gt;/hls/&lt;Stream key&gt;.m3u8
