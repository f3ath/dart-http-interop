# http_interop

This is a lightweight package that facilitates interoperability between different HTTP client and server implementations in Dart. 
It defines the `Request` and `Response` classes and a universal client/server `Handler` interface: `Future<Response> Function(Request request)`.

## Motivation

One of the most popular solutions for client-server interaction is an HTTP API where each request and response fit in a single HTTP message. 
A prime example is the [pub.dev API](https://pub.dev/help/api). Implementing a client (or server, or both) for such an API often involves basing your client on top of an HTTP client, 
leading to the risks of tight coupling with a particular HTTP client implementation. This coupling raises issues related to testability, potentially requiring unwanted mocking in unit-level tests or relying on end-to-end tests, both of which can limit coverage and make testing cumbersome.

## Solution

With this package, rather than coupling to a specific HTTP-level implementation, you can implement a single `Handler` function. The `Request` and `Response` classes are simple Dart classes that can be 
instantiated and analyzed directly in tests, offering a straightforward API.
## Pros

- Decouples code from underlying HTTP delivery mechanisms.
- Simplifies and cleans up tests, whether you're developing a client or a server.
- Eliminates the need for an HTTP stack in tests.
- Allows users to use their preferred HTTP client or server with your library, and they can even switch between clients.

## Cons

- Limited capabilities when using a streaming API, long polling, or web sockets.
- Introduces an additional dependency to your library.
- Adds at least two more dependencies (the interop package itself and the client/server wrapper) to your customers' projects.

## Existing Implementations

- [http_interop_http](https://pub.dev/packages/http_interop_http) - a wrapper over the standard Dart HTTP client.
- [http_interop_io](https://pub.dev/packages/http_interop_io) - wrappers over the dart:io server and client.
- [http_interop_dio](https://pub.dev/packages/http_interop_dio) - a wrapper over the Dio HTTP client adapter.

## Where http_interop is used

- [json_api](https://pub.dev/packages/json_api) - JSON:API client/server.
