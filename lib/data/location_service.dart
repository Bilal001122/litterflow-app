import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<List<double>> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return [
      position.latitude,
      position.longitude,
    ];
  }
}
