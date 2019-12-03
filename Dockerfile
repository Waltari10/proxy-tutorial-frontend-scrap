# Get Nginx image from Docker hub
FROM nginx
# Copy our configuration file to a folder in our Docker image where Nginx will use it
COPY default.conf.template /etc/nginx/conf.d/default.conf


RUN apt-get update
RUN apt-get install curl -y
#RUN cd ~
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install nodejs -y

WORKDIR /usr/src/app
COPY . .
RUN npm ci
RUN npm run build
EXPOSE 8080