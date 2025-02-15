import 'package:flutter/material.dart';
import 'package:water_tracker/model_button.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int consumption = 0;
  int _goal = 2000;
  double percent = 0.0;

  drinkingAmount(int amount) {
    setState(() {
      consumption = (consumption + amount).clamp(0, 2000);
      print(consumption);
       percent = consumption / _goal;
    });
  }

  Reset() {
    setState(() {
      consumption = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Water Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffe3f2fd),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.withOpacity(.2),
                        blurRadius: 20,
                        spreadRadius: 10)
                  ]),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Today\'s Intake',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${consumption}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child:  CircularProgressIndicator(
                    value: percent,
                    color: Colors.blue,
                    strokeWidth: 4,
                    backgroundColor: Colors.black45,
                  ),
                ),
                 Text(
                  '${percent*100}%',
                  style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ModelButton(
              text: '200 ',
              onClick: () => drinkingAmount(200),
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            ModelButton(
              text: '500',
              onClick: () => drinkingAmount(500),
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            ModelButton(
              text: '700',
              onClick: () => drinkingAmount(700),
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Reset(),
                child: Text('Reset'),
                style: ElevatedButton.styleFrom(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
