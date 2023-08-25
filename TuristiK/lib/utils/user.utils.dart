import 'package:app/models/user.model.dart';
import 'package:app/services/api.service.dart';

class UserUtils{
  
  static Future<User?> getUserByEmail(String email) async {   
    try {
      User? user = await ApiService.getUserByEmail(email);
      return user;
    } catch (e) {
      throw Exception("Información inválida");
    }
  }
 
}