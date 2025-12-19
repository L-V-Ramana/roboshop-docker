FROM maven 3.5
WORKDIR /opt/server
COPY pom.xml /opt/server
COPY src/* /opt/server
RUN mvn clean package
RUN mv  /opt/servertarget/shipping-*.jar /opt/servershipping.jar 
ENV CART_ENDPOINT=cart:8080  \
    DB_HOST=mysql
CMD ["java","-jar","shipping.jar"]