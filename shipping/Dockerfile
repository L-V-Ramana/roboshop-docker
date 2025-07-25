FROM maven apline:3.21 AS builder
WORKDIR /opt/server
COPY /src/main /opt/server/src
COPY pom.xml /opt/server
COPY db /opt/server
RUN mvn clean package 
RUN mv target/shipping-1.0.jar shipping.jar 

FROM maven alpine3.21
WORKDIR /opt/server
RUN  addgroup -S roboshop && adduser -S roboshop -G roboshop
ENV CART_ENDPOINT="cart:8080"\
    DB_HOST="mysql"

COPY --from=builder /opt/server /opt/server
USER roboshop
CMD ["java","-jar","shipping.jar"]


# FROM maven
# WORKDIR /opt/server
# COPY pom.xml .
# COPY src /opt/server/src
# RUN mvn clean package
# RUN mv /opt/server/target/shipping-1.0.jar /opt/server/shipping.jar
# ENV CART_ENDPOINT="cart:8080" \
#     DB_HOST="mysql"
# CMD ["java","-jar","shipping.jar"]