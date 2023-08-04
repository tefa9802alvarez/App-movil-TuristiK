// ignore_for_file: use_build_context_synchronously

import 'package:app/models/customer.model.dart';
import 'package:app/models/order.model.dart';
import 'package:app/models/package.model.dart';
import 'package:app/modules/orders/frecuent_travelers/main.frecuent_traveler.dart';
import 'package:app/modules/orders/payments/main.payments.dart';
import 'package:app/partials/app-bar.partial.dart';
import 'package:app/services/api.service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/styles/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MainOrders extends StatefulWidget {
  final dynamic userId;
  const MainOrders({super.key, this.userId});
  @override
  State<MainOrders> createState() => _MainOrdersState();
}

class _MainOrdersState extends State<MainOrders> {
  static List<Order> orderList = [];
  static List<Package> packageList = [];

  @override
  void initState() {
    super.initState();
    loadInfo(widget.userId);
  }

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
        child: Center(
            child: Builder(
              builder: (context) {
                final double height = MediaQuery.of(context).size.height;
                return CarouselSlider(
                  options: CarouselOptions(
                      height: height,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      aspectRatio: 16 / 9),
                  items: orderList
                      .map(
                        (item) => Stack(
                          children: [
                            Positioned(
                              top: 40,
                              height: 620,
                              width: 330,
                              left:
                                  (MediaQuery.of(context).size.width - 330) / 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(36, 0, 0, 0),
                                        blurRadius: 15.0,
                                        offset: Offset(
                                          10,
                                          10,
                                        ),
                                      )
                                    ],
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(children: [
                                  Container(
                                    height: 130,
                                    width: 280,
                                    margin: const EdgeInsets.only(top: 30),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.network(
                                      // item.package.image,
                                      "https://images.unsplash.com/photo-1690184432588-81068877d852?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  // FutureBuilder<List<String>>(
                                  //   future: formatDateRange(
                                  //       getPackagedepartureDate(item.packageId!),
                                  //       getPackageArrivalDate(item.packageId!)),
                                  //   builder: (BuildContext context,
                                  //       AsyncSnapshot<List<String>> snapshot) {
                                  //     if (snapshot.connectionState ==
                                  //         ConnectionState.waiting) {
                                  //       return const CircularProgressIndicator();
                                  //     } else if (snapshot.hasError) {
                                  //       return const Text(
                                  //           'Error al obtener las fechas',
                                  //           style: TextStyle(
                                  //             color: Styles.red,
                                  //             fontSize: 14,
                                  //             fontFamily: Styles.secondTitlefont,
                                  //           ));
                                  //     } else {
                                  //       String departureDateText =
                                  //           snapshot.data?[0] ??
                                  //               'Fecha no disponible';
                                  //       String arrivalDateText =
                                  //           snapshot.data?[1] ??
                                  //               'Fecha no disponible';
                                  //       return Row(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.center,
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.center,
                                  //         children: [
                                  //           Container(
                                  //             constraints: const BoxConstraints(
                                  //                 maxWidth: 280),
                                  //             child: Text(
                                  //               "Desde $departureDateText Hasta $arrivalDateText",
                                  //               style: const TextStyle(
                                  //                 color: Styles.blue,
                                  //                 fontSize: 14,
                                  //                 fontFamily: Styles.subtitleFont,
                                  //               ),
                                  //               maxLines:
                                  //                   2,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       );
                                  //     }
                                  //   },
                                  // ),

                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        constraints:
                                            const BoxConstraints(maxWidth: 300),
                                        child: Center(
                                          child: Text(
                                            getPackageName(item.packageId!),
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontFamily: Styles.titleFont,
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      children: [
                                        // FutureBuilder<List<String>>(
                                        //   future: formatDateRange(
                                        //       getPackagedepartureDate(
                                        //           item.packageId!),
                                        //       getPackageArrivalDate(
                                        //           item.packageId!)),
                                        //   builder: (BuildContext context,
                                        //       AsyncSnapshot<List<String>>
                                        //           snapshot) {
                                        //     if (snapshot.connectionState ==
                                        //         ConnectionState.waiting) {
                                        //       return const CircularProgressIndicator();
                                        //     } else if (snapshot.hasError) {
                                        //       return const Text(
                                        //           'Error al obtener las fechas',
                                        //           style: TextStyle(
                                        //             color: Styles.red,
                                        //             fontSize: 14,
                                        //             fontFamily:
                                        //                 Styles.secondTitlefont,
                                        //           ));
                                        //     } else {
                                        //       String departureDateText =
                                        //           snapshot.data?[0] ??
                                        //               'Fecha no disponible';
                                        //       String arrivalDateText =
                                        //           snapshot.data?[1] ??
                                        //               'Fecha no disponible';
                                        //       return Padding(
                                        //         padding: const EdgeInsets.only(
                                        //             bottom: 10, top: 5),
                                        //         child: Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment
                                        //                   .spaceBetween,
                                        //           crossAxisAlignment:
                                        //               CrossAxisAlignment.center,
                                        //           children: [
                                        //             Column(
                                        //               crossAxisAlignment:
                                        //                   CrossAxisAlignment
                                        //                       .start,
                                        //               mainAxisAlignment:
                                        //                   MainAxisAlignment
                                        //                       .spaceAround,
                                        //               children: [
                                        //                 const Text(
                                        //                     "Fecha de salida y llegada",
                                        //                     style: TextStyle(
                                        //                       fontSize: 15,
                                        //                       fontFamily: Styles
                                        //                           .secondTitlefont,
                                        //                     )),
                                        //                 Container(
                                        //                   constraints:
                                        //                       const BoxConstraints(
                                        //                           maxWidth:
                                        //                               200),
                                        //                   child: Text("Desde $departureDateText Hasta $arrivalDateText",
                                        //                     style: const TextStyle(
                                        //                         fontSize: 15,
                                        //                         fontFamily: Styles
                                        //                             .textFont,
                                        //                         overflow:
                                        //                             TextOverflow
                                        //                                 .ellipsis),
                                        //                     maxLines: 2,
                                        //                   ),
                                        //                 )
                                        //               ],
                                        //             ),
                                        //             const Icon(
                                        //                 Icons.location_on,
                                        //                 color: Styles.blue,
                                        //                 size: 30)
                                        //           ],
                                        //         ),
                                        //       );
                                        //     }
                                        //   },
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10, top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  const Text("Fecha partida",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: Styles
                                                            .secondTitlefont,
                                                      )),
                                                  FutureBuilder<List<String>>(
                                                    future: formatDateRange(
                                                        getPackagedepartureDate(
                                                            item.packageId!),
                                                        getPackageArrivalDate(
                                                            item.packageId!)),
                                                    builder: (BuildContext
                                                            context,
                                                        AsyncSnapshot<
                                                                List<String>>
                                                            snapshot) {
                                                      if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return const CircularProgressIndicator();
                                                      } else if (snapshot
                                                          .hasError) {
                                                        return const Text(
                                                            'Error al obtener las fechas',
                                                            style: TextStyle(
                                                              color: Styles.red,
                                                              fontSize: 14,
                                                              fontFamily: Styles
                                                                  .secondTitlefont,
                                                            ));
                                                      } else {
                                                        String
                                                            departureDateText =
                                                            snapshot.data?[0] ??
                                                                'No disponible';
                                                        return Container(
                                                          constraints:
                                                              const BoxConstraints(
                                                                  maxWidth:
                                                                      200),
                                                          child: Text(
                                                            departureDateText,
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                fontFamily: Styles
                                                                    .textFont,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                            maxLines: 2,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  const Text("Fecha Llegada",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: Styles
                                                            .secondTitlefont,
                                                      )),
                                                  FutureBuilder<List<String>>(
                                                    future: formatDateRange(
                                                        getPackagedepartureDate(
                                                            item.packageId!),
                                                        getPackageArrivalDate(
                                                            item.packageId!)),
                                                    builder: (BuildContext
                                                            context,
                                                        AsyncSnapshot<
                                                                List<String>>
                                                            snapshot) {
                                                      if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return const CircularProgressIndicator();
                                                      } else if (snapshot
                                                          .hasError) {
                                                        return const Text(
                                                            'Error al obtener las fechas',
                                                            style: TextStyle(
                                                              color: Styles.red,
                                                              fontSize: 14,
                                                              fontFamily: Styles
                                                                  .secondTitlefont,
                                                            ));
                                                      } else {
                                                        String arrivalDateText =
                                                            snapshot.data?[1] ??
                                                                'No disponible';
                                                        return Container(
                                                          constraints:
                                                              const BoxConstraints(
                                                                  maxWidth:
                                                                      200),
                                                          child: Text(
                                                            arrivalDateText,
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                fontFamily: Styles
                                                                    .textFont,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                            maxLines: 2,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                              // const Icon(Icons.location_on,
                                              //     color: Styles.blue, size: 30)
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          color: Color.fromRGBO(
                                              231, 231, 231, 0.91),
                                          thickness: 0.8,
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       bottom: 10, top: 5),
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceBetween,
                                        //     crossAxisAlignment:
                                        //         CrossAxisAlignment.center,
                                        //     children: [
                                        //       Column(
                                        //         crossAxisAlignment:
                                        //             CrossAxisAlignment.start,
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment
                                        //                 .spaceAround,
                                        //         children: [
                                        //           const Text("Fecha de llegada",
                                        //               style: TextStyle(
                                        //                 fontSize: 15,
                                        //                 fontFamily: Styles
                                        //                     .secondTitlefont,
                                        //               )),
                                        //           Container(
                                        //             constraints:
                                        //                 const BoxConstraints(
                                        //                     maxWidth: 200),
                                        //             child: Text("20 agos 2023",
                                        //               style: const TextStyle(
                                        //                   fontSize: 15,
                                        //                   fontFamily:
                                        //                       Styles.textFont,
                                        //                   overflow: TextOverflow
                                        //                       .ellipsis),
                                        //               maxLines: 2,
                                        //             ),
                                        //           )
                                        //         ],
                                        //       ),
                                        //       const Icon(Icons.location_on,
                                        //           color: Styles.blue, size: 30)
                                        //     ],
                                        //   ),
                                        // ),
                                        // const Divider(
                                        //   color: Color.fromRGBO(
                                        //       231, 231, 231, 0.91),
                                        //   thickness: 0.8,
                                        // ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10, top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  const Text("Lugar de salida",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: Styles
                                                            .secondTitlefont,
                                                      )),
                                                  Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxWidth: 200),
                                                    child: Text(
                                                      getPackageDeparturePoint(
                                                          item.packageId!),
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontFamily:
                                                              Styles.textFont,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                      maxLines: 2,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Icon(Icons.location_on,
                                                  color: Styles.blue, size: 30)
                                            ],
                                          ),
                                        ),

                                        const Divider(
                                          color: Color.fromRGBO(
                                              231, 231, 231, 0.91),
                                          thickness: 0.8,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10, top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text("Tranporte",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: Styles
                                                            .secondTitlefont,
                                                      )),
                                                  Text(
                                                    getPackageTranport(item
                                                                .packageId!) ==
                                                            2
                                                        ? "Terrestre"
                                                        : "Aereo",
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontFamily:
                                                          Styles.textFont,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Icon(
                                                  getPackageTranport(item
                                                              .packageId!) ==
                                                          2
                                                      ? Icons.directions_bus
                                                      : Icons
                                                          .airplanemode_on_rounded,
                                                  color: Styles.blue,
                                                  size: 30)
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          color: Color.fromRGBO(
                                              231, 231, 231, 0.91),
                                          thickness: 0.8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text("Hospedaje",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: Styles
                                                            .secondTitlefont,
                                                      )),
                                                  Text(
                                                    getPackageHotel(
                                                        item.packageId!),
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontFamily:
                                                          Styles.textFont,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Icon(
                                                  FontAwesomeIcons
                                                      .solidBuilding,
                                                  color: Styles.blue,
                                                  size: 30)
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          color: Color.fromRGBO(
                                              231, 231, 231, 0.91),
                                          thickness: 0.8,
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.attach_money_sharp,
                                                color: Colors.green, size: 22),
                                            Text(
                                                getPackagePrice(
                                                    item.packageId!),
                                                style: const TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 22,
                                                  fontFamily:
                                                      Styles.secondTitlefont,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Styles.blue,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      onPressed: () async {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    MainPayment(
                                                              orderId:
                                                                  item.orderId,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        FontAwesomeIcons
                                                            .moneyCheckDollar,
                                                        color: Colors.white,
                                                        size: 25,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Container(
                                              width: 50,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Styles.blue,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    MainFrecuentTraveler(
                                                                        orderId:
                                                                            item.orderId!)));
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .supervisor_account,
                                                        color: Colors.white,
                                                        size: 25,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ),
    );
  }

  void loadInfo(String userId) async {
    Customer? customer = await ApiService.getCustomerByUserId(userId);
    List<Order> orders =
        await ApiService.getOrdersByCustomerId(customer!.customerId);
    List<Package> packages = await ApiService.getPackages();
    setState(() {
      orderList = orders;
      packageList = packages;
    });
  }

  static String getPackageName(String packageId) {
    try {
      Package package = packageList.firstWhere((p) => p.packageId == packageId);
      return package.name;
    } catch (e) {
      return "Información no disponible";
    }
  }

  static DateTime getPackagedepartureDate(String packageId) {
    try {
      Package package = packageList.firstWhere((p) => p.packageId == packageId);
      return package.departureDate;
    } catch (e) {
      throw Exception("Fecha no disponible");
    }
  }

  static DateTime getPackageArrivalDate(String packageId) {
    try {
      Package package = packageList.firstWhere((p) => p.packageId == packageId);
      return package.arrivalDate;
    } catch (e) {
      throw Exception("Fecha no disponible");
    }
  }

  static String getPackageDeparturePoint(String packageId) {
    try {
      Package package = packageList.firstWhere((p) => p.packageId == packageId);
      return package.departurePoint;
    } catch (e) {
      throw Exception("Información no disponible");
    }
  }

  static int getPackageTranport(String packageId) {
    try {
      Package package = packageList.firstWhere((p) => p.packageId == packageId);
      return package.transport;
    } catch (e) {
      throw Exception("Información no disponible");
    }
  }

  static String getPackagePrice(String packageId) {
    try {
      Package package = packageList.firstWhere((p) => p.packageId == packageId);
      return package.price.toString();
    } catch (e) {
      throw Exception("Información no disponible");
    }
  }

  static String getPackageHotel(String packageId) {
    try {
      Package package = packageList.firstWhere((p) => p.packageId == packageId);
      return package.hotel;
    } catch (e) {
      throw Exception("Información no disponible");
    }
  }

  Future<String> formatDate(DateTime date) async {
    try {
      await initializeDateFormatting('es_ES', null);
      String formattedDateTime = DateFormat('dd MMM y', 'es_ES').format(date);
      return formattedDateTime;
    } catch (e) {
      return 'Fecha no disponible';
    }
  }

  Future<List<String>> formatDateRange(
      DateTime departureDate, DateTime arrivalDate) async {
    try {
      await initializeDateFormatting('es_ES', null);
      String formattedDepartureDate =
          DateFormat('dd/MMM/y', 'es_ES').format(departureDate);
      String formattedArrivalDate =
          DateFormat('dd/MMM/y', 'es_ES').format(arrivalDate);
      return [
        formattedDepartureDate.toString(),
        formattedArrivalDate.toString()
      ];
    } catch (e) {
      return ['Fecha no disponible', 'Fecha no disponible'];
    }
  }
}
