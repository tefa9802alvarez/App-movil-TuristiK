
import 'package:app/models/order-detail.model.dart';

class Payment{

  final String? paymentId;
  final String? orderId;
  final double amount;
  final double remainingAmount;
  final DateTime date;
  final String image;
  final int status;
  final List<OrderDetail> orderDetail;

  Payment({
    required this.paymentId, 
    required this.orderId, 
    required this.amount, 
    required this.remainingAmount, 
    required this.date, 
    required this.image, 
    required this.status,
    required this.orderDetail
  });

   factory Payment.fromJson(Map<String, dynamic> json) {
    List<dynamic> orderDetailJson = json["orderDetail"];
    List<OrderDetail> orderDetailList = orderDetailJson.map((item)=>OrderDetail.fromJson(item)).toList();
    
    return Payment(
      paymentId: json["paymentId"],
      orderId: json["orderId"],
      amount: json["amount"],
      remainingAmount: json["remainingAmount"],
      date: DateTime.parse(json["date"]),
      image: json["image"],
      status: json["status"],
      orderDetail: orderDetailList,
    );
  }
}