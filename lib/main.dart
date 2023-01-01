import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fuel_app/DashBoardPage/Body.dart';
import 'package:fuel_app/DashBoardPage/productScreen.dart';
import 'package:fuel_app/screans/selectNearestShed.dart';
import 'package:fuel_app/screans/selectVehicle.dart';
import 'package:fuel_app/station_owner_screen/fuelArrivalUpdateScreen.dart';
import 'DashBoardPage/DashBoardPage.dart';

void main() {
  runApp(FuelApp());
}

class FuelApp extends StatelessWidget {
  FuelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      title: 'Fuel App',
      //home: productScreen(),
      //home: SelectVehicle(),
      home: FuelArrivalUpdate(),
      //home: FuelFinishUpdate(),

      // home: const LogInScreen(),
    );
  }
}
