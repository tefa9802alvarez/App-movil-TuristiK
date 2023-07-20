import 'package:flutter/material.dart';

List<Widget> cardList = [
    Card(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 280,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1532185922611-3410b1898a1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGNvbG9tYmlhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Column(
                    children: [
                      Text("Viaje",
                          style: TextStyle(
                              color: Color.fromARGB(1000, 59, 130, 246),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 12,
                      ),
                      Text("Del 10-08-2023 Al 15-08-2023",
                          style: TextStyle(
                              color: Color.fromARGB(255, 175, 175, 175),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w200)),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text('\$ 180.000',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 194, 16),
                              fontSize: 25,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(1000, 59, 130, 246),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                            onPressed: () {
                              //Navigator.push(context,MaterialPageRoute(builder: (context)=>const Login()));
                            },
                            icon: const Icon(
                              Icons.money,
                              color: Colors.white,
                              size: 25,
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(1000, 59, 130, 246),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                            onPressed: () {
                              //Navigator.push(context,MaterialPageRoute(builder: (context)=>const Login()));
                            },
                            icon: const Icon(
                              Icons.supervisor_account,
                              color: Colors.white,
                              size: 25,
                            )),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  ];