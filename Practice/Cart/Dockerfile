# FROM node:20
# WORKDIR /opt/server
# COPY package.json .
# COPY server.js .
# RUN npm install
# ENV REDIS_HOST="redis" \
#     CATALOGUE_HOST="catalogue" \
#     CATALOGUE_PORT="8080"
# CMD ["node","server.js"]


FROM node:20-alpine3.22 AS builder
WORKDIR /opt/server
COPY *.json /opt/server
COPY *.js /opt/server
RUN npm install

FROM node:20-alpine3.22 
WORKDIR /opt/server
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV REDIS_HOST="redis" \
CATALOGUE_HOST="catalogue" \
CATALOGUE_PORT="8080"
USER roboshop
COPY --from=builder /opt/server /opt/server
CMD ["node","server.js"]

