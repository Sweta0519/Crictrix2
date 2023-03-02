# Use the official Node.js 16 image as the base image
FROM node:16 as build

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the application
RUN npm run build

# Use a smaller image for the final stage
FROM node:16-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the build output from the previous stage to this stage
COPY --from=build /app/dist .

# Install production dependencies only
RUN npm install --production

# Set the command to run the application
CMD ["npm", "start", "--", "--port", "$PORT"]

# Expose the port that the application will listen on
EXPOSE $PORT
