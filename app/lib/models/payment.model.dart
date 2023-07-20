
class Payment{

  final String? paymentId;
  final String? orderId;
  final double amount;
  final double remainingAmount;
  final String date;
  final String image;
  final int status;

  Payment({required this.paymentId, required this.orderId, required this.amount, required this.remainingAmount, required this.date, required this.image, required this.status});

}