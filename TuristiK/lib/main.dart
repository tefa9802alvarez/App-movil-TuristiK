import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'modules/login/login.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(1000,69,30,177)),
        useMaterial3: true,
      ),
      home: const Login(),
      
      // // home: MainFrecuentTraveler(orderDetail: [
      //     OrderDetail(
      //       orderDetailId: "6c3ecd65-61b5-4842-2edd-08db87c95e19",
      //       orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
      //       beneficiaryId: "acb85669-6220-431c-2329-08db84838b9b",
      //       unitPrice: 380000.00
      //     ),
      //     OrderDetail(
      //       orderDetailId: "6c3ecd65-61b5-4842-2edd-08db87c95e19",
      //       orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
      //       beneficiaryId: "acb85669-6220-431c-2329-08db84838b9b",
      //       unitPrice: 150000.00
      //     ),
      //     OrderDetail(
      //       orderDetailId: "6c3ecd65-61b5-4842-2edd-08db87c95e19",
      //       orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
      //       beneficiaryId: "acb85669-6220-431c-2329-08db84838b9b",
      //       unitPrice: 2580000.00
      //     )
      // ]),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
