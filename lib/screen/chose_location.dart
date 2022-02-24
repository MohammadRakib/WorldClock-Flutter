import 'package:flutter/material.dart';
import 'package:world_clock_flutter/services/get_location_time.dart';

class ChoseLocation extends StatefulWidget {
  const ChoseLocation({Key? key}) : super(key: key);

  @override
  _ChoseLocationState createState() => _ChoseLocationState();
}

class _ChoseLocationState extends State<ChoseLocation> {
  List<LocationTime> location_list = [
    LocationTime(
        location: 'Dhaka', imageUri: 'bangladesh.png', uri: 'Asia/Dhaka'),
    LocationTime(location: 'London', imageUri: 'uk.png', uri: 'Europe/London'),
    LocationTime(
        location: 'Athens', imageUri: 'greece.png', uri: 'Europe/Athens'),
    LocationTime(location: 'Cairo', imageUri: 'egypt.png', uri: 'Africa/Cairo'),
    LocationTime(
        location: 'Nairobi', imageUri: 'kenya.png', uri: 'Africa/Nairobi'),
    LocationTime(
        location: 'Chicago', imageUri: 'usa.png', uri: 'America/Chicago'),
    LocationTime(
        location: 'New York', imageUri: 'usa.png', uri: 'America/New_York'),
    LocationTime(
        location: 'Seoul', imageUri: 'south_korea.png', uri: 'Asia/Seoul'),
    LocationTime(
        location: 'Jakarta', imageUri: 'indonesia.png', uri: 'Asia/Jakarta'),
  ];

  updateTime(int index) async{
    String time = await location_list[index].getTime();
    Navigator.pop(context,{
      'time': time,
      'location': location_list[index].location,
      'imageUri': location_list[index].imageUri,
      'isDay': location_list[index].isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Chose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: location_list.length,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              tileColor: Colors.grey[200],
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${location_list[index].imageUri}'),
              ),
              title: Text(location_list[index].location),
              onTap: () {
               updateTime(index);
              },
            ),
          );
        },
      ),
    );
  }
}
