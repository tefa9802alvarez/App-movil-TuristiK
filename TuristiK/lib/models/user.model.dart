import 'customer.model.dart';
import 'role.model.dart';

class User{

  final String? userId;
  final String userName;
  final String email;
  final String password;
  final String? roleId;
  final int status;

  final Role? role;
  final Customer? costumer;

  User(this.userId, this.userName, this.email, this.password, this.roleId, this.status, this.role, this.costumer);

  

    
}