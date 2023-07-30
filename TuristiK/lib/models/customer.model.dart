class Customer{

  final String customerId;
  final String name;
  final String lastName;
  final String document;
  final DateTime birthDate;
  final String phoneNumber;
  final String address;
  final String eps;
  final String userId;

  Customer({required this.customerId, required this.name, required this.lastName, required this.document, required this.birthDate, required this.phoneNumber, required this.address, required this.eps, required this.userId});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId : json["customerId"],
      name : json["name"],
      lastName : json["lastName"],
      document : json["document"],
      birthDate : DateTime.parse(json["birthDate"]),
      phoneNumber : json["phoneNumber"],
      address : json["address"],
      eps : json["eps"],
      userId : json["userId"],
    );
  }

}