FROM node:latest

# Create app directory
WORKDIR /app

COPY package*.json /app
RUN npm install
COPY . /app 

# Build packages
RUN npm run build

# Cleare unused files
RUN rm *.json

# Exposing port for service
EXPOSE 3000

# Serve service
CMD [ "node", "app" ]