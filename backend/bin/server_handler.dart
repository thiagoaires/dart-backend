import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();
    router.get('/', (Request req) {
      return Response(200, body: "primeira rota");
    });

    router.get('/ola/mundo/<user>',
        (Request req, String? user) => Response.ok('Ola mundo $user'));

    router.get("/dados", (Request req) {
      String? nome = req.url.queryParameters['nome'];
      String? idade = req.url.queryParameters["idade"];
      return Response.ok("Nome: $nome idade: $idade");
    });
    return router;
  }
}
