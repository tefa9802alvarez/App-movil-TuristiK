
class OrderDetail{

  final String? orderDetailId;
  final String beneficiaryId;
  final double unitPrice;

  OrderDetail({required this.orderDetailId,required this.beneficiaryId, required this.unitPrice});
  
  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      orderDetailId: json["orderDetailId"],
      beneficiaryId: json["beneficiaryId"],
      unitPrice: json["unitPrice"]
    );
  }
}