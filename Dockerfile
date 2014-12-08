FROM debian:wheezy
MAINTAINER Karen Joy Gacao kgacao@zvelo.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl default-jre \
	&& apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

ENV DYNAMODB_DOWNLOAD_URL http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest

RUN curl -sSL "$DYNAMODB_DOWNLOAD_URL" -o dynamodb-local.tgz \
  && tar -xzf dynamodb-local.tgz \
  && rm dynamodb-local.tgz

RUN mkdir /data
WORKDIR /data

EXPOSE 8001
ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=/app/DynamoDBLocal_lib", "-jar", "/app/DynamoDBLocal.jar", "-dbPath", "/data", "-port", "8001"]
