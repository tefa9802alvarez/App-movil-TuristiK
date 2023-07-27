import 'package:app/models/customer.model.dart';
import 'package:app/models/order-detail.model.dart';
import 'package:app/partials/app-bar.partial.dart';
import 'package:app/services/api.service.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainFrecuentTraveler extends StatefulWidget {
  final List<OrderDetail> orderDetail;
  const MainFrecuentTraveler(
      {super.key, required this.orderDetail});

  @override
  State<MainFrecuentTraveler> createState() => _MainFrecuentTravelerState();
}

class _MainFrecuentTravelerState extends State<MainFrecuentTraveler> {

  static List<dynamic> frecuentTravelers = [];

  @override
  void initState() {
    super.initState(); 
    loadFrecuentTravelers();
  }



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
                                  "Acompañantes (${widget.orderDetail.length}) ",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                      fontFamily: Styles.mainFont,
                                      fontWeight: FontWeight.w400)),
                            ], 
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ), 
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: frecuentTravelers.map((c) {
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
                              color: Styles.blue,
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
                            child: Stack(
                              children: [
                                const Positioned(
                                  left: 0,
                                  top: 40,
                                  child: Icon(
                                    FontAwesomeIcons
                                        .solidUser,
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
                                          "${c['name']} ${c['lastName']}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: Styles.mainFont,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Documento: ${c['document']}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: Styles.mainFont,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "${c['birthDate']}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: Styles.mainFont,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          c['eps'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: Styles.mainFont,
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
                                        fontFamily: Styles.mainFont,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${c['unitPrice']}",
                                    style: const TextStyle(
                                        color: Styles.green,
                                        fontSize: 14,
                                        fontFamily: Styles.mainFont,
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
  
  void loadFrecuentTravelers() async {
    List<dynamic> ft = [];
    for (var o in widget.orderDetail) {
      Customer? customer = await ApiService.getCustomerById(o.beneficiaryId);
      ft.add({
            "unitPrice": o.unitPrice, 
            "customerId": customer!.customerId, 
            "name": customer.name, 
            "lastName": customer.lastName, 
            "document": customer.document, 
            "birthDate": customer.birthDate, 
            "phoneNumber": customer.phoneNumber, 
            "address": customer.address, 
            "eps": customer.eps, 
            "userId": customer.userId
          }
        );
      setState(() {
        frecuentTravelers = ft;
      });
    }
  }
}
