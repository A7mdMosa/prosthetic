import 'package:geolocator/geolocator.dart';

class Location {
  Future<void> getLocation() async {
    final permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.denied) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position.altitude);
      print(position.longitude);
    }
  }
}
