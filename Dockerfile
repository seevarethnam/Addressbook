FROM tomcat:9.0-jre8-alpine
ARG server_domain   
ARG latest_success 


ENV server=${server_domain} 

ENV latest=${latest_success}

RUN apk  update  \
  && apk add  curl wget
RUN echo $server

RUN echo $latest
RUN  curl --output $CATALINA_HOME/webapps/addressbook.war $server:8081/artifactory/libs-release-local/com/edurekademo/tutorial/addressbook/$latest/addressbook-$latest.war

EXPOSE 8080

HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost:8080/addressbook/ || exit 
