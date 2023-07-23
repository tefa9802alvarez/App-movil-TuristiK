
import 'dart:convert';
import 'package:app/models/order.model.dart';
import 'package:http/http.dart' as http;
class ApiService {

  //private endpoint: string = environment.endPoint
  static String endpoint = Environment.endPoint;
  
  static Future<List<Order>> getOrders() async{
    //print("llego a orders");
    var url = Uri.parse("$endpoint/Order");
    List<Order> orderList =[];

    final response = await http.get(url);

    if (response.statusCode==200) {
      final data = List.from(jsonDecode(response.body));

      for (var o in data) {     
        final order = Order.fromJson(o);
        orderList.add(order);
      }
      
    }
    return orderList;
  }

}

class Environment {
  static const endPoint = "https://192.168.1.5:7266/api";
  //static const endPoint = "https://10.0.2.2:7266/api";
}