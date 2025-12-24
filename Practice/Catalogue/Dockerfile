FROM node:20
WORKDIR /opt/server
COPY server.js /opt/server
COPY package.json .
RUN npm install
ENV MONGO_URL="mongodb://mongodb:27017/catalogue" 
CMD ["node","server.js"]
