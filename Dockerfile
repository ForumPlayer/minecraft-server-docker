FROM debian:buster-slim
LABEL maintainer="ForumPlayer"

EXPOSE 25565/tcp
EXPOSE 25565/udp

WORKDIR /minecraft

RUN apt update && apt-get upgrade -y
RUN apt install -y wget zip bash-completion git htop nano psmisc screen

RUN mkdir -p /usr/share/man/man1
RUN apt install -y default-jre-headless

COPY . .
RUN chmod +x run.sh
RUN wget https://papermc.io/ci/job/Paper-1.16/lastSuccessfulBuild/artifact/paperclip.jar

CMD ["/minecraft/run.sh"]
