import 'package:flutter/material.dart';
import 'package:world_clock_flutter/services/get_location_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getdata() async{
      LocationTime locationTime = LocationTime(location: 'Dhaka', imageUri: 'dhaka', uri: 'Dhaka');
      String temp = await locationTime.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'time': temp,
        'location': locationTime.location,
        'imageUri': locationTime.imageUri
      });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Loading')),
    );
  }
}
