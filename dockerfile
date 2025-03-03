# Base image (OS)
FROM node:18-alpine

# Working directory
WORKDIR /app

# Copy required package
COPY package*.json ./

# Copy src code to container
COPY . .

# Run the build commands
RUN npm install

# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# expose port 8000
EXPOSE 8000

# serve the app / run the app (keep it running)
CMD ["node", "app.js"]


