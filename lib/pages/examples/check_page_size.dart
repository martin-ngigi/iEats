import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class CheckPageSize extends StatefulWidget {
  const CheckPageSize({Key? key}) : super(key: key);

  @override
  State<CheckPageSize> createState() => _CheckPageSizeState();
}

class _CheckPageSizeState extends State<CheckPageSize> {
  String getDeviceType(){
    String device;
    if(SizerUtil.deviceType == DeviceType.mobile){
      device = "Mobile , width is ${Get.width}";
      print(device);
    }
    else if (SizerUtil.deviceType == DeviceType.tablet){
      device = "Tablet, width is ${Get.width}";
      print(device);
    }

    else if (SizerUtil.deviceType == DeviceType.windows){
      device = "Windows, width is ${Get.width}";
      print(device);
    }

    else if (SizerUtil.deviceType == DeviceType.mac){
      device = "Mac, width is ${Get.width}";
      print(device);
    }

    else if (SizerUtil.deviceType == DeviceType.linux){
      device = "Linux, width is ${Get.width}";
      print(device);
    }

    else if (SizerUtil.deviceType == DeviceType.web){
      device = "Web, width is ${Get.width}";
      print(device);
    }

    else {
      device ="UnKnown Device, width is ${Get.width}";
      print(device);
    }





    return device;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("PageSize is: "+getDeviceType()),
      ),
    );
  }
}
