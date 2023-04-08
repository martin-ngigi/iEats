import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:i_eats/base/custom_button.dart';
import 'package:i_eats/controllers/location_controller.dart';
import 'package:i_eats/routes/route_helper.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/utils/dimensions.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddress;
  final GoogleMapController? googleMapController;

  const PickAddressMap({Key? key,
    required this.fromSignup,
    required this.fromAddress,
    this.googleMapController}) : super(key: key);

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initialPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// location not saved id db
    if(Get.find<LocationController>().addressList.isEmpty){
      _initialPosition = LatLng(-1.286389, 36.817223);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
    }
    /// location saved id db
    else{
      if(Get.find<LocationController>().addressList.isNotEmpty){
        _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress["latitude"]),
          double.parse(Get.find<LocationController>().getAddress["longitude"]),
        );

        _cameraPosition = CameraPosition(target: _initialPosition, zoom:  17);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController){
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                children: [
                  /// Map to cover entire page
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: _initialPosition, zoom: 17
                    ),
                    zoomControlsEnabled: false,
                    onCameraMove: (CameraPosition cameraPosition){
                      _cameraPosition = cameraPosition;
                    },
                    onCameraIdle: (){
                      Get.find<LocationController>().updatePosition(_cameraPosition, false);
                    },
                  ),

                  /// Pick Image
                  Center(
                    child: !locationController.loading ?
                    Image.asset(
                        "assets/images/pick_marker.png",
                      height: 50,
                      width: 50,
                    )
                        : CircularProgressIndicator()

                  ),

                  /// Search bar
                  Positioned(
                    top: Dimensions.height45,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                        ),
                        child: Row(
                          children: [
                            /// location icon
                            Icon(
                              Icons.location_on,
                              size: 25,
                              color: AppColors.yellowColor,
                            ),

                            /// address text
                            Expanded(
                                child: Text(
                                  "${locationController.pickPlacemark.name??""}", // if empty, show ""
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.font16
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                            ),
                          ],
                        ),
                      )
                  ),

                  ///  Pick Address Button
                  Positioned(
                      bottom: 80,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      child: locationController.isLoading ? Center( child:  CircularProgressIndicator(),) :
                      CustomButton(
                        buttonText: locationController.inZone? (widget.fromAddress? "Pick Address" : "Pick location") : "Service is not available in your area",
                        onPressed: (locationController.buttonDisabled || locationController.loading) ? null : (){
                          if(locationController.pickPosition.latitude != 0 && locationController.pickPlacemark.name != null){
                            if(widget.fromAddress){ /// from Address page
                              if(widget.googleMapController != null){
                                print("----------> [PickAddressMap]  Now you can clicked on this");

                                widget.googleMapController!.moveCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target: LatLng(
                                              locationController.pickPosition.latitude,
                                              locationController.pickPosition.longitude,
                                            )
                                        )
                                    )
                                );

                                locationController.setAddressData();
                              }
                              /// Navigate to previous page
                              // Get.back() creates update problem for updating a list or a value.
                              Get.toNamed(RouteHelper.getAddressPage());
                            }
                          }
                        },
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
