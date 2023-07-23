class Package{

  final String? packageId;
  final String name;
  final String details;
  final String destination;
  final String transport;
  final String hotel;
  final String arrivalDate;
  final String departureDate;
  final String departurePoint;
  final int totalQuotas; 
  final int availableQuotas;
  final double price;
  final bool type;
  final bool status;
  final String image;

  Package({required this.packageId, required this.name, required this.details,required this.destination, required this.transport, required this.hotel, required this.arrivalDate, required this.departureDate, required this.departurePoint, required this.totalQuotas, required this.availableQuotas, required this.price, required this.type, required this.status,required this.image});

}