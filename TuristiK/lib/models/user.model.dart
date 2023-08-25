import 'customer.model.dart';
import 'role.model.dart';

class User{

  final String? userId;
  final String email;
  final String password;
  final String? roleId;
  final int status;

  final Role? role;
  final Customer? customer;

  User({
    required this.userId,
    required this.email, 
    required this.password, 
    required this.roleId, 
    required this.status, 
    this.role, 
    this.customer});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId : json["userId"],
      email : json["email"],
      password : json["password"],
      roleId : json["roleId"],
      status :  json["status"],
    );
  }

  

    
}