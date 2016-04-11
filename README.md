# dynamodb

dynamodb is a datastore service built from Amazon's DynamoDB Local, which is a small client-side database and server that mimics the DynamoDB service. DynamoDB is a fully managed NoSQL database service that provides fast and predictable performance with seamless scalability.

Read more on Amazon's DynamoDB Local: [Developer's Guide](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html)

Read more on Amazon's DynamoDB: [Introduction to DynamoDB](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html)

## To Run the Server

To run without parameters to see help:

```bash
$ docker run -it zvelo/dynamodb
```

## Notes for developers

This container is only intended for use in development. In development, it is technically available using service discovery (the default port is 8000). **HOWEVER**, in production, dynamodb will be accessed using an Amazon URI. To abstract these differences, the recommended approach is to rely on `envetcd`. By setting a global key in development as follows:

The following keys should be set in etcd

```bash
/config/global/aws/access-key
/config/global/aws/disable-ssl
/config/global/aws/endpoint
/config/global/aws/region
/config/global/aws/secret-access-key
```

Or as environment variables:

```bash
AWS_ACCESS_KEY=something
AWS_DISABLE_SSL=true
AWS_ENDPOINT=172.17.8.101:8001
AWS_REGION=zvelo
AWS_SECRET_ACCESS_KEY=something
```

With this key set, using `envetcd`, any service in the development cluster will have the variables set. Because the dynamodb local development tool is still available using service discovery, the hardcoded uri and port will work even if dynamodb is not running on that particular host (in this example `172.17.8.101`, also note that in development, the port `8001` is fixed and can be used reliably in the config value).

This way, in production, services can still rely on the variables existing even when dynamodb is not running within the cluster and available using service discovery.

## Client Objects

In reference to Amazon's Development Guide, To use DynamoDB Local with an application program, you need to configure your client so that it can communicate with the DynamoDB Local endpoint. The way that you do this depends on what programming language and AWS software development kit (SDK) you are using.

For Java: [Using the AWS SDK for Java](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/AboutJava.html)

For .Net: [Using the AWS SDK for .NET](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/UsingAWSsdkForDotNet.html)

For  PHP: [Using the AWS SDK for PHP](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/UsingAWSSDK.html)

DynamoDB Local is also bundled with a JavaSript Shell to help jump-start usage development of DynamoDB. You can access this in the following URL: `http://localhost:8000/shell`
