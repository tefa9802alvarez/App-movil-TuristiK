import 'dart:async';

import 'package:app/models/token.model.dart';
import 'package:app/modules/orders/main.orders.dart';
import 'package:app/services/api.service.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? currentToken;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var _isObscured;
  late Token token;

  @override
  void initState() {
    super.initState();
    getValidateData().whenComplete(() async {
      // Agrega un punto y coma al final

      Timer(const Duration(seconds: 2), () {
        if (currentToken != null) {
          Map<String, dynamic> jwtDecodeToken =
              JwtDecoder.decode(currentToken!);
          String userId =
              jwtDecodeToken['id']; // Reemplaza la coma con un punto y coma
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainOrders(userId: userId),
            ),
          );
        }
      });
    });
    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(130),
      //   child: AppBar(
      //     backgroundColor: Colors.white,
      //     flexibleSpace: ClipPath(
      //       clipper: WaveClipper(),
      //       child: Container(
      //         decoration: const BoxDecoration(
      //           gradient: LinearGradient(
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //             colors: [Styles.blue, Styles.blue],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              height: 550,
              padding:
                  const EdgeInsets.symmetric(vertical: 35.0, horizontal: 35.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 100,
                            child: SvgPicture.asset(
                              'assets/images/login_image.svg',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("¡Bienvenido!",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: Styles.secondTitlefont,
                                          fontWeight: FontWeight.bold)),
                                  Text("Por favor, ingresa tus datos",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 175, 175, 175),
                                          fontSize: 15,
                                          fontFamily: Styles.secondTitlefont,
                                          fontWeight: FontWeight.w400))
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                color: Styles.lightBlue,
                                fontFamily: Styles.secondTitlefont,
                              ),
                              prefixIcon: const Icon(Icons.email_outlined,
                                  color: Styles.lightBlue),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Styles.lightBlue,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Styles.blue,
                                  width: 1.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Styles.red,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "El email no es válido.";
                              }
                              final emailRegex =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!emailRegex.hasMatch(value)) {
                                return "El email no es válido";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _isObscured,
                            decoration: InputDecoration(
                              hintText: 'Constraseña',
                              hintStyle: const TextStyle(
                                color: Styles.lightBlue,
                                fontFamily: Styles.secondTitlefont,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                  icon: _isObscured
                                      ? const Icon(Icons.visibility_off_outlined,
                                          color: Styles.lightBlue)
                                      : const Icon(Icons.visibility_outlined,
                                          color: Styles.blue)),
                              prefixIcon: const Icon(Icons.lock_outline,
                                  color: Styles.lightBlue),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Styles.lightBlue,
                                  width: 1.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Styles.red,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Styles.blue,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "La contraseña no es válida.";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String email = _emailController.text;
                            String password = _passwordController.text;
          
                            ApiService.login(email, password).then((token) {
                              if (token.success) {
                                Map<String, dynamic> jwtDecodeToken =
                                    JwtDecoder.decode(token.result);
                                String role = jwtDecodeToken['role'];
          
                                if (role == "Cliente") {
                                  saveCredentials(token);
                                  String userId = jwtDecodeToken['id'];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MainOrders(userId: userId),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Acceso dengado",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: Styles.secondTitlefont),
                                      ),
                                      backgroundColor: Styles.red,
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      token.message,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: Styles.secondTitlefont),
                                    ),
                                    backgroundColor: Styles.red,
                                  ),
                                );
                              }
                            });
                          }
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
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 48),
                          ),
                        ),
                        child: const Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            fontFamily: Styles.secondTitlefont,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
      
    );
  }

  saveCredentials(Token token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String result = token.result;
    sharedPreferences.setString('currentToken', result);
  }

  Future getValidateData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var getToken = sharedPreferences.getString('currentToken');
    setState(() {
      currentToken = getToken;
    });
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.75);

    var firstControlPoint = Offset(size.width * 0.25, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.5);
    var secondEndPoint = Offset(size.width, size.height * 0.75);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
