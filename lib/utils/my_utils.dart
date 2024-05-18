import 'package:flutter/material.dart';

class MyApp {
  void showSnakBarMsg(BuildContext clCtx, String clMsg,
      {int clDurationMillSec = 2}) {
    ScaffoldMessenger.of(clCtx).showSnackBar(SnackBar(
      content: Text(clMsg),
      duration: Duration(milliseconds: clDurationMillSec),
      action: SnackBarAction(
        label: "Ok",
        onPressed: () {},
      ),
    ));
  }

  Future<bool> showAlertDialog(
      BuildContext clContext, String clMsg, String clTitle,
      {String clbtnOkTitle = "OK", String clbtnOkCancel = "Cancel"}) async {
    // set up the buttons
    bool returnValue = false;
    Widget cancelButton = ElevatedButton(
      child: Text(clbtnOkCancel),
      onPressed: () {
        returnValue = false;
        Navigator.of(clContext).pop(false);
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text(clbtnOkTitle),
      onPressed: () {
        returnValue = true;
        Navigator.of(clContext).pop(true);
      },
    ); // set up the AlertDialog
    AlertDialog lAlert = AlertDialog(
      title: const Text("Do you want to continue?"),
      content: Text(clMsg),
      actions: [
        cancelButton,
        continueButton,
      ],
    ); // show the dialog

    await showDialog<bool?>(
      context: clContext,
      builder: (BuildContext context) {
        return lAlert;
      },
    );
    return returnValue;
  }
}
