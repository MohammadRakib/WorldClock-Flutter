import 'package:flutter/material.dart';

class ChoseLocation extends StatefulWidget {
  const ChoseLocation({Key? key}) : super(key: key);

  @override
  _ChoseLocationState createState() => _ChoseLocationState();
}

class _ChoseLocationState extends State<ChoseLocation> {

  void getdata() async{
    String data = await Future.delayed(const Duration(seconds: 3),() => 'init');
    print(data);
    Future.delayed(Duration(seconds: 2),(){print('init 2');});
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Chose Location'),
        centerTitle: true,
      ),
    );
  }
}
