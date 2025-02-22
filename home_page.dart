import 'package:flutter/material.dart';

//import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;

  void incrementNumber() async {
    number++;

    SharedPreferences pref = await SharedPreferences
        .getInstance(); //obj initialize ,pref er shahjje data get and set
    pref.setInt("counter",
        number); //counter key and number hocche value,key value pair hishebe hbe
    print(number);

    setState(() {}); //number build
  }

  void loadNumber() async //async karon background a cholte thakbe
  {
    SharedPreferences pref = await SharedPreferences.getInstance();

    int count =
        pref.getInt("counter") ?? 0; //?? 0 jkhn kichu pabe na tkhn 0 hbe

    number = count;

    setState(() {});
  }

  @override
  void initState() //statefulwidget er jnne shbr age call hbe initstate
  {
    super.initState();
    loadNumber();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          number
              .toString(), //text widget alwys string nibe tai number to string value nite hbe krn text number ney na
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          incrementNumber();
        },
        tooltip: "Add", //chepe dhorle dekhabe
        child: Icon(Icons.add), //plus sign icon
      ),
    );
    //return const Placeholder();
  }
}
