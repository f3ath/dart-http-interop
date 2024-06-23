import 'package:http_interop/src/request.dart';
import 'package:http_interop/src/response.dart';

/// Handles the [request] and returns a [Response].
typedef Handler = Future<Response> Function(Request request);
