import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class AppLayout{
  static getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
  static getScrennHeight(){
    return Get.height;
  }
  static getScrennWidth(){
    return Get.width;
  }
  static getHeight(double pixels){
    double x = getScrennHeight()/pixels; //844:200 = 4.22
    return getScrennHeight()/x;
  }
  static getWidth(double pixels){
    double x = getScrennWidth()/pixels; //844:200 = 4.22
    return getScrennWidth()/x;
  }
}