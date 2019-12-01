# Get Nginx image from Docker hub
FROM nginx
# Copy our configuration file to a folder in our Docker image where Nginx will use it
COPY default.conf.template /etc/nginx/conf.d/default.conf

RUN apt-get update
RUN apt-get install nodejs npm -y

RUN npm -v 
RUN node -v
WORKDIR /usr/src/app
COPY . .
RUN npm ci
RUN npm run build
EXPOSE 8080