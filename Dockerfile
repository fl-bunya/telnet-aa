FROM ubuntu:20.04

# https://northshorequantum.com/archives/dockerbuild_tz_hang.html
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y xinetd
RUN apt-get install -y ffmpeg zlib* python3-setuptools libjpeg-dev python3-pip
RUN pip3 install gif-for-cli

COPY service /etc/xinetd.d/

EXPOSE 23
EXPOSE 808

CMD ["/usr/sbin/xinetd", "-dontfork"]
# ENTRYPOINT ["tail", "-F", "/dev/null"]
