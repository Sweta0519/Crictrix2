# Use the official Node.js 18 image as the base image
FROM node:16.19.1

# Set the working directory to /app
WORKDIR /app



# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install -g @angular/cli

# Copy the rest of the application code to the container
COPY . .

# Set the command to run the application
# For NPM
#CMD ["ng","serve","--host", "0.0.0.0", "--disable-host-check"]
CMD ["npm", "start","--port","$PORT"]


# Expose port 8080
EXPOSE $PORT
