import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_eats/models/response_model.dart';
import '../data/repository/location_repo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../models/address_model.dart';

class LocationController extends GetxController implements GetxService{
  LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  bool _loading =  false;
  late Position _position; // from geolocator
  late Position _pickPosition;

  Placemark _placemark = Placemark(); // from geocoding
  Placemark get placemark => _placemark;

  Placemark _pickPlacemark = Placemark();
  Placemark get pickPlacemark => _pickPlacemark;

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;

  late List<AddressModel> _allAddressList = [];
  List<AddressModel> get allAddressList => _allAddressList;

  final List<String> _addressTypeList = ["home", "office", "others"];
  List<String> get addressTypeList => _addressTypeList;

  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;

  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;

  bool updateAddressData = true;
  bool _changeAddress =true;

  bool get loading =>_loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;


  void setMapController(GoogleMapController mapController){
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if(updateAddressData){
      _loading =true;
      update(); // update UI... Same as setState(){}

      try{
        if(fromAddress){ /// if this method was called from AddAddress Page
          _position = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            altitude: 1,
            speedAccuracy: 1,
            speed: 1,
          );
        }
        else{ /// if this method was called from another Page
          _pickPosition = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1,
            accuracy: 1,
            altitude: 1,
            speedAccuracy: 1,
            speed: 1,
          );
        }

        if(_changeAddress){
          String _address = await getAddressFromGeocode(
            LatLng(
                position.target.latitude,
                position.target.longitude,
            )
          );
          /// if from address page set _placemark = Placemark(name: _address) else set _pickPlacemark
          fromAddress?_placemark = Placemark(name: _address):
              _pickPlacemark = Placemark(name: _address);
          print("------> [LocationController] Address Name : ${_placemark.name}");//  _placemark.name, _placemark.country , _placemark.locality , _placemark.postalCode , _placemark.street
        }
      }
      catch(e){
        print("-----> [LocationController] Location error: $e");
        //throw e;
      }
    }
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async{
    String _address = "Unknown Location Found";

    Response response = await locationRepo.getAddressFromGeocode(latLng);

    print("------> [LocationController] ADDRESS RESPONSE BODY"+response.body.toString());

    if(response.body["status"]== "OK"){
      _address = response.body["results"][0]['formatted_address'].toString();
      print("------> [LocationController] New Address is : $_address");

    }
    else{
      print("------> [LocationController] Error getting the google API");
    }

    update();
    return _address;
  }

  late Map<String, dynamic> _getAddress;
  Map get getAddress => _getAddress;

  AddressModel getUserAddress(){
    late AddressModel _addressModel;
    /**
     * Converting string to map using jsonDecode.
     */
    _getAddress = jsonDecode(locationRepo.getUserAddress()); // convert getUserAddress string to a json map

    try{
      _addressModel = AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
    }
    catch(e){
      print("------> [LocationController] Error: Getting USer Address Error. ${e}");
    }

    return _addressModel;
  }

  void setAddressTypeIndex(int index){
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModel> addAddress(AddressModel addressModel) async {
    _loading = true;
    update();

    Response response = await locationRepo.addAddress(addressModel);
    ResponseModel responseModel;
    //print("-----> [LocationController] SAVING ADDRESS Response ${response.body}");
    if(response.statusCode == 200){
      /// get all addresses from db
      await getAddressList();

      String message = response.body["message"]; // ()
      responseModel = ResponseModel(true, message);

      /// save user address
      await saveUserAddress(addressModel);

    }
    else{
      print("--------> [LocationController] Error: Could not save the address.");
      responseModel = ResponseModel(false, response.statusText!+ "Hint: Error, Could not save the address.");

    }
    update();
    return responseModel;
  }

  Future<void> getAddressList() async {
    Response response = await locationRepo.getAllAddress();

    if(response.statusCode == 200){
      _addressList = []; // make it empty
      _allAddressList = []; //make empty

      response.body.forEach((address){
        _addressList.add(AddressModel.fromJson(address));
        _allAddressList.add(AddressModel.fromJson(address));
      });
    }
    else{
      _addressList = []; // make it empty
      _allAddressList = []; //make empty
    }
    update();
  }

  //save in local storage
  Future<bool> saveUserAddress(AddressModel addressModel) async {
    /// convert object to json
    String userAddress = jsonEncode(addressModel.toJson());
    return await locationRepo.saveUserAddress(userAddress);
  }
}