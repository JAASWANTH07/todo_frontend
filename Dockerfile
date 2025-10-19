FROM node:18

# Set working directory
WORKDIR /app

# Copy package files first for caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Copy all project files
COPY . .

# Build Angular app in production mode
RUN ng build --configuration production

# Install simple static server
RUN npm install -g http-server

# Expose port
EXPOSE 4200

# Serve built app
CMD ["http-server", "dist/angular-17-crud", "-p", "4200"]
