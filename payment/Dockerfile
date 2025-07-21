FROM PYTHON:3.9
WORKDIR /opt/server
EXPOSE 8080
COPY *.py .
COPY payment.ini .
COPY requirements.txt .
RUN pip3 install -r requirements.txt
# ENV using from compose
#     CART_HOST=cart\
#     CART_PORT=8080\
#     USER_HOST=user\
#     USER_PORT=8080\
#     AMQP_HOST=rabbitmq\
#     AMQP_USER=roboshop\
#     AMQP_PASS=roboshop123
CMD ["uwsgi","--ini","payment.ini"]