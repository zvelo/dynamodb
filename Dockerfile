FROM ubuntu:trusty
MAINTAINER Karen Joy Gacao  kgacao@zvelo.com

RUN apt-get update && apt-get install -y curl wget default-jre

RUN mkdir /app
WORKDIR /app

RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest -O dynamodb-local.tgz
RUN tar xzf dynamodb-local.tgz && rm -f dynamodb-local.tgz

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=/app/DynamoDBLocal_lib", "-jar", "/app/DynamoDBLocal.jar"]
