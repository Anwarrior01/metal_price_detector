import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metal_price_market/cubit/cubit.dart';
import 'package:metal_price_market/cubit/states.dart';
import 'package:metal_price_market/network/dio_helper.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()
        ..getGoldPrice()
        ..getSilverPrice(),
      child: BlocConsumer<MainCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
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
                            '${MainCubit.get(context).goldI}💲',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.amberAccent,
                            ),
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
                            '${MainCubit.get(context).silverI}💲',
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
                    onTap: () {},
                    child: Text(
                      'Refresh',
                      style: TextStyle(color: Colors.amberAccent),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
