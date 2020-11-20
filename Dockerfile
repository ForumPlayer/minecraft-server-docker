FROM openjdk:slim-buster
LABEL maintainer="ForumPlayer"

EXPOSE 25565/tcp
EXPOSE 25565/udp

WORKDIR /minecraft
VOLUME /minecraft

RUN apt update && apt install -y wget 

COPY eula.txt .
RUN wget https://papermc.io/ci/job/Paper-1.16/lastSuccessfulBuild/artifact/paperclip.jar

CMD ["java", "-Xms1G", "-Xmx1G", "-jar", "paperclip.jar", "nogui"]
