FROM node:20
WORKDIR /opt/server
COPY server.js .
COPY server.js .
RUN npm install
ENV MONGO_URL="mongodb://mongodb:27017/catalogue" 
CMD ["node","server.js"]
