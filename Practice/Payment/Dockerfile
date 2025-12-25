FROM python:3.9
WORKDIR /opt/server 
COPY payment.ini /opt/server
COPY requirements.txt /opt/server
COPY *.py /opt/server
RUN pip3 install -r requirements.txt
#we can set the envronmnet in the Dockerfile or dockercompose for payment and rabbotmq siva has set env in docker compose
ENV CART_HOST=cart\     
CART_PORT=8080\ 
USER_HOST=user\
USER_PORT=8080\
AMQP_HOST=rabbitmq\
AMQP_USER=roboshop
AMQP_PASS=roboshop123
CMD ["uwsgi","--ini","payment.ini"]