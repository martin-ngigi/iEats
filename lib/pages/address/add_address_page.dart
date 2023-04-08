//stful
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_eats/controllers/auth_controller.dart';
import 'package:i_eats/controllers/location_controller.dart';
import 'package:i_eats/controllers/user_controller.dart';
import 'package:i_eats/models/address_model.dart';
import 'package:i_eats/pages/address/pick_address_map.dart';
import 'package:i_eats/routes/route_helper.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:i_eats/widgets/app_text_field.dart';
import 'package:i_eats/widgets/big_text.dart';

import '../../widgets/app_icon.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();

  late bool _isLogged;
  CameraPosition _cameraPosition =  const CameraPosition(
    target: LatLng(-1.286389, 36.817223),
    zoom: 17,
  );

  late LatLng _initialPosition =LatLng(-1.286389, 36.817223);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLogged = Get.find<AuthController>().userLoggedIn();
    /// if user has logged in and there is no user data, then get user data/infor
    if(_isLogged && Get.find<UserController>().userModel == null){
      Get.find<UserController>().getUserInfo();
    }

    /// user already has address
    if(Get.find<LocationController>().addressList.isNotEmpty){
      /**
      bug fix:
          User may have logged in to a new device
       */
      if(Get.find<LocationController>().getUserAddressFromLocalStorage() == ""){
        Get.find<LocationController>().saveUserAddress(
          Get.find<LocationController>().addressList.last
        );
      }

      /// get the address
      Get.find<LocationController>().getUserAddress();

      _cameraPosition = CameraPosition(
          target:LatLng(
            double.parse(Get.find<LocationController>().getAddress["latitude"]),
            double.parse(Get.find<LocationController>().getAddress["longitude"]),
          ),
      );

      _initialPosition = LatLng(
        double.parse(Get.find<LocationController>().getAddress["latitude"]),
        double.parse(Get.find<LocationController>().getAddress["longitude"]),
      );

      print("-------> Longitude is : ${Get.find<LocationController>().getAddress["latitude"]}");
      print("--------> Latitude is : ${Get.find<LocationController>().getAddress["longitude"]}");
    }
    else{
      print("--------->No address found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Page"),
        backgroundColor: AppColors.mainColor,
      ),

      body: GetBuilder<UserController>(builder: (userController){
        /**
         * Get address from the local storage...
         */
        //if name is empty
        if(userController.userModel != null && _contactPersonName.text.isEmpty){
          _contactPersonName.text = userController.userModel.name;
          _contactPersonNumber.text = userController.userModel.phone;
          if(Get.find<LocationController>().addressList.isNotEmpty){
            _addressController.text =  Get.find<LocationController>().getUserAddress().address;
          }
        }
        return GetBuilder<LocationController>(builder : (locationController){
          /**
           * Get address from the Google maps...
           */
          _addressController.text = '${locationController.placemark.name??''}'// if empty use "finding name..."
              '${locationController.placemark.locality??''}'
              '${locationController.placemark.postalCode??''}'
              '${locationController.placemark.country??''}';

          print("---------> [AddAddressPage] Address in my view is ${_addressController.text}");
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width, // or double.maxFinite
                  margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 2,
                        color: AppColors.mainColor
                    ),
                  ),
                  child: Stack(
                    children: [
                      GoogleMap(
                        onTap: (latlag){
                          Get.toNamed(RouteHelper.getPickAddressPage(),
                          arguments: PickAddressMap(
                            fromSignup: false,
                            fromAddress: true, // from address page
                            googleMapController: locationController.mapController,
                          )
                          );
                        },
                        initialCameraPosition: CameraPosition(
                            target: _initialPosition,
                            zoom: 17
                        ),
                        zoomControlsEnabled: false,
                        compassEnabled: false,
                        indoorViewEnabled: true,
                        mapToolbarEnabled: false,
                        myLocationEnabled: true,
                        // myLocationButtonEnabled: true,
                        onCameraIdle: (){
                          locationController.updatePosition(_cameraPosition, true);
                        },
                        onCameraMove: ((position) => _cameraPosition=position),
                        onMapCreated: (GoogleMapController controller){
                          locationController.setMapController(controller);
                          if(Get.find<LocationController>().addressList.isEmpty){
                            //locationController.getCurrentLocation(true, mapController: controller);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height20),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: locationController.addressTypeList.length,
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){
                              locationController.setAddressTypeIndex(index);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                                color: Theme.of(context).cardColor,
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey[200]!,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                              margin: EdgeInsets.only(right: Dimensions.width10),
                              child: Icon(
                                index == 0? Icons.home_filled : index == 1? Icons.work : Icons.location_on,
                                color: locationController.addressTypeIndex ==index ? AppColors.mainColor : Theme.of(context).disabledColor,
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),

                SizedBox(height: Dimensions.height20,),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20),
                  child: BigText(text: "Delivery Address"),
                ),
                SizedBox(height: Dimensions.height10,),
                AppTextField(textController: _addressController, hintText: "Your Address", icon: Icons.map, textType: TextInputType.streetAddress),

                SizedBox(height: Dimensions.height20,),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20),
                  child: BigText(text: "Contact Name"),
                ),
                SizedBox(height: Dimensions.height10,),
                AppTextField(textController: _contactPersonName, hintText: "Your Name", icon: Icons.person, textType: TextInputType.text),

                SizedBox(height: Dimensions.height20,),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20),
                  child: BigText(text: "Your Number"),
                ),
                SizedBox(height: Dimensions.height10,),
                AppTextField(textController: _contactPersonNumber, hintText: "Your Phone", icon: Icons.phone, textType: TextInputType.number)

              ],
            ),
          );
        });
      }),

      bottomNavigationBar: GetBuilder<LocationController>(builder: (locationController){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Dimensions.height20*8,
              padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20*2),
                    topRight:  Radius.circular(Dimensions.radius20*2),
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /**
                   * Save Address
                   */
                  GestureDetector(
                    onTap: (){
                      AddressModel _addressModel = AddressModel(
                        addressType: locationController.addressTypeList[locationController.addressTypeIndex],
                        contactPersonName: _contactPersonName.text,
                        contactPersonNumber: _contactPersonNumber.text,
                        address: _addressController.text,
                        latitude: locationController.position.latitude.toString(),
                        longitude: locationController.position.longitude.toString(),
                      );
                      locationController.addAddress(_addressModel).then((response){
                        if(response.isSuccess){
                          /// navigate to home page
                          Get.toNamed(RouteHelper.getInitial());
                          ///show a snackbar with a message
                          Get.snackbar("Address", "Address added successfully.");
                        }
                        else{
                          Get.snackbar("Address", "Could not save address.");
                        }

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                      child: BigText(text: "Save Address", color: Colors.white, size: 26,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),


    );
  }
}
