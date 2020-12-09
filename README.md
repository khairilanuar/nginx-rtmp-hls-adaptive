# Nginx-RTMP-HLS-Adaptive
Docker image to run an Nginx RTMP/HLS server, with multiple ffmpeg transcoding for adaptive HLS stream.

* Alpine version: **alpine:latest**
* NGINX version: **1.19.5**
* nginx-rtmp-module version: **master**

### Running

Use the following command to run the container and bind the port 1935 and 80 to the host machine:
```
docker run -p 1935:1935 -p 80:80 -e "AUTH_TOKEN=yoursecrettoken" infinitumtech/nginx-rtmp-hls-adaptive
```
replace `yoursecrettoken` with your own secret token.

### OBS Studio Configuration
Under Settings > Stream, set the following parameters:
```
Streaming Service: Custom streaming server
Server: rtmp://<server_ip>/stream?token=yoursecrettoken
Stream Key: <stream_key>
```

### Streaming URLs
RTMP:
```
rtmp://<server_ip>/live/<stream_key>
```

HLS:
```
http://<server_ip>/hls/<stream_key>.m3u8
```
