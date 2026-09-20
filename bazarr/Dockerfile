FROM ubuntu
ARG UID
ARG GID
ARG USER

# Create users and groups
RUN useradd --uid $UID  --create-home $USER && \
    groupadd --gid $GID media && \
    usermod -a -G media $USER

RUN apt update &&\
    apt install -y wget sqlite3 ca-certificates libicu-dev gosu 7zip python3-dev python3-pip python3-setuptools unrar unzip ffmpeg &&\
    wget https://github.com/morpheus65535/bazarr/releases/latest/download/bazarr.zip &&\
    mkdir /opt/bazarr &&\
    unzip bazarr.zip -d /opt/bazarr
WORKDIR /opt/bazarr
RUN find / -type f -name EXTERNALLY-MANAGED -execdir mv {} EXTERNALLY-MANAGED.bkp \;
RUN python3 -m pip install -r requirements.txt

VOLUME /data
VOLUME /opt/bazarr/data
EXPOSE 6767

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD [ "/entrypoint.sh" ]
