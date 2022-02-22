import 'package:http/http.dart';
import 'dart:convert';
class LocationTime{

  String time = '';
  String location;
  String uri;
  String imageUri;

  LocationTime({required this.location,required this.imageUri,required this.uri});

  Future<String> getTime() async{
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/$uri'));
      Map data = jsonDecode(response.body);
      String dt = data['datetime'];
      DateTime dateTime = DateTime.parse(dt.substring(0,26));
      time = dateTime.toString();
      print(time);
    }
    catch(e){
      print('Error Message: $e');
      time = 'Could not load time';
    }

    return time;
  }

}