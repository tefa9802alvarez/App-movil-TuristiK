
import 'dart:convert';
import 'package:app/models/customer.model.dart';
import 'package:app/models/email.model.dart';
import 'package:app/models/environment.dart';
import 'package:app/models/order.model.dart';
import 'package:app/models/package.model.dart';
import 'package:app/models/payment.model.dart';
import 'package:app/models/token.model.dart';
import 'package:app/models/user.model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static String? endPoint = Environment.apiUrl;

   static Future<User?> getUserByEmail(String email) async{
    
    User? userRecover;   
    var url = Uri.parse("$endPoint/User/");
    final response = await http.get(url);
   
    if (response.statusCode==200) {
      final data = List.from(jsonDecode(response.body));
      for (var u in data) { 
        final user = User.fromJson(u);
        if (user.email == email) {
          userRecover = user;
        } 
      }  
    }else{
      userRecover = null;
    }
    return userRecover;
  }

  static Future<String> updateUser(User model) async {
      try {       
        var userId = model.userId;
        var url = Uri.parse("$endPoint/User/$userId");  
        final response = await http.put(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "userId": model.userId,
            "email": model.email,
            "password": model.password,
            "status": model.status,
            "roleId": model.roleId
          }),
        );
        if (response.statusCode == 204) {
          return "ok";
        } else {
          return "no";
        }
        
      } catch (e) {
        throw Exception(e);
      }
  }

  
  static Future<List<Order>> getOrdersByCustomerId(String customerId) async{
    List<Order> orderList =[];
    var url = Uri.parse("$endPoint/Order");
    final response =  await http.get(url);
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

  static Future<List<Package>> getPackages() async{

      List<Package> packageList =[];
      var url = Uri.parse("$endPoint/Package");
      
      final response = await http.get(url);
      if (response.statusCode==200) {
        final data = List.from(jsonDecode(response.body));

        for (var p in data){  
          final package = Package.fromJson(p);
          packageList.add(package);
        }    
      }

      return packageList;
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

  static Future<Customer?> getCustomerByUserId(String userId) async{
    
    Customer? customer;   
    var url = Uri.parse("$endPoint/Customer/ByUser/$userId");
    final response = await http.get(url);
   
    if (response.statusCode==200) {
      final data = jsonDecode(response.body);
      customer = Customer.fromJson(data);
    }else{
      customer = null;
    }
    return customer;
  }
  
  static Future<List<Payment>> getPaymentsByOrderId(String orderId) async{
    List<Payment> paymentList =[];
    var url = Uri.parse("$endPoint/Payment/ByOrder/$orderId");
    
    final response = await http.get(url);
    if (response.statusCode==200) {
      final data = List.from(jsonDecode(response.body));
      for (var o in data) { 
        final payment = Payment.fromJson(o);
        if (payment.orderId == orderId && payment.status != 2) {
          paymentList.add(payment);
        } 
      }
    }
    return paymentList;
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
          final data = jsonDecode(response.body);
          return Token.fromJson(data); 
        } else {
          throw Exception('Error en la solicitud de inicio de sesión');
        }
      } catch (e) {
        throw Exception(e);
      }
  }

  static Future<String> sendRecoverPasswordMail(RecoverPasswordEmail mailBody) async {
      try {       
        var url = Uri.parse("$endPoint/Email/ResetPassword/");  
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'to': mailBody.to,
            'subject': mailBody.subject,
            'body': mailBody.body
          }),
        );
        
        if (response.statusCode == 200) {
          return "ok";
        } else {
          throw Exception('Error en la solicitud');
        }
        
      } catch (e) {
        throw Exception(e);
      }
  }

  static Future<bool> updatePassword(RecoverPasswordModel mailBody) async {
      try {       
        var url = Uri.parse("$endPoint/ChangePassword/");  
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'Id': mailBody.id,
            'currentPassword': mailBody.currentPassword,
            'newPassword': mailBody.newPassword,
            'type': mailBody.type
          }),
        );
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          return data['success'];
        } else {
          throw Exception('Error en la solicitud');
        }
        
      } catch (e) {
        throw Exception(e);
      }
  }

}


