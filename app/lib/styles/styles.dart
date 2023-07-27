
import 'package:flutter/material.dart';

class Styles{

  //<-----------------FONTS------------------------>
  static const mainFont = 'Poppins';
  static const titleFont = 'Poppins';

  //<------------------COLORS---------------------->
  static const Color blue = Color.fromARGB(1000, 59, 130, 246);
  

  static const Color green = Colors.green;
  static const Color lightGreen = Color.fromARGB(1000,202,241,216);

  static Color grey = Colors.grey.shade600;
  static const Color lightGrey = Color.fromARGB(1000, 226, 232, 240);

  static const Color red = Color.fromARGB(1000,255,98,89);
  static const Color lightred = Color.fromARGB(1000,255,208,206);

  static const Color yellow = Color.fromARGB(1000,209,160,7);
  static const Color lightYellow = Color.fromARGB(1000,248,227,165);

  static const Color cyan = Color.fromARGB(1000,6,182,212);
  static const Color lightCyan = Color.fromARGB(1000,6,182,212);


  //<-----------------ICONS------------------------>

  //Retornar icono de acuerdo al status
  static Icon statusIcon(int status,String module){

    //Icon By Default
    Icon icon = Icon(Icons.disabled_by_default,color: grey,);

    //Icono Pendiente
    if (status == 0 && (module == "payments" || module == "orders")) {
      icon = const Icon(Icons.access_time_filled ,color: yellow,size: 25,);
    }

    //Icono Aceptado/Pagado
    if ((status == 2 && module == "orders") || (status == 1 && module == "payments") ) {
      icon = const Icon(Icons.check_circle,color: green,size: 25,);
    }

    //Icono Cancelado/Rechazado
    if ((status == 3 && module == "orders") || (status == 2 && module == "payments") ) {
      icon = const Icon(Icons.cancel ,color: red,size: 25,);
    }

    //Icono En Curso
    if (status == 1 && module == "orders") {
      icon = const Icon(Icons.hourglass_top_rounded,color: cyan,size: 25,);
    }

    return icon;
  }  

  //Retornar ligth color  de acuerdo al status
  static Color statusColorContainer(int status,String module){
    Color color = lightGrey;

    //Color Pendiente
    if (status == 0 && (module == "payments" || module == "orders")) {
      color = lightYellow;
    }

    //Color Aceptado/Pagado
    if ((status == 2 && module == "orders") || (status == 1 && module == "payments") ) {
      color = lightGreen;
    }

    //Color Cancelado/Rechazado
    if ((status == 3 && module == "orders") || (status == 2 && module == "payments") ) {
      color = lightred;
    }

    //Color En Curso
    if (status == 1 && module == "orders") {
      color = lightCyan;
    }
    
    return color;

  }  

  //Retornar ligth color  de acuerdo al status
  static Color statusColorText(int status,String module){
    Color color = grey;

    //Color Pendiente
    if (status == 0 && (module == "payments" || module == "orders")) {
      color = yellow;
    }

    //Color Aceptado/Pagado
    if ((status == 2 && module == "orders") || (status == 1 && module == "payments") ) {
      color = green;
    }

    //Color Cancelado/Rechazado
    if ((status == 3 && module == "orders") || (status == 2 && module == "payments") ) {
      color = red;
    }

    //Color En Curso
    if (status == 1 && module == "orders") {
      color = cyan;
    }
    
    return color;

  }  

}