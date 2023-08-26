import 'package:app/modules/recover-password/update_password.dart';
import 'package:app/partials/app_bar_not_log.dart';
import 'package:app/styles/styles.dart';
import 'package:app/utils/recover-password.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendRecoveredEmail extends StatefulWidget {
  const SendRecoveredEmail({super.key});

  @override
  State<SendRecoveredEmail> createState() => _SendRecoveredEmailState();
}

class _SendRecoveredEmailState extends State<SendRecoveredEmail> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  Color? scaffoldMessengerColor;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBarNavNotLogged(),
      ),
      body: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  height: 620,
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 35.0),
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
                                width: 500,
                                height: 350,
                                child: SvgPicture.asset(
                                  'assets/images/recover_password.svg',
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
                                      Text("¿Olvidaste tu contraseña?",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontFamily: Styles.secondTitlefont,
                                              fontWeight: FontWeight.bold)),
                                      Text("Por favor ingresa tu correo",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 175, 175, 175),
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
                                keyboardType: TextInputType.emailAddress,
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
                                  errorStyle: const TextStyle(
                                    color: Styles.red,
                                    fontSize: 13,
                                    fontFamily: Styles.subtitleFont,
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
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
                                height: 5,
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                String email = _emailController.text;
                                String? response =
                                    await RecoverPasswordUtils.updateUserPassword(
                                        email);
          
                                if (response!=null) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Correo enviado exitosamente",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: Styles.secondTitlefont),
                                      ),
                                      backgroundColor: Styles.green,
                                    ),
                                  );
                                }
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdatePassword(userId : response),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Datos incorrectos",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: Styles.secondTitlefont),
                                    ),
                                    backgroundColor: Styles.red,
                                  ),
                                );
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
                              "Enviar Correo",
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
              ],
            ),
          ),
        ),
    );
  }
}
