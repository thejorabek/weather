import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/services/location/bloc/location_event.dart';
import 'package:weather/services/location/bloc/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<GetLocation>((event, emit) async {
      emit(LocationLoading());
      try {
        await checkLocationPermission();
        Position position = await Geolocator.getCurrentPosition(
            // ignore: deprecated_member_use
            desiredAccuracy: LocationAccuracy.high);
        
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        
        String address = 'Nomalum manzil';
        if (placemarks.isNotEmpty) {
          Placemark place = placemarks.first;
          address = '${place.street}, ${place.locality}, ${place.country}';
        }
        
        emit(LocationLoaded(
            latitude: position.latitude,
            longitude: position.longitude,
            address: address));
      } catch (e) {
        emit(LocationError(message: e.toString()));
      }
    });
  }

  Future<void> checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      return Future.error('Joylashuv xizmatlari ochirilgan');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Joylashuv ruxsatlari rad etildi');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Joylashuv ruxsatlari doimiy rad etilgan, biz ruxsat soray olmaymiz');
    }
  }
}