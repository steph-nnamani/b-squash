# Use the official Alpine base image
FROM alpine:latest

# Set environment variables
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/bin

# Install necessary packages
RUN apk --no-cache add openjdk8 docker maven

# Install Docker Compose (optional, if needed)
#RUN apk --no-cache add docker-compose

# Set Jenkins agent user
RUN adduser -D jenkins

# Switch to the Jenkins agent user
USER jenkins

# Create a directory to mount as the Jenkins workspace
RUN mkdir /home/jenkins/agent

# Set the working directory
WORKDIR /home/jenkins/agent

# Entry point for the Jenkins agent
ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/agent.jar"]
