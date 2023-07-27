import 'package:app/models/order-detail.model.dart';
import 'package:app/models/order.model.dart';
import 'package:app/models/package.model.dart';
import 'package:app/models/payment.model.dart';

List<Order> orderList = [
    Order(
      orderId: "12321213",
      customerId: "4082de5a-8818-4181-232a-08db84838b9b",
      packageId: "76aeceb9-63b9-4b5b-12c1-08db855c4edc",
      package: Package(
        packageId: "76aeceb9-63b9-4b5b-12c1-08db855c4edc",
        name: "Viaje a Coveñas",
        destination: "coveñas ",
        details: "El clima en Coveñas es tropical, con temperaturas cálidas durante todo el año y una temporada de lluvias entre mayo y noviembre.",
        transport: "0",
        hotel: "palace hotel",
        departureDate: "2023-07-28T19:51:04",
        arrivalDate: "2023-07-30T19:51:09",
        departurePoint: "La terminal ",
        totalQuotas: 50,
        availableQuotas: 45,
        price: 380000.00,
        type: false,
        status: true,
        //image: "https://images.unsplash.com/photo-1525088299396-2417f1366edd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=876&q=80"
      ),
      totalCost: 380000.00,
      status: 1,
      payment: [
        Payment(
            paymentId: "17beecf9-29c5-4a6f-99ad-08db87bcdde7",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            amount: 100.00,
            remainingAmount: 208900.00,
            date: DateTime.parse("2023-07-18T20:09:37.47"),
            image: "url",
            status: 1
        ),
        Payment(
            paymentId: "17beecf9-29c5-4a6f-99ad-08db87bcdde7",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            amount: 100.00,
            remainingAmount: 208900.00,
            date: DateTime.parse("2023-07-18T20:09:37.47"),
            image: "url",
            status: 1
        )
      ],
      orderDetail: [
          OrderDetail(
            orderDetailId: "6c3ecd65-61b5-4842-2edd-08db87c95e19",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            beneficiaryId: "acb85669-6220-431c-2329-08db84838b9b",
            unitPrice: 380000.00
          )
      ]
    ),
    Order(
      orderId: "12321213",
      customerId: "4082de5a-8818-4181-232a-08db84838b9b",
      packageId: "76aeceb9-63b9-4b5b-12c1-08db855c4edc",
      package: Package(
        packageId: "76aeceb9-63b9-4b5b-12c1-08db855c4edc",
        name: "Viaje a santa Marta",
        destination: "coveñas ",
        details: "El clima en Coveñas es tropical, con temperaturas cálidas durante todo el año y una temporada de lluvias entre mayo y noviembre.",
        transport: "0",
        hotel: "palace hotel",
        departureDate: "2023-07-28T19:51:04",
        arrivalDate: "2023-07-30T19:51:09",
        departurePoint: "La terminal ",
        totalQuotas: 50,
        availableQuotas: 45,
        price: 380000.00,
        type: false,
        status: true,
        //image: "https://images.unsplash.com/photo-1532443603613-61fa154742cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y29sb21iaWF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"
      ),
      totalCost: 380000.00,
      status: 1,
      payment: [
        Payment(
            paymentId: "17beecf9-29c5-4a6f-99ad-08db87bcdde7",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            amount: 100.00,
            remainingAmount: 208900.00,
            date: DateTime.parse("2023-07-18T20:09:37.47"),
            image: "url",
            status: 1
        ),
        Payment(
            paymentId: "17beecf9-29c5-4a6f-99ad-08db87bcdde7",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            amount: 100.00,
            remainingAmount: 208900.00,
            date: DateTime.parse("2023-07-18T20:09:37.47"),
            image: "url",
            status: 1
        )
      ],
      orderDetail: [
          OrderDetail(
            orderDetailId: "6c3ecd65-61b5-4842-2edd-08db87c95e19",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            beneficiaryId: "acb85669-6220-431c-2329-08db84838b9b",
            unitPrice: 380000.00
          )
      ]
    ),
    Order(
      orderId: "12321213",
      customerId: "4082de5a-8818-4181-232a-08db84838b9b",
      packageId: "76aeceb9-63b9-4b5b-12c1-08db855c4edc",
      package: Package(
        packageId: "76aeceb9-63b9-4b5b-12c1-08db855c4edc",
        name: "Viaje a Medellin",
        destination: "coveñas ",
        details: "El clima en Coveñas es tropical, con temperaturas cálidas durante todo el año y una temporada de lluvias entre mayo y noviembre.",
        transport: "0",
        hotel: "palace hotel",
        departureDate: "2023-07-28T19:51:04",
        arrivalDate: "2023-07-30T19:51:09",
        departurePoint: "La terminal ",
        totalQuotas: 50,
        availableQuotas: 45,
        price: 380000.00,
        type: false,
        status: true,
        //image : "https://images.unsplash.com/photo-1613498248726-8922766cebdb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fGNvbG9tYmlhfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"
      ),
      totalCost: 380000.00,
      status: 1,
      payment: [
        Payment(
            paymentId: "17beecf9-29c5-4a6f-99ad-08db87bcdde7",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            amount: 100.00,
            remainingAmount: 208900.00,
            date: DateTime.parse("2023-07-18T20:09:37.47"),
            image: "url",
            status: 1
        ),
        Payment(
            paymentId: "17beecf9-29c5-4a6f-99ad-08db87bcdde7",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            amount: 100.00,
            remainingAmount: 208900.00,
            date: DateTime.parse("2023-07-18T20:09:37.47"),
            image: "url",
            status: 1
        )
      ],
      orderDetail: [
          OrderDetail(
            orderDetailId: "6c3ecd65-61b5-4842-2edd-08db87c95e19",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            beneficiaryId: "acb85669-6220-431c-2329-08db84838b9b",
            unitPrice: 380000.00
          ),
          OrderDetail(
            orderDetailId: "6c3ecd65-61b5-4842-2edd-08db87c95e19",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            beneficiaryId: "acb85669-6220-431c-2329-08db84838b9b",
            unitPrice: 150000.00
          ),
          OrderDetail(
            orderDetailId: "6c3ecd65-61b5-4842-2edd-08db87c95e19",
            orderId: "f2e6c8ef-d157-469c-24a2-08db87c95e0e",
            beneficiaryId: "acb85669-6220-431c-2329-08db84838b9b",
            unitPrice: 2580000.00
          )
      ]
    )
  ];
