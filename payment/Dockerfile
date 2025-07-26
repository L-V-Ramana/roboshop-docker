FROM python:3.13.5-alpine3.21 AS builder
WORKDIR /build
RUN apk add --no-cache python3-dev build-base linux-headers pcre-dev
COPY requirements.txt .
RUN pip3 install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.13.5-alpine3.21
EXPOSE 8080
WORKDIR /opt/server
# Runtime dependencies only
RUN apk add --no-cache pcre
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop

USER roboshop
# Copy installed Python packages from builder
COPY --from=builder /install /usr/local
# Copy application code
COPY --chown=roboshop:roboshop payment.ini .
COPY --chown=roboshop:roboshop *.py .
CMD ["uwsing""--ini" "payment.ini"]


# FROM python:3.9
# WORKDIR /opt/server
# EXPOSE 8080
# COPY *.py .
# COPY payment.ini .
# COPY requirements.txt .
# RUN pip3 install -r requirements.txt
# # ENV using from compose
# #     CART_HOST=cart\
# #     CART_PORT=8080\
# #     USER_HOST=user\
# #     USER_PORT=8080\
# #     AMQP_HOST=rabbitmq\
# #     AMQP_USER=roboshop\
# #     AMQP_PASS=roboshop123
# CMD ["uwsgi","--ini","payment.ini"]