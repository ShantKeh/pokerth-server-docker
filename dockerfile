FROM ubuntu
RUN apt-get -y update
RUN apt-get -y install pokerth-server
RUN useradd -ms /bin/bash poker
USER poker
WORKDIR /home/poker
RUN cp -r /usr/share/games/pokerth .
RUN cp -r /usr/share/doc/pokerth-server ./pokerth/
RUN cp -r /usr/share/doc/pokerth-data ./pokerth/
RUN cp -r /usr/games/pokerth_server ./pokerth/
COPY ./config.xml ./.pokerth/config.xml
EXPOSE 7234
CMD /home/poker/pokerth/pokerth_server && tail -F /dev/null