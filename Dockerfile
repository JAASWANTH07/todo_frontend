FROM node:18
WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

RUN npm install -g @angular/cli
RUN ng build --prod

# Use simple static server
RUN npm install -g http-server

EXPOSE 4200
CMD ["http-server", "dist/angular-17-crud", "-p", "4200"]
