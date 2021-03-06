import 'package:flutter/material.dart';
import 'package:world_clock_flutter/services/get_location_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getdata() async{
      LocationTime locationTime = LocationTime(location: 'Dhaka', imageUri: 'bangladesh.png', uri: 'Asia/Dhaka');
      String temp = await locationTime.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'time': temp,
        'location': locationTime.location,
        'imageUri': locationTime.imageUri,
        'isDay': locationTime.isDay,
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
      body: Center(
          // child: CircularProgressIndicator(),
        child: SpinKitThreeInOut(
          color: Colors.brown,
          size: 50.0,
        ),
      ),
    );
  }
}
