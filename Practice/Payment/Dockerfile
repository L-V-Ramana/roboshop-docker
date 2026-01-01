# FROM python:3.9
# WORKDIR /opt/server 
# COPY payment.ini /opt/server
# COPY requirements.txt /opt/server
# COPY *.py /opt/server
# RUN pip3 install -r requirements.txt
# #we can set the envronmnet in the Dockerfile or dockercompose for payment and rabbotmq siva has set env in docker compose
# ENV CART_HOST="cart"\     
# CART_PORT="8080"\ 
# USER_HOST="user"\
# USER_PORT="8080"\
# AMQP_HOST="rabbitmq"\
# AMQP_USER="roboshop"\
# AMQP_PASS="roboshop123"
# CMD ["uwsgi","--ini","payment.ini"]




# FROM python:3.9
# WORKDIR /opt/server
# COPY requirements.txt /opt/server

# RUN pip3 install -r requirements.txt

# FROM python:3.14.2-alpine3.22
# # RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
# ENV CART_HOST="cart" \
# CART_PORT="8080" \
# USER_HOST="user" \
# USER_PORT="8080" \  
# AMQP_HOST="rabbitmq" \
# AMQP_USER="roboshop" \
# AMQP_PASS="roboshop123"
# COPY payment.ini /opt/server
# COPY *.py /opt/server
# RUN pip3 install -r requirements.txt
# # USER roboshop
# CMD ["uwsgi","--ini","payment.ini"]

# ---------- Stage 1: Builder ----------
FROM python:3.11-alpine3.19 AS builder

# Install build dependencies for compiling Python packages
RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev

WORKDIR /build

# Copy dependency list and install
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt
RUN pip install --no-cache-dir --prefix=/install uwsgi
# ---------- Stage 2: Final Runtime ----------
FROM python:3.11-alpine3.19

WORKDIR /app

# Copy only installed dependencies from builder stage
COPY --from=builder /install /usr/local

# Create non-root user
RUN adduser -D -u 1001 roboshop \
    && chown -R roboshop:roboshop /app

# Copy app code
COPY payment.ini . 
COPY *.py .

USER roboshop

EXPOSE 8080
CMD ["uwsgi","--ini","payment.ini"]
