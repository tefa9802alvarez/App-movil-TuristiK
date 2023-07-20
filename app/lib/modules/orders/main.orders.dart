import 'package:app/partials/app-bar.partial.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'orders.carousel.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(1000, 226, 232, 240),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarNav(navtitle: "Mis Pedidos"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 500,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: cardList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
