class RecoverPasswordEmail {
  final String? to;
  final String? subject;
  final String? body;

  RecoverPasswordEmail({required this.to, required this.subject, required this.body});

}

class RecoverPasswordModel {
  final String? id;
  final String? currentPassword;
  final String? newPassword;
  final String? type;

  RecoverPasswordModel({required this.id, required this.currentPassword, required this.newPassword, required this.type});

}