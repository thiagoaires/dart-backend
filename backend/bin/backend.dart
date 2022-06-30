import 'package:backend/backend.dart' as backend;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main(List<String> args) async {
  final server = await shelf_io.serve(
      (req) => Response(200, body: 'ok'), 'localhost', 8081);

  print("Server started @ http://localhost:8081");
}
