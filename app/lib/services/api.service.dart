import 'dart:convert';
import 'package:app/models/toke.model.dart';
import 'package:http/http.dart';
class ApiService {

  //private endpoint: string = environment.endPoint
  static String endpoint = Environment.endPoint;


  static Future<Token> signIn(String email, String password) async {
    final url = "${endpoint}api/Login/"; 
    final response = await post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json', // Especifica que el cuerpo de la solicitud es JSON
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      // La solicitud fue exitosa, puedes procesar la respuesta aquí
      String body = utf8.decode(response.bodyBytes);
      final data = jsonDecode(body);
      return data;
      // Hacer algo con la respuesta, como guardar el token en una variable, etc.
    } else {
      throw Exception('Error en la solicitud de inicio de sesión');
    }
  }

}

class Environment {
  static const endPoint = "https://10.0.2.2:7266/";
}