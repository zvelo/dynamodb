FROM alpine:latest
MAINTAINER Joshua Rubin <jrubin@zvelo.com>
RUN apk --update add openjdk8-jre curl

RUN mkdir /app
WORKDIR /app

RUN curl -sSL https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz | tar -zx

RUN mkdir /data
WORKDIR /data

EXPOSE 8001
ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=/app/DynamoDBLocal_lib", "-jar", "/app/DynamoDBLocal.jar"]
CMD ["-dbPath", "/data", "-port", "8001"]
