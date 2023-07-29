// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:app/models/payment.model.dart';
import 'package:app/partials/app-bar.partial.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MainPayment extends StatefulWidget {
  final List<Payment> paymetList;
  const MainPayment({super.key, required this.paymetList});

  @override
  State<MainPayment> createState() => _MainPaymentState();
}

class _MainPaymentState extends State<MainPayment> {
  List<dynamic> paymentList = [];

  @override
  void initState() {
    super.initState();
    loadPayments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.lightGrey,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarNav(navtitle: "Mis Abonos", backOption: true),
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: paymentList.length,
              itemBuilder: (_, index) {
                final item = paymentList[index];
                return  Container(
                      margin: const EdgeInsets.only(top: 35,left: 15,right: 15,bottom: 5),
                      decoration: BoxDecoration(
                        color: Styles.blue,
                        borderRadius: BorderRadius.circular(10.0),
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
                      child: ExpansionTile(
                        shape: Border.all(color: Colors.transparent),   
                        trailing: const Icon(
                          Icons.keyboard_arrow_down_rounded, 
                          size: 45,
                          color:Colors.white,
                        ),  
                        title: Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FutureBuilder<String>(
                                future: formatDate(item['date']),
                                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                  return Text(
                                    snapshot.data ?? '', // Si el resultado es nulo, muestra una cadena vacía o un valor predeterminado
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: Styles.secondTitlefont,
                                    ),
                                  );
                                },
                              ),
                              Text("\$ ${item['amount'].toString()}",style: const TextStyle(
                                color: Colors.white,
                                fontFamily: Styles.secondTitlefont,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),
                        ),
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("Monto restante",style: TextStyle(
                                          fontFamily: Styles.secondTitlefont,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            const Icon(Icons.attach_money_sharp ,color: Colors.green,size:22),
                                            Text('${item['remainingAmount']}',
                                                style: const TextStyle(
                                                color: Styles.green,
                                                fontSize: 18,
                                                fontFamily: Styles.secondTitlefont,
                                                fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Styles.statusColorContainer(item['status'], 'payments'),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: 
                                           Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Styles.statusIcon(item['status'], 'payments'),
                                                Text(
                                                  statusToText(item['status']),
                                                  style: TextStyle(
                                                      color: Styles.statusColorText(item['status'], 'payments'),
                                                      fontSize: 18,
                                                      fontFamily: Styles.secondTitlefont,
                                                      fontWeight: FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        
                                      )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                );
              },
            ),
          ),
        ])
        );
  }

  
  Future<String> formatDate(DateTime date) async {
    try {
      await initializeDateFormatting('es_ES', null);
      String formattedDateTime = DateFormat('dd MMM y', 'es_ES').format(date);
      // String capitalizedMonth = formattedDateTime.replaceFirstMapped(
      //   RegExp(r'^[a-z]'),
      //   (match) => match[0]!.toUpperCase(),
      // );
      return formattedDateTime;
    } catch (e) {
      return 'Fecha no disponible'; 
    }
  }

  

  void loadPayments() {
    List<dynamic> pList = [];
    for (var p in widget.paymetList) {
      pList.add({
        "paymentId": p.paymentId,
        "orderId": p.orderId,
        "amount": p.amount,
        "remainingAmount": p.remainingAmount,
        "date": p.date,
        "image": p.image,
        "status": p.status,
        "isExpanded": false
      });
    }
    setState(() {
      paymentList = pList;
    });
  }

  String statusToText(int status){
    String text = "Pendiente";

    if (status == 1) {
      text = "Aceptado";
    }else if (status == 2) {
      text = "Rechazado";
    }

    return text;
  }

}
