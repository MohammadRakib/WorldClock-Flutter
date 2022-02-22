import 'package:flutter/material.dart';

class ChoseLocation extends StatefulWidget {
  const ChoseLocation({Key? key}) : super(key: key);

  @override
  _ChoseLocationState createState() => _ChoseLocationState();
}

class _ChoseLocationState extends State<ChoseLocation> {

  @override
  void initState() {
    super.initState();
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
