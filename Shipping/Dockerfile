FROM maven:3.5
WORKDIR /opt/server
COPY src /opt/server
COPY pom.xml .
RUN mv /opt/servertarget/shipping-1.0.jar /opt/server/shipping.jar 
RUN mvn clean package
ENV CART_ENDPOINT="cart:8080"\
    DB_HOST="mysql"
CMD ["java -jar","shipping.jar"]