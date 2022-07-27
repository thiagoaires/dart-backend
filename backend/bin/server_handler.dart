import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();
    router.get('/', (Request req) {
      return Response(200,
          body: "<h1>primeira rota</h1>",
          headers: {"content-type": "text/html"});
    });

    router.get('/ola/mundo/<user>',
        (Request req, String? user) => Response.ok('Ola mundo $user'));

    router.get("/dados", (Request req) {
      String? nome = req.url.queryParameters['nome'];
      String? idade = req.url.queryParameters["idade"];
      return Response.ok("Nome: $nome idade: $idade");
    });

    router.post("/login", (Request req) async {
      var result = await req.readAsString();
      var json = jsonDecode(result);
      final user = json['login'];
      final password = json['password'];
      if (user == 'adm' && password == '123') {
        final Map<String, dynamic> obj = {
          "token": "65454asxcpt4",
          "user_id": 2
        };
        final String json = jsonEncode(obj);
        return Response.ok(json, headers: {"content-type": "application/json"});
      }
      return Response.forbidden("Acesso negado!");
    });

    return router;
  }
}
