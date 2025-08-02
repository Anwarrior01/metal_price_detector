import 'package:flutter/material.dart';
import 'package:metal_price_market/network/dio_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    getPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getPrice();
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Metal Price Market'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/gold.png',
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'GOLD',
                      style: TextStyle(
                        fontSize: 32,
                        color: const Color.fromARGB(255, 246, 209, 109),
                      ),
                    ),
                    Text(
                      '$goldI💲',
                      style: TextStyle(fontSize: 20, color: Colors.amberAccent),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/silver.png',
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'SILVER',
                      style: TextStyle(
                        fontSize: 32,
                        color: const Color.fromARGB(255, 193, 193, 193),
                      ),
                    ),
                    Text(
                      '$silverI💲',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 178, 178, 178),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                getPrice();
              },
              child: Text(
                'Refresh',
                style: TextStyle(color: Colors.amberAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double? goldD;

  int? goldI;

  double? silverD;

  int? silverI;

  getPrice() {
    DioHelper.getData('XAU/USD')
        .then((value) {
          setState(() {});
        })
        .catchError((error) {
          print(error.toString());
        });
    DioHelper.getData('XAG/USD')
        .then((value) {
          setState(() {
            silverD = value.data['price'];
            print(silverD);
          });
        })
        .catchError((error) {
          print(error.toString());
        });
    goldI = goldD?.toInt();
    silverI = silverD?.toInt();
  }
}
