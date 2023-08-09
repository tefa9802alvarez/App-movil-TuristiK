import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment{
  static String get fileName{

    //environment variable for production 
    if (kReleaseMode) {  
      return '.env.production';  
    }
    
    return '.env.development';
    
  }

  static String get apiUrl{
    return dotenv.env['TURISTIK_API_URL'] ?? 'TURISTIK_API_URL no encontrada';
  }
}