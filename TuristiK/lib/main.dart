import 'dart:convert';
import 'dart:io';
import 'package:app/models/environment.dart';
import 'package:app/services/api.service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/package.model.dart';
import 'modules/login/login.dart';

List<Package>? allPackages = [];
Future<void> main() async {
  
  await dotenv.load(fileName: Environment.fileName);
  await savePackageList();

  // Registra un listener para cuando la aplicación se actualice.
  // WidgetsBinding.instance.addObserver(
  //   (_) async {
  //     // Actualiza la lista de paquetes.
  //     await PackageUtils.reloadPackages();
  //   } as WidgetsBindingObserver,
  // );

  if (!kReleaseMode) {  
    HttpOverrides.global = MyHttpOverrides();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuristiK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}

savePackageList() async{
  
  List<Package> packages = await ApiService.getPackages();
   // Convertir la lista de paquetes a una lista de mapas JSON
  List<Map<String, dynamic>> packagesJson = packages.map((package) => package.toJson()).toList();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('allPackages', jsonEncode(packagesJson));
}



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
