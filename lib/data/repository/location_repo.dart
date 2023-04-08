import 'package:get/get.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:i_eats/data/api/api_client.dart';
import 'package:i_eats/models/address_model.dart';
import 'package:i_eats/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo{
   final ApiClient apiClient;
   final SharedPreferences sharedPreferences;

   LocationRepo({required this.apiClient, required this.sharedPreferences, });

  Future<Response> getAddressFromGeocode(LatLng latLng) async {
    return await apiClient.getData(
        '${AppConstants.GEOCODE_URI}'
      '?lat=${latLng.latitude}&lng=${latLng.longitude}'
    );
  }

  String getUserAddress() {
    return sharedPreferences.getString(AppConstants.USER_ADDRESS)??""; // if null, return ""
  }

  Future<Response> addAddress(AddressModel addressModel) async {

    return await apiClient.postData(AppConstants.ADD_USER_ADDRESS, addressModel.toJson());
  }

  Future<Response> getAllAddress() async {

    return await apiClient.getData(AppConstants.ADDRESS_LIST_URI);
  }

  Future<bool> saveUserAddress(String address) async {

    /// update the token incase its a new user that has logged in
    apiClient.updateHeader(sharedPreferences.getString(AppConstants.TOKEN)!);

    return await sharedPreferences.setString(AppConstants.USER_ADDRESS, address);
  }

  Future<Response> getZone(String lat, String lng) async {
    return await apiClient.getData("${AppConstants.ZONE_URI}?lat=$lat&lng=$lng");
  }
}