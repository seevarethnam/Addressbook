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


FROM maven:3.8.1-openjdk-11-slim AS build
 
# Set the working directory in the container
WORKDIR /app
 
# Copy the pom.xml file to the container at /app
COPY pom.xml .
 
# Download dependencies and build the project
RUN mvn clean install -DskipTests
 
# Copy the application files
COPY src ./src
 
# Build the application
RUN mvn package -DskipTests
 
# Use Tomcat as the base image for the runtime
FROM tomcat:9.0.83-jdk11-openjdk-slim
 
# Copy the application WAR file from the build stage to the Tomcat webapps directory
COPY --from=build target/addressbook.war /usr/local/tomcat/webapps/
 
# Expose the default Tomcat port
EXPOSE 8080
 
# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
