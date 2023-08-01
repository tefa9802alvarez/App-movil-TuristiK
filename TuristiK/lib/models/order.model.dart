
class Order{

  final String? orderId;
  final String? customerId;
  final String? packageId;
  final double totalCost;
  final int status;



  Order({
    required this.orderId, 
    required this.customerId, 
    required this.packageId,
    required this.totalCost, 
    required this.status, 

  });

   factory Order.fromJson(Map<String, dynamic> json) {
    

    return Order(
      orderId: json["orderId"],
      customerId: json["customerId"],
      packageId: json["packageId"],
      totalCost: json["totalCost"],
      status: json["status"],
    );
  }
}

