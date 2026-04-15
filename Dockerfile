# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the local Java file into the container
COPY Hello.java .

# Compile the Java file
RUN javac Hello.java

# Define the command to run the application
CMD ["java", "Hello"]
