# Use the official Node.js 18 image as the base image
FROM node:18

# Set the working directory to /app
WORKDIR /app

ENV PATH="/Crictrix2/node_modules/.bin:$PATH"


# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install -g @angular/cli

# Copy the rest of the application code to the container
COPY . .

# Set the command to run the application
# For NPM
CMD ["ng","serve", "--" ,"--host", "0.0.0.0", "--disable-host-check"]

# Expose port 80
EXPOSE 4200
