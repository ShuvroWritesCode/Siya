
import 'dart:ui';

class DoctorInfo{

  late Image img;
  late String doctorName;
  late String location;
  late String timing;
  late int fee;
  late String description;
  late String specialization;
  DoctorInfo(
  {
    // required this.img,
    required this.doctorName,
    required this.location,
    required this.timing,
    required this.fee,
    required this.specialization
  }
      );

  // String getName(){
  //   return this.buildingName;
  // }
}