# http_interop
This is a tiny package allowing interoperability between different HTTP client and server implementations in Dart.
It defines the HTTP `Request` and `Response` classes and the universal slient/server `Handler` interface with a single 
method `Future<Response> handle(Request request)`.

## Motivation
One of the most popular solutions for client-server interaction is an HTTP API where each request and each response
fit in a single HTTP message. One good example is the [pub.dev API](https://pub.dev/help/api). It is a common task, given such an API
to implement a client (or a server, or both if you're lucky enough) for it. To do that, you'd need to base your API client on top of
an HTTP client which entails the risks of a close coupling with a particular HTTP client implementation. Related to this is the question
of testability. It is likely to lead to some unwanted mocking in the unit-level tests or to resorting to end-to-end tests. Either case
can limit the coverage or make testing cumbersome.

## Solution
Using this package, instead of coupling to a certain HTTP-level implementation, one may just implement a single `handle()` method. The `Request`
and `Response` are simple Dart classes which can be instantiated and analyzed directly in the tests. They have a simple API. As a developer,
you're free to extend any or both of these classes or to make your own implementation. 

## Pros
- The code gets decoupled from undelying HTTP delivery mechanism
- The tests get cleaner and simpler whether you're writing a client or a server.
- No need for HTTP stack in the tests.
- Your customers can use their favorite HTTP client or server with your library. They can even switch between the clients.

## Cons
- Your abilities might be limited if you're using a streaming api, long polling or web sockets.
- Your library will get another depency.
- Your customers' projects will get at least 2 more dependencies (the interop package itself and the client/server wrapper)

## Existing implementation
- [http_interop_http](https://pub.dev/packages/http_interop_http) - a wrapper over the standard Dart HTTP client
- [http_interop_io](https://pub.dev/packages/http_interop_io) - wrappers over the dart:io server and client
- [http_interop_dio](https://pub.dev/packages/http_interop_dio) - a wrapper over Dio HTTP client adapter

## Where http_interop is used
- [json_api](https://pub.dev/packages/json_api) - JSON:API client/server
