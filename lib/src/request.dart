import 'package:http_interop/http_interop.dart';

/// An HTTP request sent by a client and received by a server.
///
/// The method is stored as supplied. Transport adapters are responsible for
/// validating outgoing request methods.
final class Request(
  /// The request method, without validation or normalization.
  final String method,

  /// The requested URI.
  final Uri uri,
  super.body,
  super.headers,
) extends Message;
