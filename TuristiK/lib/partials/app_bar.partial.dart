import 'package:app/models/customer.model.dart';
import 'package:app/modules/login/login.dart';
import 'package:app/services/api.service.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarNav extends StatefulWidget {
  final String navtitle;
  final bool backOption;
  final String? description;
  const AppBarNav(
      {super.key,
      required this.navtitle,
      required this.backOption,
      this.description});

  @override
  State<AppBarNav> createState() => _AppBarNavState();
}

class _AppBarNavState extends State<AppBarNav> {
  String customerName = '';
  @override
  void initState() {
    super.initState();
    setUserCustomerName();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        bottom: 15,
      ),
      child: AppBar(
        backgroundColor: const Color.fromARGB(0, 59, 131, 246),
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              if (widget.backOption)
                IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white),
                    onPressed: () => Navigator.of(context).pop()),
              const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage("assets/images/world-map.jpg")),
              const SizedBox(
                width: 10,
              ),
              Text(customerName,
                  style: const TextStyle(
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
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.navtitle,
                        style: const TextStyle(
                            fontFamily: Styles.titleFont,
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    if (widget.description != null)
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: Text(
                          widget.description!,
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
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () async {
                  _mostrarConfirmacion(context);
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

  setUserCustomerName() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var getToken = sharedPreferences.getString('currentToken');
    Map<String, dynamic> jwtDecodeToken = JwtDecoder.decode(getToken!);

    Future<String> name = getUserCustomerName(jwtDecodeToken['id']);
    name.then((value) {
      setState(() {
        customerName = value;
      });
    });
  }

  Future<String> getUserCustomerName(String userId) async {
    try {
      Customer? customer = await ApiService.getCustomerByUserId(userId);
      return customer!.name;
    } catch (e) {
      throw Exception("Información no disponible.");
    }
  }

  Future<void> _mostrarConfirmacion(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Color de fondo del cuadro de diálogo
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Borde del cuadro de diálogo
          ),
          title: const Text(
            'Cerrar Sesión',
            style: TextStyle(
                fontSize: 17,
                fontFamily: Styles.titleFont,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis),
            maxLines: 2,
          ),
          content: const Text(
            '¿Está seguro que desea cerrar la sesión?',
            style: TextStyle(
                fontSize: 16,
                fontFamily: Styles.textFont,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis),
            maxLines: 2,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.remove('currentToken');
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Login())); // Respuesta positiva
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(1000, 59, 130, 246),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(
                      fontFamily: Styles.secondTitlefont,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(color: Styles.blue),
                      ),
                    ),
                    surfaceTintColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        } else {
                          return Colors.white;
                        }
                      },
                    ),
                  ),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      fontFamily: Styles.secondTitlefont,
                      color: Styles.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
