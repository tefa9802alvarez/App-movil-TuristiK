import 'dart:ffi';
class Package{

  final String? packageId;
  final String name;
  final String description;
  final String details;
  final String transport;
  final String hotel;
  final DateTime arrivalDate;
  final DateTime departureDate;
  final String departurePoint;
  final int totalQuotas; 
  final int availableQuotas;
  final Float price;
  final bool type;
  final bool status;

  Package(this.packageId, this.name, this.description, this.details, this.transport, this.hotel, this.arrivalDate, this.departureDate, this.departurePoint, this.totalQuotas, this.availableQuotas, this.price, this.type, this.status);

}