import 'package:app/modules/login/login.dart';
import 'package:flutter/material.dart';


class AppBarNav extends StatelessWidget {
  final String navtitle;
  const AppBarNav({super.key, required this.navtitle});

  @override
  Widget build(BuildContext context) {
    return 
      AppBar(
        backgroundColor: Colors.white,
        title:  
        Padding(
          padding: const EdgeInsets.only(left:10,top: 10),
          child: Text(navtitle,style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color:  Color.fromARGB(1000, 59, 130, 246)
          )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10,top: 10),
            child: IconButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>const Login()));
            },icon: const Icon(
              Icons.logout_sharp,color: Color.fromARGB(1000, 59, 130, 246),size: 25,
            )),
          ),
        ],
        automaticallyImplyLeading: false,
      );
  }
}