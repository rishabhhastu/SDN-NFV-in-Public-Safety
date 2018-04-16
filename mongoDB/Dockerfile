FROM mongo

EXPOSE 27017

RUN   apt-get update -y && \
    apt-get install net-tools iputils-ping vim -y

CMD ["mongod"]
