class Token{

  final bool success;
  final String message;
  final String result;

  Token({required this.success, required this.message, required this.result});

 // Constructor fromJson para crear una instancia de Token desde un Map JSON
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      success: json['success'],
      message: json['message'],
      result: json['result'],
    );
  }

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

  factory UserLog.fromJson(Map<String, dynamic> json) {
    return UserLog(
      sub: json['sub'],
      jti: json['jti'],
      iat: json['iat'],
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      iss: json['iss'],
      aud: json['aud'],
      role: json['role'],
      roleId: json['roleId'],
    );
  }
}

