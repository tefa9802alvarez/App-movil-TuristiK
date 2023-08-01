import 'package:app/modules/login/login.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppBarNav extends StatelessWidget {
  final String navtitle;
  final bool backOption;
  final String? description;
  const AppBarNav({super.key, required this.navtitle,required this.backOption,this.description});


  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: AppBar(
          backgroundColor: const Color.fromARGB(0, 247, 246, 252),
    
          leading: backOption == false ? null
           : IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded , color: Styles.grey),
            onPressed: () => Navigator.of(context).pop()),
          title:  
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(navtitle,style: const TextStyle(
                      fontFamily: Styles.titleFont,
                      fontSize: 20,
                      color: Styles.blue,
                      fontWeight: FontWeight.bold
                    )),
                    if (description!=null) Container(
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
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(onPressed: () async{
                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.remove('currentToken');
                // ignore: use_build_context_synchronously
                Navigator.push(context,MaterialPageRoute(builder: (context)=>const Login()));
              },icon: const Icon(
                FontAwesomeIcons.rightFromBracket,color: Styles.blue,size: 25,
              )),
            ),
          ],
          automaticallyImplyLeading: backOption,
        ),
      );
  }
}