import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String bgImage = '';
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map : data;
    bgImage = data['isDay'] ? 'day.jpg':'night.jpg';
    bgColor = data['isDay'] ? Colors.indigo:Colors.blue[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async{
                      dynamic temp = await Navigator.pushNamed(context, '/choseLocation');
                      setState(() {
                        data = temp as Map;
                      });
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.red[900],
                    ),
                    icon: const Icon(Icons.location_on,size: 35.0,),
                    label: const Text('Edit Location',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 35.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
