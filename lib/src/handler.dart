import 'package:http_interop/src/request.dart';
import 'package:http_interop/src/response.dart';

/// Handles the [Request] and asynchronously returns a [Response].
typedef Handler = Future<Response> Function(Request);
