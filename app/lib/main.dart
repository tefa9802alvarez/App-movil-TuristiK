import 'dart:io';

// import 'package:app/modules/login/login.dart';
import 'package:app/modules/orders/payments/main.payments.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'models/payment.model.dart';

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
      //home: const Login(),
      home: MainPayment(paymetList: [
        Payment(
            paymentId: "17beecf9-29c5-4a6f-99ad-08db87bcdde7",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            amount: 1000.00,
            remainingAmount: 208900.00,
            date: DateTime.parse("2022-01-02T20:09:37.47"),
            image: "url",
            status: 0
        ),
        Payment(
            paymentId: "17beecf9-29c5-4a6f-99ad-08db87bcdde7",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            amount: 90700.00,
            remainingAmount: 208900.00,
            date: DateTime.parse("2023-07-18T20:09:37.47"),
            image: "url",
            status: 1
        ),
        Payment(
            paymentId: "17beecf9-29c5-4a6f-99ad-08db87bcdde7",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            amount: 57000.00,
            remainingAmount: 208900.00,
            date: DateTime.parse("2023-05-15T20:09:37.47"),
            image: "url",
            status: 2
        )
      ]),
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
