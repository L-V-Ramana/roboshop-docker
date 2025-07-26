FROM node:20-alpine3.21 AS builder
WORKDIR /opt/server
COPY package.json .
COPY server.js .
RUN npm install

FROM node:20-alpine3.21
EXPOSE 8080
RUN  addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /opt/server
ENV MONGO="true"\
    MONGO_URL="mongodb://mongodb:27017/catalogue"
USER roboshop
COPY --from=builder /opt/server /opt/server
CMD ["node ","server.js"]



# FROM node:20-alpine3.21
# RUN addgroup -S roboshop && adduser -S roboshop -G roboshop # creating user in alpine os
# WORKDIR /opt/server
# RUN chown -R roboshop:roboshop /opt/server 
# #changing the permission for /opt/server
# USER roboshop #changing the root user to roboshop
# COPY *.json .
# COPY *.js /opt/server
# RUN npm install
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# # ENV  MONGO="true" \
# #     MONGO_URL="mongodb://mongodb:27017/catalogue"  
#     # here we have to give the name for <MONGODB-SERVER-IPADDRESS> as the name we used while  
#     #building the image of mongodb

# CMD ["node","server.js"]




# FROM node:20
# WORKDIR /opt/server
# COPY *.json .
# COPY *.js /opt/server
# RUN npm install
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# # ENV  MONGO="true" \
# #     MONGO_URL="mongodb://mongodb:27017/catalogue"  
#     # here we have to give the name for <MONGODB-SERVER-IPADDRESS> as the name we used while  
#     #building the image of mongodb

# CMD ["node","server.js"]