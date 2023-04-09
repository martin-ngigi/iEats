import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_eats/controllers/location_controller.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:google_maps_webservice/src/places.dart';

class LocationDialogue extends StatelessWidget {
  final GoogleMapController mapController;

  const LocationDialogue({Key? key, required this.mapController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Container(
      padding: EdgeInsets.all(Dimensions.width10),
      alignment: Alignment.topCenter, /// comment this so as to make the dialogue fill the entire screen
      /**
       * Material Widget will make this dialogue pop up
       */
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20/2),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: Dimensions.screenWidth,
            child:  TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: _controller,
                  textInputAction: TextInputAction.search,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    hintText: "search location...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            style: BorderStyle.none,
                            width: 0
                        )
                    ),
                    hintStyle: Theme.of(context).textTheme.headline2?.copyWith(
                        color: Theme.of(context).disabledColor,
                        fontSize: Dimensions.font16
                    ),
                  )
              ),
              onSuggestionSelected: (Prediction suggestion) {
                Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);

                /// close the dialogue box
                Get.back();
              },

              /**
               * As we type, it gets us suggestions.
               */
              suggestionsCallback: (pattern) async {
                return await Get.find<LocationController>().searchLocation(context, pattern);
              },

              itemBuilder: ( context, Prediction suggestion){
                return Padding(
                  padding: EdgeInsets.all(Dimensions.width10),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Expanded(
                          child: Text(
                              suggestion.description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline2?.copyWith(
                              color: Theme.of(context).textTheme.bodyText1?.color,
                              fontSize: Dimensions.font16
                            ),
                          )
                      )
                    ],
                  ),
                );
              },

            ),
          ),
        ),
      ),
    );
  }
}
