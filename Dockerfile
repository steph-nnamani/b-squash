# Use the official AdoptOpenJDK base image
FROM adoptopenjdk/openjdk11:alpine-jre

# Specify the JAR file name
ARG artifact=target/spring-boot-mongo-1.0.jar

# Set the working directory within the container
WORKDIR /opt/app

# Copy the compiled JAR file to the container
COPY ${artifact} /squashers.war

# Set the entry point for running the Spring Boot application
ENTRYPOINT ["java", "-jar", "squashers.war"]

