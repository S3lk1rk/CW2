FROM node:6.14.2
EXPOSE 80
COPY server.js .
CMD node server.js
