# FROM node:20    
# WORKDIR /opt/server
# COPY package.json .
# COPY server.js .
# RUN npm install
# ENV REDIS_URL='redis://redis:6379' \
#     MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/users"
# CMD ["node","server.js"]



FROM node:20-alpine3.22 AS builder
WORKDIR /opt/server
COPY package.json /opt/server
COPY server.js /opt/server
RUN npm install

FROM node:20-alpine3.22
WORKDIR /opt/server
RUN addgroup -S roboshop && adduser -S robshop -G roboshop
ENV REDIS_URL='redis://redis:6379' \
MONGO_URL="mongodb://mongodb:27017/users"
USER roboshop
COPY --from=builder /opt/server /opt/server
CMD ["/bin/node","/app/server.js"]