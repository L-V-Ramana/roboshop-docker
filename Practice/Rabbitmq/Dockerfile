FROM rabbitmq
RUN docker run -d --hostname my-rabbit --name some-rabbit -e RABBITMQ_DEFAULT_USER=roboshop  -e RABBITMQ_DEFAULT_PASS=roboshop123 rabbitmq:3-management
WORKDIR /var/lib/rabbitmq
