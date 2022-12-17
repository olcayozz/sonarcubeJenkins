FROM jenkins/jenkins
USER root
RUN apt-get -y update && apt-get -y clean
RUN mkdir /app/
COPY ./app/* /app/
RUN chmod +x /app/*.sh