import 'package:app/modules/login/login.dart';
import 'package:app/modules/orders/frecuent_travelers/main.frecuent_traveler.dart';
import 'package:app/modules/orders/orderexample.dart';
import 'package:app/partials/app-bar.partial.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  
  // static List<Order> orderList = [];
  // @override
  // void initState() {
  //   super.initState();
  //   loadOrders();
  // }

  // void loadOrders()async{
  //   orderList = await ApiService.getOrders();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(1000, 226, 232, 240),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarNav(navtitle: "Mis Pedidos",backOption: false),
      ),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                aspectRatio: 16 / 9
                ),
            items: orderList
                .map((item) => SizedBox(
                      child: Stack(children: [
                        Image.network(
                          item.package.image,
                          fit: BoxFit.cover,
                          height: height,
                        ),
                        Positioned(
                            child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                Colors.grey.shade50.withOpacity(1),
                                Colors.grey.shade50.withOpacity(1),
                                Colors.grey.shade50.withOpacity(1),
                                Colors.grey.shade50.withOpacity(1),
                                Colors.grey.shade50.withOpacity(0),
                                Colors.grey.shade50.withOpacity(0),
                                Colors.grey.shade50.withOpacity(0),
                                Colors.grey.shade50.withOpacity(0),
                              ])),
                        )),
                        Positioned(
                            bottom: 180,
                            height: 530,
                            width: 340,
                            left: (MediaQuery.of(context).size.width - 340) / 2,
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(15)),
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  Container(
                                    height: 250,
                                    width: 300,
                                    margin: const EdgeInsets.only(top: 30),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.network(
                                      item.package.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(item.package.name.toUpperCase(),
                                      style: const TextStyle(
                                          //color: Color.fromARGB(1000, 59, 130, 246),
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 20),
                                  Text(item.package.departureDate,
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold)),
                                  Text(item.package.arrivalDate,
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 50),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.attach_money_sharp ,color: Colors.green,size:22),
                                            Text('${item.package.price}',
                                                style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontFamily: 'Poppins',
                                                fontWeight:
                                                    FontWeight.w300)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 6),
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    1000, 59, 130, 246),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                    builder: (context) =>
                                                    const Login()));
                                                  },
                                                  icon: const Icon(
                                                    Icons.money,
                                                    color: Colors.white,
                                                    size: 25,
                                                  )),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 6),
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    1000, 59, 130, 246),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                    builder: (context) =>
                                                    FrecuentTraveler(
                                                    frecuentTravelers: item.orderDetail
                                                    )));
                                                  },
                                                  icon: const Icon(
                                                    Icons.supervisor_account,
                                                    color: Colors.white,
                                                    size: 25,
                                                  )),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ))
                      ]),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
