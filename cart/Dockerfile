FROM node:20-alpine3.21 AS builder
WORKDIR /opt/server
COPY *.json /opt/server
COPY *.js /opt/server
RUN npm install

FROM node:20-alpine3.21
RUN RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV REDIS_HOST="redis"\
ENV CATALOGUE_HOST="catalogue"\
ENV CATALOGUE_PORT="8080"
WORKDIR /opt/server
COPY --from=builder /opt/server /opt/server
USER roboshop
CMD ["node","server.js"]

# FROM node:20
# WORKDIR /opt/server
# COPY *.json /opt/server
# COPY *.js /opt/server
# RUN npm install
# ENV REDIS_HOST="redis"\
# CATALOGUE_HOST= "catalogue"\
# CATALOGUE_PORT="8080" 
# CMD ["node","server.js"]
