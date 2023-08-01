import 'package:app/models/toke.model.dart';
import 'package:app/modules/orders/main.orders.dart';
import 'package:app/services/api.service.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isObscured;
  late Token token;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.lightGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 345,
                height: 510,
                padding: const EdgeInsets.symmetric(
                    vertical: 35.0, horizontal: 35.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(87, 0, 0, 0),
                      blurRadius: 15.0,
                      offset: Offset(
                        15,
                        15,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: const TextStyle(
                                    color: Styles.lightBlue,
                                    fontFamily: Styles.secondTitlefont,),
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
                                    fontFamily: Styles.secondTitlefont,),
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                }, icon: _isObscured 
                                    ? const Icon(Icons.visibility_off_outlined ,color:Styles.lightBlue)
                                    : const Icon(Icons.visibility_outlined,color: Styles.blue)),
                                prefixIcon: const Icon(Icons.lock_outline,
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
                              //login(email, password);

                              ApiService.login(email, password).then((token) {
                                if (token.success) {   
                                  Map<String,dynamic> jwtDecodeToken = JwtDecoder.decode(token.result);
                                  String role = jwtDecodeToken['role'];

                                  if (role == "Cliente") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MainOrders(),
                                      ),
                                    );
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Acceso dengado",style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: Styles.secondTitlefont
                                        ),),
                                        backgroundColor: Styles.red,
                                      ),
                                    );
                                  }

                                  
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(token.message,style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: Styles.secondTitlefont
                                      ),),
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
              )
            ],
          ),
        ),
      ),
    );
  }

}