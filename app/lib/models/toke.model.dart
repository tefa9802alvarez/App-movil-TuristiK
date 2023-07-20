class Token{

  final bool success;
  final String message;
  final String result;

  Token({required this.success, required this.message, required this.result});

}


class UserLog{

  final String sub;
  final String jti;
  final String iat;
  final String id;
  final String userName;
  final String email;
  final String iss;
  final String aud;
  final String role;
  final String roleId;

  UserLog({required this.sub, required this.jti, required this.iat, required this.id, required this.userName, required this.email, required this.iss, required this.aud, required this.role, required this.roleId});
}

