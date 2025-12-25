FROM maven 
WORKDIR /opt/server
COPY pom.xml /opt/server
COPY src /opt/server/src
RUN mvn clean package
RUN mv /opt/server/target/shipping-1.0.jar /opt/server/shipping.jar 
ENV CART_ENDPOINT="cart:8080"  \
    DB_HOST="mysql" \
    DB_DRIVER=com.mysql.cj.jdbc.Driver \
    DB_URL=jdbc:mysql://mysql:3306/shipping?allowPublicKeyRetrieval=true&useSSL=false \
    DB_USER=root \
    DB_PASS=@RoboShop1 \
CMD ["java","-jar","shipping.jar"]