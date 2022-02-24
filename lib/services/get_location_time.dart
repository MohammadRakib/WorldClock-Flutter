import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class LocationTime{

  String time = '';
  String location;
  String uri;
  String imageUri;
  late bool isDay;

  LocationTime({required this.location,required this.imageUri,required this.uri});

  Future<String> getTime() async{
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$uri'));
      Map data = jsonDecode(response.body);
      String dt = data['datetime'];
      DateTime dateTime = DateTime.parse(dt.substring(0,26));
      isDay = dateTime.hour > 6 && dateTime.hour < 18;
      time = DateFormat.jm().format(dateTime);
    }
    catch(e){
      print('Error Message: $e');
      // time = 'Could not load time';
      time = await getTime();
    }

    return time;
  }

}