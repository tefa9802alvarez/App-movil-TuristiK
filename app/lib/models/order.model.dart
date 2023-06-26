import 'dart:ffi';

import 'customer.model.dart';
import 'order-detail.model.dart';
import 'package.model.dart';
import 'payment.model.dart';

class Order{

  final String? orderId;
  final String? costumerId;
  final String? packageId;
  final Float totalCost;
  final int status;
  final List<Payment> payment;
  final List<OrderDetail> orderDetail;
  final Package package;
  final Customer costumer;

  Order(this.orderId, this.costumerId, this.packageId, this.totalCost, this.status, this.payment, this.orderDetail, this.package, this.costumer);
}

