FROM node
WORKDIR /opt
COPY *.json ./
RUN npm install

COPY ./ ./
CMD node server.js

EXPOSE 3000

# FROM nginx
# COPY index.html /usr/share/nginx/html
# EXPOSE 80

