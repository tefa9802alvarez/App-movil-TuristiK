import 'package:app/modules/login/login.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';


class AppBarNav extends StatelessWidget {
  final String navtitle;
  final bool backOption ;
  final String? description;
  const AppBarNav({super.key, required this.navtitle,required this.backOption,this.description});

  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AppBar(
          backgroundColor: Styles.lightGrey,
          title:  
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(navtitle,style: const TextStyle(
                  fontFamily: Styles.titleFont,
                  fontSize: 20,
                  color: Styles.blue,
                  fontWeight: FontWeight.bold
                )),
                description!=null 
                ?
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: Text(description!,style: TextStyle(
                    fontFamily: Styles.textFont,
                    fontSize: 15,
                    color: Styles.grey,
                    fontWeight: FontWeight.w100,
                    overflow: TextOverflow.ellipsis
                  ),
                  maxLines: 2,),
                )
                : 
                const Text("")
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 10),
              child: IconButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>const Login()));
              },icon: const Icon(
               Icons.account_circle,color: Styles.blue,size: 35,
                //Icons.logout_rounded,color: Colors.white,size: 25,
              )),
            ),
          ],
          automaticallyImplyLeading: backOption,
        ),
      );
  }
}