# Use an official Node.js runtime as a parent image
FROM nginx:latest

# Set the working directory in the container

#WORKDIR /app

# Copy package.json and package-lock.json
#COPY package*.json ./

# Install dependencies
#RUN npm install

# Copy the rest of your application code
#COPY . .

# Expose port 8080
EXPOSE 80

# Command to run your app
#CMD ["node", "app.js"]
