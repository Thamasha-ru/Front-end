import 'package:flutter/material.dart';
import 'package:fuel_app/theme.dart';
import 'package:http/http.dart' as http;

class QueueUpdate extends StatefulWidget {
  const QueueUpdate({super.key});

  @override
  State<QueueUpdate> createState() => _QueueUpdateState();
}

class _QueueUpdateState extends State<QueueUpdate> {
  int _clickcount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fuel Status'),
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
                child: Column(children: [
              const Image(
                image: AssetImage('images/fuelque.png'),
                height: 300,
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: RichText(
                        text: const TextSpan(
                            text: 'Welcome to ',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: kSecondaryColor),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Fuel House',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor))
                        ])),
                  ),
                ),
              ),
              const Text(
                'Update your status here \n  to get a better service',
                style: TextStyle(
                    //color: kDarkGreyColor,
                    color: kZambeziColor,
                    fontSize: 15),
              ),
              const SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _clickcount++;
                        print(_clickcount);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      //primary: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 65, vertical: 20),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    child: const Text('Join To The Queue'),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      var response = await http.post(
                          Uri.parse(
                              "https://fuel-app-backend.up.railway.app/api/fuelQueue/exitBeforePump"),
                          body: {});
                      print(response.body);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      // primary: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    child: const Text('Exit Before Pump Fuel'),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      var response = await http.post(
                          Uri.parse(
                              "https://fuel-app-backend.up.railway.app/api/fuelQueue/exitAfterPump"),
                          body: {});
                      print(response.body);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      //primary: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 57, vertical: 20),
                      textStyle: const TextStyle(
                        color: kTextFieldColor,
                        fontSize: 20,
                        //fontWeight: FontWeight.bold
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    child: const Text('Exit After Pump Fuel'),
                  ),
                ],
              ),
            ])),
          ),
        ));
  }
}
