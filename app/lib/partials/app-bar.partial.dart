import 'package:app/modules/login/login.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';


class AppBarNav extends StatelessWidget {
  final String navtitle;
  final bool backOption ;
  const AppBarNav({super.key, required this.navtitle,required this.backOption});

  @override
  Widget build(BuildContext context) {
    return 
      AppBar(
        backgroundColor: Styles.blue,
        title:  
        Padding(
          padding: const EdgeInsets.only(left:10,top: 10),
          child: Text(navtitle,style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            //color:  Color.fromARGB(1000, 59, 130, 246)
            color: Colors.white
          )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10,top: 10),
            child: IconButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>const Login()));
            },icon: const Icon(
              //Icons.logout_sharp,color: Color.fromARGB(1000, 59, 130, 246),size: 25,
              Icons.logout_rounded,color: Colors.white,size: 25,
            )),
          ),
        ],
        automaticallyImplyLeading: backOption,
      );
  }
}