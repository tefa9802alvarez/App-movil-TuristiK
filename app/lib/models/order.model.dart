
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
}

