#FROM tomcat:9.0.83-jdk8-corretto-al2
#ARG server_domain   
#ARG latest_success 

#ENV server=${server_domain} 

#ENV latest=${latest_success}
#RUN apk  update  \
#  && apk add  curl wget
#RUN echo $server


#RUN echo $latest
#RUN  curl --output $CATALINA_HOME/webapps/addressbook.war $server:8081/artifactory/libs-release-local/com/edurekademo/tutorial/addressbook/$latest/addressbook-$latest.war

#EXPOSE 8080

#HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost:8080/addressbook/ || exit

#LABEL maintainer="Santhosh"


#ADD target/addressbook.war /usr/local/tomcat/webapps/
#EXPOSE 8080
#ENTRYPOINT ["catalina.sh","run"]


FROM tomcat:9.0.83-jdk8-corretto-al2

LABEL maintainer="Santhosh"


ADD target/addressbook.war /usr/local/tomcat/webapps/
EXPOSE 8088
ENTRYPOINT ["catalina.sh","run"]
