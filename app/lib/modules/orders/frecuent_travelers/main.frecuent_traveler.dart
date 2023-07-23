import 'package:app/models/order-detail.model.dart';
import 'package:app/partials/app-bar.partial.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FrecuentTraveler extends StatelessWidget {
  final List<OrderDetail> frecuentTravelers;
  const FrecuentTraveler(
      {super.key, required this.frecuentTravelers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(1000, 226, 232, 240),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarNav(navtitle: "Mis Beneficiarios",backOption: true,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 35),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 210,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(87, 0, 0, 0),
                            blurRadius: 15.0,
                            offset: Offset(
                              3,
                              3,
                            ),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Acompañantes (${frecuentTravelers.length}) ",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400)),
                            ], 
                          ),
                        ],
                      ),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //           Container(
                      //           height: 40,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(15),
                      //             color: const Color.fromARGB(1000, 59, 130, 246)
                      //           ),
                      //           child: Text(
                      //             "Acompañantes (${frecuentTravelers.length}) ",
                      //             style: const TextStyle(
                      //                 color: Color.fromARGB(255, 255, 255, 255),
                      //                 fontSize: 20,
                      //                 fontFamily: 'Poppins',
                      //                 fontWeight: FontWeight.w400)),
                      //           )
                      //       ]    
                      //     ),
                      //     const Column(
                      //       children: [
                      //         Icon(Icons.supervisor_account, color:  Color.fromARGB(1000, 59, 130, 246),size: 70,), 
                      //       ],
                      //     )
                      //   ],
                      // ),
                    ),
                  ],
                ),
              ),
            ), 
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: frecuentTravelers.map((orderDetail) {
                  return SizedBox(
                    height: 250,
                    width: 370,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 200,
                            width: 370,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(1000, 59, 130, 246),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(87, 0, 0, 0),
                                  blurRadius: 15.0,
                                  offset: Offset(
                                    3,
                                    3,
                                  ),
                                )
                              ],
                            ),
                            child: const Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 40,
                                  child: Icon(
                                    FontAwesomeIcons
                                        .solidUser, // El icono que desees utilizar
                                    size: 165,
                                    color: Color.fromARGB(30, 255, 255, 255),
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  right: 35,
                                  child: SizedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Estefanía Álvarez Sepúlveda",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Documento: 1017923532",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "18 años",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Fondo de afilicacion",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 20,
                          child: Container(
                            height: 30,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7, right: 7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Precio Unitario",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    orderDetail.unitPrice.toString(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(1000, 34, 197, 94),
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
