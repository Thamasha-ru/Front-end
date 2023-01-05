import 'package:flutter/material.dart';
import 'package:fuel_app/theme.dart';
import 'package:quickalert/quickalert.dart';

class FuelArrivalUpdate extends StatefulWidget {
  const FuelArrivalUpdate({super.key});

  @override
  State<FuelArrivalUpdate> createState() => _FuelArrivalUpdateState();
}

class _FuelArrivalUpdateState extends State<FuelArrivalUpdate> {
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

  void selectArrivalTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Success alert builder
    final successAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Time Update Successfully!',
        );
      },
      title: 'Are you sure?',
      text: 'Conform Update',
      leadingIcon: const Icon(
        Icons.question_mark_outlined,
        color: Colors.red,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Fuel Arrival Update",
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('images/arrival.png'),
              height: 250,
              width: 200,
            ),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                //primary: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                textStyle: const TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.bold
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                ),
              ),
              child: const Text('Select Fuel Type'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: selectArrivalTime,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                //primary: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                textStyle: const TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.bold
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                ),
              ),
              child: const Text('Update Fuel Arrival Time'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                //primary: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                textStyle: const TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.bold
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                ),
              ),
              child: const Text('Update Fuel Finished Time'),
            ),
            const SizedBox(
              height: 20,
            ),
            successAlert,
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Fuel Arrival Time:\n        ${_time.format(context)}',
                style: const TextStyle(fontSize: 25, color: kSecondaryColor
                    //fontWeight: FontWeight.bold
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//CUstom button
Card buildButton({
  required onTap,
  required title,
  required text,
  required leadingIcon,
}) {
  return Card(
    shape: const StadiumBorder(),
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    clipBehavior: Clip.antiAlias,
    elevation: 1,
    child: ListTile(
      onTap: onTap,
      leading: leadingIcon,
      title: Text(title ?? ""),
      subtitle: Text(text ?? ""),
      trailing: const Icon(
        Icons.keyboard_arrow_right_rounded,
      ),
    ),
  );
}
