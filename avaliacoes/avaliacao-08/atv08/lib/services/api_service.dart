import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';

class ApiService {
  static Future<List<Usuario>> buscarUsuarios() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    final resposta = await http.get(url);
    if (resposta.statusCode == 200) {
      final List<dynamic> dados = json.decode(resposta.body);
      return dados.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar dados da API');
    }
  }
}
