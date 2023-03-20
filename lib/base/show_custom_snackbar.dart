import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_eats/widgets/big_text.dart';

//snackbar for error messages
void showCustomSnackBar(String message, {bool isError=true, String title="Error"}){ // [{bool isError=true, String title="Error"}] are optional while message is a must
  Get.snackbar(
    title, message,
    titleText: BigText(
      text: title,
      color: Colors.white,
    ),
    messageText: Text(
      message,
      style: const TextStyle(
          color: Colors.white
      ),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.redAccent,

  );
}