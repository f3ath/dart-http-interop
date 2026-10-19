# http_interop

A lightweight package for interoperability between HTTP client and server
implementations in Dart. It defines `Request` and `Response` classes and a shared
client/server `Handler` type: `Future<Response> Function(Request request)`.

## Motivation

HTTP APIs are a common way for clients and servers to communicate. The
[pub.dev API](https://pub.dev/help/api) is one example.

Building an API client on a specific HTTP implementation can tightly couple your
library to that implementation. This can make unit tests depend on complex mocks
or require end-to-end tests, limiting coverage and making tests harder to maintain.

## Solution

Implement a `Handler` function to separate your API logic from the underlying HTTP
implementation. `Request` and `Response` are simple Dart classes that you can
construct and inspect directly in tests.

## Pros

- Decouples application logic from the underlying HTTP implementation.
- Simplifies tests for both clients and servers.
- Allows tests to run without an HTTP stack.
- Lets users choose or switch HTTP implementations.

## Cons

- Provides limited support for streaming APIs, long polling, and WebSockets.
- Adds a dependency to your library.
- Requires consumers to depend on both the interop package and an adapter package.

## Existing implementations

- [http_interop_http](https://pub.dev/packages/http_interop_http): an adapter for
  `package:http`.
- [http_interop_io](https://pub.dev/packages/http_interop_io): adapters for
  `dart:io` clients and servers.
- [http_interop_dio](https://pub.dev/packages/http_interop_dio): an adapter for Dio.

## Projects using http_interop

- [json_api](https://pub.dev/packages/json_api): a JSON:API client and server library.
