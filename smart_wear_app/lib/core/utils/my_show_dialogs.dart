import 'package:flutter/material.dart';

class MyShowDialog {
  // Display a progress indicator while resetting the password
  static Widget successDialog(BuildContext context, String success) {
    return AlertDialog(
      title: Text('Success'),
      content: Text(success),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  static Widget errorDialog(BuildContext context, String error) {
    return AlertDialog(
      title: Text(error),
      content: Text(error),
      actions: <Widget>[
        ElevatedButton(
          child: Text('OK'),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Theme.of(context).errorColor),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
