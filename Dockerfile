# Use an official Maven image as a parent image
FROM maven:latest

# Set metadata information
LABEL authors="bober"

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml /app/

# Copy the entire project to the container
COPY . /app/

# Package your application
RUN mvn package

# Run the application
CMD ["java", "-jar", "target/Calculator.jar"]
