# This defines which Node version our Docker image will be running
FROM node:10
# Create app directory in Docker image
WORKDIR /usr/src/app
# Copy everything in current folder to /usr/src/app in Socker image
COPY . .
# run npm clean install (install based on package.lock, instead of package.json)
RUN npm ci
# Build app in production mode
RUN npm run build
# Expose the port that Heroku has dynamically assigned our container
EXPOSE $PORT
# Run the production files we just created
CMD [ "npm", "run", "serve:build" ]