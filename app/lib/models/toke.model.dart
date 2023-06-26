class Token{

  final bool success;
  final String message;
  final String result;

  Token(this.success, this.message, this.result);

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

  UserLog(this.sub, this.jti, this.iat, this.id, this.userName, this.email, this.iss, this.aud, this.role, this.roleId);
}

