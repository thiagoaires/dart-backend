import 'package:backend/backend.dart' as backend;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import './server_handler.dart';

void main(List<String> args) async {
  final _server = ServeHandler();
  final server = await shelf_io.serve(_server.handler, 'localhost', 8081);

  print("Server started @ http://localhost:8081");
}
