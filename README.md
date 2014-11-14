[![wercker status](https://app.wercker.com/status/bfc983f0e36f3ee6a72e05aeaa603af5/s "wercker status")](https://app.wercker.com/project/bykey/bfc983f0e36f3ee6a72e05aeaa603af5)

### README

zvelo-dynamodb is a datastore service built from Amazon's DynamoDB Local, which is a small client-side database and server that mimics the DynamoDB service. DynamoDB is a fully managed NoSQL database service that provides fast and predictable performance with seamless scalability.

Read more on Amazon's DynamoDB Local: [Developer's Guide](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html)

Read more on Amazon's DynamoDB: [Introduction to DynamoDB](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html)

### To Run the Server

To run without parameters to see help:
```bash
	docker run -i -t zvelo/zvelo-dynamodb
```

To run with persistent data directory:
```bash
	docker run -d -p 8000:8000 zvelo/zvelo-dynamodb -port 8000
```

To run with data in-memory only:
```bash
	docker run -d -p 8000:8000 zvelo/zvelo-dynamodb -inMemory -port 8000
```

To run using fleet:
```bash
    fleetctl submit zvelo-dynamodb.service
    fleetctl start zvelo-dynamodb.service
```

### Client Objects

In reference to Amazon's Development Guide, To use DynamoDB Local with an application program, you need to configure your client so that it can communicate with the DynamoDB Local endpoint. The way that you do this depends on what programming language and AWS software development kit (SDK) you are using.

For Java: [Using the AWS SDK for Java](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/AboutJava.html)
For .Net: [Using the AWS SDK for .NET](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/UsingAWSsdkForDotNet.html)
For  PHP: [Using the AWS SDK for PHP](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/UsingAWSSDK.html)


DynamoDB Local is also bundled with a JavaSript Shell to help jump-start usage development of DynamoDB. 
You can access this in the following URL: http://localhost:8000/shell 







