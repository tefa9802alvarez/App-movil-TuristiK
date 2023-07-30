
import 'dart:convert';
import 'package:app/models/customer.model.dart';
import 'package:app/models/order.model.dart';
import 'package:app/models/toke.model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  //static const endPoint = "https://127.0.0.1:7266/api";
  static const String endPoint = "https://localhost:7266/api";

  static Future<List<Order>> getOrdersByCustomerId(String customerId) async{
    List<Order> orderList =[];
    var url = Uri.parse("$endPoint/Order");
    
    final response = await http.get(url);
    // var customer = "5e505bba-d3f6-4439-f906-08db8c8e001d";
    if (response.statusCode==200) {
      final data = List.from(jsonDecode(response.body));
      for (var o in data) {  
        final order = Order.fromJson(o);
        if (order.customerId == customerId && order.status != 3) {
          orderList.add(order);
        } 
      }
      
    }
    return orderList;
  }

  static Future<Customer?> getCustomerById(String customerId) async{
    
    Customer? customer;   
    var url = Uri.parse("$endPoint/Customer/$customerId");
    final response = await http.get(url);
   
    if (response.statusCode==200) {
      final data = jsonDecode(response.body);
      customer = Customer.fromJson(data);
    }else{
      customer = null;
    }
    return customer;
  }

  static Future<Token> login(String email, String password) async {
      try {

        var url = Uri.parse("$endPoint/Login/");
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'email': email,
            'password': password,
          }),
        );
        if (response.statusCode == 200) {
          // La solicitud fue exitosa, puedes procesar la respuesta aquí
          final data = jsonDecode(response.body);
          return Token.fromJson(data); // Suponiendo que la clase Token tiene un constructor fromJson
        } else {
          throw Exception('Error en la solicitud de inicio de sesión');
        }
      } catch (e) {
        throw Exception('Error en la solicitud de inicio de sesión');
      }
  }
  
}


