import 'package:app/modules/login/login.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarNav extends StatelessWidget {
  final String navtitle;
  final bool backOption;
  final String? description;
  const AppBarNav(
      {super.key,
      required this.navtitle,
      required this.backOption,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        bottom: 15,
      ),
      child: AppBar(
        backgroundColor: const Color.fromARGB(0, 59, 131, 246),
        // leading: backOption == false
        //     ? null
        //     : IconButton(
        //         icon: const Icon(Icons.arrow_back_ios_new_rounded,
        //             color: Colors.white),
        //         onPressed: () => Navigator.of(context).pop()),
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              if (backOption)
                IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white),
                    onPressed: () => Navigator.of(context).pop()),
              
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/cute-gorilla-eating-banana-cartoon-vector-icon-illustration-animal-food-icon-concept-isolated-flat_138676-7628.jpg?w=740&t=st=1691090269~exp=1691090869~hmac=3f889d76d4559e8dae93aa97120b1f5d521babc1cd9b8f0533cb7b6e4d34da68"),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Estefanía",
                  style: TextStyle(
                      fontFamily: Styles.titleFont,
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(navtitle,
                      style: const TextStyle(
                          fontFamily: Styles.titleFont,
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  if (description != null)
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      constraints: const BoxConstraints(maxWidth: 250),
                      child: Text(
                        description!,
                        style: const TextStyle(
                            fontFamily: Styles.textFont,
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () async {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.remove('currentToken');
                  // ignore: use_build_context_synchronously
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                icon: const Icon(
                  FontAwesomeIcons.rightFromBracket,
                  color: Colors.white,
                  size: 20,
                )),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
    );
  }
}
