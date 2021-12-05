/*
import 'package:flutter/material.dart';

_selectDate(BuildContext context) async {
  var selectedDate = DateTime.parse(controller.birthDate.value);
  DateTime pickedDate = await showModalBottomSheet<DateTime>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      DateTime tempPickedDate;
      return Container(
        height: 300,
        decoration: BoxDecoration(
            color: clrWhite,
            borderRadius:
            BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: CupertinoDatePicker(
                  initialDateTime:selectedDate != null ?
                  selectedDate : DateTime.now(),
                  minimumDate:  DateTime(1940, 01, 01),
                  minimumYear: 1940,
                  maximumYear: DateTime.now().year,
                  maximumDate: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime dateTime) {
                    tempPickedDate = dateTime;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: customButton(
                  text: "Выбрать",
                  function: () {
                    Get.back(result: tempPickedDate);
                  }),
            ),
          ],
        ),
      );
    },
  );
  if (pickedDate != null && pickedDate != selectedDate) {
    selectedDate = pickedDate;
    controller.birthDate.value =
    "${selectedDate.year}-${selectedDate.month > 9 ? selectedDate.month :
    '0${selectedDate.month}'}-${selectedDate.day > 9 ? selectedDate.day :
    '0${selectedDate.day}'}";
    controller.timeStamp = selectedDate.millisecondsSinceEpoch;
  }
}
}
*/
