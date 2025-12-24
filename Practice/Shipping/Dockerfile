FROM maven 
WORKDIR /opt/server
COPY pom.xml /opt/server
COPY src /opt/server/src
RUN mvn clean package
RUN mv /opt/servertarget/shipping-1.0.jar /opt/servershipping.jar 
ENV CART_ENDPOINT=cart:8080  \
    DB_HOST=mysql
CMD ["java","-jar","shipping.jar"]