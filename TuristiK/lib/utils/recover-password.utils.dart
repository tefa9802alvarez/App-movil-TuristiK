import 'dart:math';
import 'package:app/models/email.model.dart';
import 'package:app/models/user.model.dart';
import 'package:app/services/api.service.dart';
import 'package:app/utils/user.utils.dart';
import 'package:bcrypt/bcrypt.dart';

class RecoverPasswordUtils {
  static Future<String?> updateUserPassword(String email) async {
    try {
      User? user = await UserUtils.getUserByEmail(email);
      if (user != null) {
        String newPassword = await generatePassword();
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(logRounds: 10));

        final userUpdate = User(
          userId: user.userId,
          email: user.email,
          password: hashedPassword,
          roleId: user.roleId,
          status: user.status,
        );

        String response = await ApiService.updateUser(userUpdate);
        if (response == "ok") {
          await sendMail(newPassword, userUpdate);
          return user.userId;
        }
      }

      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<bool> sendMail(String newPassword, User user) async {
    try {
      final mailBody = RecoverPasswordEmail(
          to: user.email, subject: "Recuperar Contraseña", body: newPassword);
      String response = await ApiService.sendRecoverPasswordMail(mailBody);
      if (response == "ok") {
        return true;
      } else {
        throw Exception("Error al enviar el correo de recuperación");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<bool> updateRecoveredPassword(String code, String password, String userId) async{
    try {
      final newPassword = RecoverPasswordModel(
      id: userId,
      currentPassword: code,
      newPassword: password,
      type: "Recovered");

      bool response = await ApiService.updatePassword(newPassword);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> generatePassword() async {
    var chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    var password = '';
    for (var i = 0; i < 8; i++) {
      password += chars[Random().nextInt(chars.length)];
    }
    return password;
  }
}
