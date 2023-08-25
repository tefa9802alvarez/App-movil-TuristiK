import 'package:app/modules/login/login.dart';
import 'package:app/styles/styles.dart';
import 'package:app/utils/recover-password.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpdatePassword extends StatefulWidget {
  final String? userId;
  const UpdatePassword({super.key, required this.userId});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final _formKey = GlobalKey<FormState>();
  final _recoverCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  bool _isObscured = true;
  bool _isObscuredConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: double.maxFinite,
                    height: 780,
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
                                  width: 400,
                                  height: 250,
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
                                        Text("Reestablecer Contraseña",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: Styles.secondTitlefont,
                                                fontWeight: FontWeight.bold)),
                                        Text("Esta a un paso de recuperar su contraseña",
                                            style: TextStyle(
                                                color:
                                                    Color.fromARGB(255, 175, 175, 175),
                                                fontSize: 14,
                                                fontFamily: Styles.secondTitlefont,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w400),
                                                maxLines: 2,)
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                TextFormField(
                                  controller: _recoverCodeController,
                                  decoration: InputDecoration(
                                    hintText: 'Código de recuperación',
                                    hintStyle: const TextStyle(
                                      color: Styles.lightBlue,
                                      fontFamily: Styles.secondTitlefont,
                                    ),
                                    prefixIcon: const Icon(Icons.key_rounded,
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
                                      return "El código no es válido";
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
                                    hintText: 'Ingrese su nueva contraseña',
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
                                      return "La contraseña no es válida.";
                                    }
                                    if (value.length<8) {
                                      return "Debe tener mínimo 8 caracteres.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: _isObscuredConfirmPassword,
                                  decoration: InputDecoration(
                                    hintText: 'Confirme su contraseña',
                                    hintStyle: const TextStyle(
                                      color: Styles.lightBlue,
                                      fontFamily: Styles.secondTitlefont,
                                    ),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isObscuredConfirmPassword = !_isObscuredConfirmPassword;
                                          });
                                        },
                                        icon: _isObscuredConfirmPassword
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
                                      return "La contraseña no es válida.";
                                    }else if (value != _passwordController.text) {
                                      return "Las contraseñas no coinciden.";
                                    }else if (value.length<8) {
                                      return "Debe tener mínimo 8 caracteres.";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  String code = _recoverCodeController.text;
                                  String password = _passwordController.text;
                                  bool response = await RecoverPasswordUtils.updateRecoveredPassword(code,password,widget.userId!);
                                
                                  if (response) {
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Se ha reestablecido la contraseña",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: Styles.secondTitlefont),
                                        ),
                                        backgroundColor: Styles.green,
                                      ),
                                    );

                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Login(),
                                      ),
                                    );
                                  }else{
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "El código no es válido",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: Styles.secondTitlefont),
                                        ),
                                        backgroundColor: Styles.red,
                                      ),
                                    );
                                  }
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
                                "Restablecer Contraseña",
                                style: TextStyle(
                                  fontFamily: Styles.secondTitlefont,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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