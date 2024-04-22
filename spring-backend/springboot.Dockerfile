# Use a base image with Maven and JDK installed
FROM maven:3.8.5-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the Maven project file(s)
COPY pom.xml .

# Copy the entire source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use a lightweight base image for the final container
FROM adoptopenjdk/openjdk11:alpine-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the build stage to the final container
COPY --from=build /app/target/spring-backend-v1.jar app.jar

# Expose port 8080
EXPOSE 8080

# Start the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
