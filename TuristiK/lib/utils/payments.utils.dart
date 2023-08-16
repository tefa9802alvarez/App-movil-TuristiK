import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class PaymentUtils{

  static String statusToText(int status){
    String text = "Pendiente";
    if (status == 1) {
      text = "Aceptado";
    }else if (status == 2) {
      text = "Rechazado";
    }
    return text;
  }

  static Future<String> formatDate(DateTime date) async {
    try {
      await initializeDateFormatting('es_ES', null);
      String formattedDateTime = DateFormat('dd MMM y', 'es_ES').format(date);
      return formattedDateTime;
    } catch (e) {
      return 'Fecha no disponible'; 
    }
  }

}