# jos-devenv

```bash
cd jos-devenv
docker pull ubuntu:18.04
docker build -t jos-env .
docker run -itd -v ~/JOS/:/root/JOS -p 5000:5000 jos-env
```
