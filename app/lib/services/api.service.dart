
import 'dart:convert';
import 'package:app/models/customer.model.dart';
import 'package:app/models/order.model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static const endPoint = "https://127.0.0.1:7266/api";
  //static const String endPoint = "http://localhost:7266/api";

  static Future<List<Order>> getOrdersByCustomerId(String customerId) async{
    List<Order> orderList =[];
    var url = Uri.parse("$endPoint/Order");
    
    final response = await http.get(url);
   
    // var customer = "5e505bba-d3f6-4439-f906-08db8c8e001d";
    if (response.statusCode==200) {
      final data = List.from(jsonDecode(response.body));
      for (var o in data) {  
        final order = Order.fromJson(o);
        if (order.customerId == customerId) {
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
      // for (var c in data) {  
      //   final customerJson = Customer.fromJson(c);
      //   customer = customerJson;
      // }  
    }else{
      customer = null;
    }
    return customer;
  }

  // void getOrders() async {
  // final response = await get(url);
  // if (response.statusCode == 200){
  //   String body = utf8.decode(response.bodyBytes);
  //   final data = jsonDecode(body);
  //   print(data.toString());
  // }
}



/* class Environment {
  static const endPoint = "https://127.0.0.1:7266/api/Order";
  //static const endPoint = "http://127.0.0.1:7266/api";
  //static const endPoint = "https://10.0.2.2:7266/api";
} */

