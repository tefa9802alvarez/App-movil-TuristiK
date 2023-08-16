import 'dart:convert';
import 'package:app/models/package.model.dart';
import 'package:app/services/api.service.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PackageUtils {
  
  static final List<Package> _packageList = [];

  static Future<void> initState() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var packagesString = sharedPreferences.getString('allPackages');
    final data = List.from(jsonDecode(packagesString!));
    for (var p in data){  
      final package = Package.fromJson(p);
      _packageList.add(package);
    }     
  }

  static Future<void> reloadPackages() async {
    List<Package> packages = await ApiService.getPackages();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('allPackages');

    prefs.setString('allPackages', jsonEncode(packages));
  }

  static String getPackageName(String packageId){
    try {
      Package package = _packageList.firstWhere((p) => p.packageId == packageId);
      String packageName = package.name; 
      return packageName; 
    } catch (e) {
      return "Información no disponible";
    }
  }

  static String getPackageDestination(String packageId) {
    try {
      Package package = _packageList.firstWhere((p) => p.packageId == packageId);
      return package.destination;
    } catch (e) {
      return "Información no disponible";
    }
  }

  static DateTime getPackagedepartureDate(String packageId) {
    try {
      Package package = _packageList.firstWhere((p) => p.packageId == packageId);
      return package.departureDate;
    } catch (e) {
      throw Exception("Fecha no disponible");
    }
  }

  static DateTime getPackageArrivalDate(String packageId) {
    try {
      Package package = _packageList.firstWhere((p) => p.packageId == packageId);
      return package.arrivalDate;
    } catch (e) {
      throw Exception("Fecha no disponible");
    }
  }

  static String getPackageDeparturePoint(String packageId) {
    try {
      Package package = _packageList.firstWhere((p) => p.packageId == packageId);
      return package.departurePoint;
    } catch (e) {
      throw Exception("Información no disponible");
    }
  }

  static int getPackageTranport(String packageId) {
    try {
      Package package = _packageList.firstWhere((p) => p.packageId == packageId);
      return package.transport;
    } catch (e) {
      throw Exception("Información no disponible");
    }
  }

  static String getPackageImages(String packageId) {
    try {
      Package package = _packageList.firstWhere((p) => p.packageId == packageId);
      List<String> photos = package.photos.split(",").map((photo) => photo.trim()).toList();
      return photos.first;
    } catch (e) {
      throw Exception("Información no disponible");
    }
  }

  static String getPackagePrice(String packageId) {
    try {
      Package package = _packageList.firstWhere((p) => p.packageId == packageId);
      return package.price.toString();
    } catch (e) {
      throw Exception("Información no disponible");
    }
  }

  static String getPackageHotel(String packageId) {
    try {
      Package package = _packageList.firstWhere((p) => p.packageId == packageId);
      return package.hotel;
    } catch (e) {
      throw Exception("Información no disponible");
    }
  }

  

  static Future<String> formatDate(DateTime date) async {
    try {
      await initializeDateFormatting('es_ES', null);
      String formattedDateTime = DateFormat('dd MMM y', 'es_ES').format(date);
      return formattedDateTime;
    } catch (e) {
      return 'Fecha no disponible';
    }
  }

  static Future<List<String>> formatDateRange(
      DateTime departureDate, DateTime arrivalDate) async {
    try {
      await initializeDateFormatting('es_ES', null);
      String formattedDepartureDate =
          DateFormat('dd/MMM/y', 'es_ES').format(departureDate);
      String formattedArrivalDate =
          DateFormat('dd/MMM/y', 'es_ES').format(arrivalDate);
      return [
        formattedDepartureDate.toString(),
        formattedArrivalDate.toString()
      ];
    } catch (e) {
      return ['Fecha no disponible', 'Fecha no disponible'];
    }
  }



}
