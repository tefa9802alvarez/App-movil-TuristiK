import 'package:app/models/customer.model.dart';
import 'package:app/models/order.model.dart';
import 'package:app/modules/orders/frecuent_travelers/main.frecuent_traveler.dart';
import 'package:app/modules/orders/payments/main.payments.dart';
import 'package:app/partials/app_bar.partial.dart';
import 'package:app/services/api.service.dart';
import 'package:app/utils/package.utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/styles/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainOrders extends StatefulWidget {
  final dynamic userId;
  const MainOrders({super.key, this.userId});
  @override
  State<MainOrders> createState() => _MainOrdersState();
}

class _MainOrdersState extends State<MainOrders> {
  static List<Order> orderList = [];
  int filter = 1;

  @override
  void initState() {
    super.initState();
    PackageUtils.initState();
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
        height: 750,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Styles.superlightBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: Center(
                child: builderOrderCarousel(filter),
              ),
            ),
            Positioned(
              top: 20,
              left: 40,
              right: 40,
              child: buildButtonStatus(),
            ),
          ],
        ),
      ),
    );
  }

  void loadInfo(String userId) async {
    Customer? customer = await ApiService.getCustomerByUserId(userId);
    List<Order> orders =
        await ApiService.getOrdersByCustomerId(customer!.customerId);
    setState(() {
      orderList = orders;
    });
  }

  void _showModalBottomSheet(BuildContext context, String packageId) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Styles.superlightBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 35),
                      height: 4,
                      width: 100,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 187, 187, 187),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 375,
                            height: 100,
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
                                color: Styles.blue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Image.network(
                                        PackageUtils.getPackageImages(
                                            packageId),
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Icon(Icons.error)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    constraints:
                                        const BoxConstraints(maxWidth: 170),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Destino",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white,
                                                fontFamily:
                                                    Styles.secondTitlefont,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 2,
                                          ),
                                          Text(
                                            PackageUtils.getPackageDestination(
                                                packageId),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: Styles.textFont,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text("Lugar de salida",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:
                                                  Styles.secondTitlefont,
                                            )),
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 280),
                                          child: Text(
                                            PackageUtils
                                                .getPackageDeparturePoint(
                                                    packageId),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: Styles.textFont,
                                                overflow:
                                                    TextOverflow.ellipsis),
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
                                color: Color.fromRGBO(231, 231, 231, 0.91),
                                thickness: 0.8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Transporte",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:
                                                  Styles.secondTitlefont,
                                            )),
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 280),
                                          child: Text(
                                            PackageUtils.getPackageTranport(
                                                        packageId) ==
                                                    2
                                                ? "Terrestre"
                                                : "Aereo",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: Styles.textFont,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 2,
                                          ),
                                        )
                                      ],
                                    ),
                                    Icon(
                                        PackageUtils.getPackageTranport(
                                                    packageId) ==
                                                2
                                            ? Icons.directions_bus
                                            : Icons.airplanemode_on_rounded,
                                        color: Styles.blue,
                                        size: 30)
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Color.fromRGBO(231, 231, 231, 0.91),
                                thickness: 0.8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Hotel",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:
                                                  Styles.secondTitlefont,
                                            )),
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 280),
                                          child: Text(
                                            PackageUtils.getPackageHotel(
                                                packageId),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: Styles.textFont,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 2,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Icon(FontAwesomeIcons.solidBuilding,
                                        color: Styles.blue, size: 30)
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Color.fromRGBO(231, 231, 231, 0.91),
                                thickness: 0.8,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Precio Unitario",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: Styles.secondTitlefont,
                                      )),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(Icons.attach_money_sharp,
                                          color: Colors.green, size: 22),
                                      Text(
                                          PackageUtils.getPackagePrice(
                                              packageId),
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 20,
                                            fontFamily: Styles.secondTitlefont,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container buildButtonStatus() {
    return Container(
      height: 60,
      width: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    filter = 0;
                  });
                },
                style: ButtonStyle(
                  surfaceTintColor: null,
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Colors.transparent;
                    },
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (filter == 0) {
                        return const Color.fromARGB(199, 224, 170, 6);
                      } else {
                        return const Color.fromARGB(150, 248, 227, 165);
                      }
                    },
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Text("En revisión",
                    style: TextStyle(
                        color: filter == 0 ?Colors.white : const Color.fromARGB(103, 209, 159, 7),
                        fontSize: 14,
                        fontFamily: Styles.secondTitlefont))),
            TextButton(
                onPressed: () {
                  setState(() {
                    filter = 1;
                  });
                },
                style: ButtonStyle(
                  surfaceTintColor: null,
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Colors.transparent;
                    },
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (filter == 1) {
                        return Styles.blue;
                      } else {
                        return const Color.fromARGB(232, 205, 225, 255);
                      }
                    },
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Text("En curso",
                    style: TextStyle(
                        color: 
                        filter == 1 ?Colors.white : const Color.fromARGB(163, 151, 187, 255),
                        fontSize: 14,
                        fontFamily: Styles.secondTitlefont))),
            TextButton(
                onPressed: () {
                  setState(() {
                    filter = 2;
                  });
                },
                style: ButtonStyle(
                  surfaceTintColor: null,
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (filter == 2) {
                        return Styles.green;
                      } else {
                        return Styles.lightGreen;
                      }
                    },
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Text("Pago",
                    style: TextStyle(
                        color: filter == 2 ?Colors.white : const Color.fromARGB(76, 39, 129, 42),
                        fontSize: 14,
                        fontFamily: Styles.secondTitlefont))),
          ],
        ),
      ),
    );
  }

  Future<List<Order>> getFilteredOrders(int filter) async {
    return orderList.where((item) => item.status == filter).toList();
  }

  Widget builderOrderCarousel(int filter) {
    return FutureBuilder(
        future: getFilteredOrders(filter),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text(
              "Cargando...",
              style: TextStyle(
                fontFamily: Styles.secondTitlefont,
                fontSize: 18,
                color: Styles.blue,
                fontWeight: FontWeight.w100,
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
                width: 320,
                height: 150,
                decoration: BoxDecoration(
                    color: Styles.lightred,
                    borderRadius: BorderRadius.circular(15)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Icon(
                      Icons.info_outline_rounded,
                      size: 50.0,
                      color: Styles.blue,
                    ),
                    Text(
                      "Error al obtener los pedidos",
                      style: TextStyle(
                        color: Styles.red,
                        fontSize: 17,
                        fontFamily: Styles.secondTitlefont,
                      ),
                    ),
                  ],
                ),
              );
          } else {
            final orderList = snapshot.data ?? [];
            if (orderList.isEmpty) {
              String message = "No hay pedidos en revisión";
              if (filter == 1) {
                message = "No hay pedidos en curso";
              } else if (filter == 2) {
                message = "No hay pedidos pagos";
              }
              return Container(
                width: 320,
                height: 150,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(88, 126, 176, 255),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      size: 50.0,
                      color: Styles.blue,
                    ),
                    Text(
                      message,
                      style: const TextStyle(
                        color: Styles.blue,
                        fontSize: 17,
                        fontFamily: Styles.secondTitlefont,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return CarouselSlider(
                options: CarouselOptions(
                    height: 650,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
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
                            top: 30,
                            height: 555,
                            width: 330,
                            left: (MediaQuery.of(context).size.width - 330) / 2,
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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(children: [
                                Container(
                                  height: 270,
                                  width: 290,
                                  margin: const EdgeInsets.only(top: 20),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: FadeInImage(
                                    placeholder: const AssetImage(
                                        'assets/images/loading.gif'),
                                    image: NetworkImage(
                                        PackageUtils.getPackageImages(
                                            item.packageId!)),
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/haapy-astronaut.jpg',
                                          fit: BoxFit.fitWidth);
                                    },
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 170),
                                      child: Center(
                                        child: Text(
                                          PackageUtils.getPackageName(
                                              item.packageId!),
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontFamily: Styles.titleFont,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _showModalBottomSheet(
                                              context, item.packageId!);
                                        },
                                        icon: const Icon(
                                          Icons.info_outline_rounded,
                                          size: 35.0,
                                          color: Styles.blue,
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Column(
                                    children: [
                                      const Divider(
                                        color:
                                            Color.fromRGBO(231, 231, 231, 0.91),
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
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Text("Fecha Partida",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: Styles
                                                          .secondTitlefont,
                                                    )),
                                                FutureBuilder<List<String>>(
                                                  future: PackageUtils.formatDateRange(
                                                      PackageUtils
                                                          .getPackagedepartureDate(
                                                              item.packageId!),
                                                      PackageUtils
                                                          .getPackageArrivalDate(
                                                              item.packageId!)),
                                                  builder:
                                                      (BuildContext context,
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
                                                      String departureDateText =
                                                          snapshot.data?[0] ??
                                                              'No disponible';
                                                      return Container(
                                                        constraints:
                                                            const BoxConstraints(
                                                                maxWidth: 200),
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
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                const Text("Fecha Llegada",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: Styles
                                                          .secondTitlefont,
                                                    )),
                                                FutureBuilder<List<String>>(
                                                  future: PackageUtils.formatDateRange(
                                                      PackageUtils
                                                          .getPackagedepartureDate(
                                                              item.packageId!),
                                                      PackageUtils
                                                          .getPackageArrivalDate(
                                                              item.packageId!)),
                                                  builder:
                                                      (BuildContext context,
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
                                                                maxWidth: 200),
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
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color:
                                            Color.fromRGBO(231, 231, 231, 0.91),
                                        thickness: 0.8,
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 15),
                                //CARD BOTTOM----------------------------
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
                                          Text(item.totalCost.toString(),
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
                                                          builder: (context) =>
                                                              MainPayment(
                                                            orderId:
                                                                item.orderId,
                                                            packageId:
                                                                item.packageId!,
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
                                                                    orderId: item
                                                                        .orderId!,
                                                                    packageId: item
                                                                        .packageId!,
                                                                  )));
                                                    },
                                                    icon: const Icon(
                                                      Icons.supervisor_account,
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
            }
          }
        });
  }
}
