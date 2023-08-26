import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class AppBarNavNotLogged extends StatefulWidget {
  const AppBarNavNotLogged(
      {super.key});

  @override
  State<AppBarNavNotLogged> createState() => _AppBarNavNotLoggedState();
}

class _AppBarNavNotLoggedState extends State<AppBarNavNotLogged> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        bottom: 15,
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Styles.blue),
                    onPressed: () => Navigator.of(context).pop()),
              const Text("Regresar",style: TextStyle(
                        color: Styles.blue,
                        fontSize: 17,
                        fontFamily: Styles.secondTitlefont))
            ]
          ),
        ),
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
