class CustomerUtils{
  
  static Future<String> calculateDate(DateTime date) async {   
    DateTime fechaNacimiento = date;
    DateTime fechaActual = DateTime.now();
    Duration diferencia = fechaActual.difference(fechaNacimiento);
    int edad = diferencia.inDays ~/ 365;
    return "${edad.toString()} Años";
  }
}