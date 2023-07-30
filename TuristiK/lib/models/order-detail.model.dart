
class OrderDetail{

  final String? orderDetailId;
  final String? orderId;
  final String beneficiaryId;
  final double unitPrice;

  OrderDetail({required this.orderDetailId, required this.orderId, required this.beneficiaryId, required this.unitPrice});
  
  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      orderDetailId: json["orderDetailId"],
      orderId: json["orderId"],
      beneficiaryId: json["beneficiaryId"],
      unitPrice: json["unitPrice"]
    );
  }
}