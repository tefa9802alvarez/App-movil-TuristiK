import 'package:app/partials/app-bar.partial.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.blue,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBarNav(
          navtitle: "Mis Pedidos",
          backOption: false,
          description: "Todas tus aventuras al instante",
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(232, 248, 250, 253),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
        child: SingleChildScrollView(
          
        ),
      ),
    );
  }

}