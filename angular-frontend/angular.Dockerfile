# Use the official Node.js base image
FROM node:alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the entire Angular app code into the container
COPY . /usr/src/app

# Install the Angular CLI globally
RUN npm install -g @angular/cli

# Install app dependencies
RUN npm install

# Command to run the Angular app (serve it)
CMD ["ng", "serve", "--host", "0.0.0.0"]
