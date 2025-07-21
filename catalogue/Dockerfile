FROM node:20
WORKDIR /opt/server
COPY *.json .
COPY *.js /opt/server
RUN npm install
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
# ENV  MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"  
    # here we have to give the name for <MONGODB-SERVER-IPADDRESS> as the name we used while  
    #building the image of mongodb

CMD ["node","server.js"]