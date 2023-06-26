import 'dart:ffi';
class Payment{

  final String? paymentId;
  final String? orderId;
  final Float amount;
  final Float remainingAmount;
  final DateTime date;
  final String image;
  final int status;

  Payment(this.paymentId, this.orderId, this.amount, this.remainingAmount, this.date, this.image, this.status);

}