
import 'order-detail.model.dart';
import 'package.model.dart';
import 'payment.model.dart';

class Order{

  final String? orderId;
  final String? customerId;
  final String? packageId;
  final double totalCost;
  final int status;
  final List<Payment> payment;
  final List<OrderDetail> orderDetail;
  final Package package;


  Order({
    required this.orderId, 
    required this.customerId, 
    required this.packageId,
    required this.totalCost, 
    required this.status, 
    required this.payment, 
    required this.orderDetail, 
    required this.package, 
  });

   factory Order.fromJson(Map<String, dynamic> json) {
    // Convert the "payment" field to List<Payment>
    List<dynamic> paymentJson = json["payment"];
    List<Payment> paymentList = paymentJson.map((item) => Payment.fromJson(item)).toList();

    // Convert the "orderDetail" field to List<Payment>
    List<dynamic> orderDetailJson = json["orderDetail"];
    List<OrderDetail> orderDetailList = orderDetailJson.map((item)=>OrderDetail.fromJson(item)).toList();

    // Convert the "orderDetail" field to List<Payment>
   dynamic packageJson = json["package"];
   Package package = Package.fromJson(packageJson);

    return Order(
      orderId: json["orderId"],
      customerId: json["customerId"],
      packageId: json["packageId"],
      totalCost: json["totalCost"],
      status: json["status"],
      payment: paymentList,
      orderDetail: orderDetailList,
      package: package,
    );
  }
}

