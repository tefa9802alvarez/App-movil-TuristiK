import 'dart:ffi';

class OrderDetail{

  final String? orderDetailId;
  final String? orderId;
  final String beneficiaryId;
  final Float unitPrice;

  OrderDetail(this.orderDetailId, this.orderId, this.beneficiaryId, this.unitPrice);
  
}