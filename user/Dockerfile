FROM node:20-alpine3.21 AS builder
WORKDIR /opt/server
COPY package.json /opt/server
COPY server.js /opt/server
RUN npm install

FROM node:20-alpine 3.21
EXPOSE 8080
WORKDIR /opt/server
ENV REDIS_URL="redis://redis:6379" \
    MONGO_URL="mongodb://mongodb:27017/users"
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
COPY --from=builder /opt/server /opt/server
USER roboshop
CMD ["node","server.js"]

# FROM node:20
# WORKDIR /opt/server
# COPY *.json .
# COPY *.js .
# ENV MONGO=true\
#     REDIS_URL='redis://redis:6379'\
#     MONGO_URL="mongodb://mongodb:27017/users"
# RUN npm install
# CMD ["node","server.js"]
