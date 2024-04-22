# Use a base image with Java installed
FROM adoptopenjdk/openjdk11:alpine-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file built by Maven/Gradle
COPY target/<your-application-name>.jar app.jar

# Expose port 8080
EXPOSE 8080

# Start the Spring Boot application
ENTRYPOINT ["java","-jar","app.jar"]
