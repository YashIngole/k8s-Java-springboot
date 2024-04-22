# Use a base image with Node.js installed
FROM node:latest AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json for installing dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular app
RUN npm run build --prod

# Use a lightweight base image for serving the Angular app
FROM nginx:latest

# Copy the built Angular app from the build stage to the nginx public directory
COPY --from=build /app/angular-frontend /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx to serve the Angular app
CMD ["nginx", "-g", "daemon off;"]
