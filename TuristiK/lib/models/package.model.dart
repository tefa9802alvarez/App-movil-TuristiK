class Package{

  final String? packageId;
  final String name;
  final String details;
  final String destination;
  final int transport;
  final String hotel;
  final DateTime arrivalDate;
  final DateTime departureDate;
  final String departurePoint;
  final int totalQuotas; 
  final int availableQuotas;
  final double price;
  final bool type;
  final bool status;
  final String image = "https://images.unsplash.com/photo-1690184432588-81068877d852?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60";
  final String photos;

  Package({required this.packageId, required this.name, required this.details,required this.destination, required this.transport, required this.hotel, required this.arrivalDate, required this.departureDate, required this.departurePoint, required this.totalQuotas, required this.availableQuotas, required this.price, required this.type, required this.status,
  required this.photos});

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageId: json["packageId"],
      name: json["name"],
      details: json["details"],
      destination: json["destination"],
      transport: json["transport"],
      hotel: json["hotel"],
      arrivalDate: DateTime.parse(json["arrivalDate"]),
      departureDate: DateTime.parse(json["departureDate"]),
      departurePoint: json["departurePoint"],
      totalQuotas: json["totalQuotas"],
      availableQuotas: json["availableQuotas"],
      price: json["price"],
      type: json["type"],
      status: json["status"],
      photos: json["photos"],
    );
  }

}