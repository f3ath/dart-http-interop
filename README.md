# http_interop
A thin package to allow interoperability between different HTTP client and server implementations in Dart.

There are many cases where all you need is just a simple HTTP message exchange between a client and a server. 
This package provides a set of interfaces and models to decouple from the underlying client and/or server implementations.
This means less boilerplate code and easier testing.

Please see these implementations:
- [http_interop_http](https://pub.dev/packages/http_interop_http) - wrapper over the standard Dart http client
- [http_interop_io](https://pub.dev/packages/http_interop_io) - wrapper over the dart:io server
