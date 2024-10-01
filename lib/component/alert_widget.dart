import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAlertDialogSimple(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showAlertDialog(BuildContext context, String title, Widget content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: content,
        actions: <Widget>[
          TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
// AlertDialog myAlertDialog({
//   @required BuildContext context,
//   @required Widget myContent,
//   @required Function onAccept,}){
//
//   return AlertDialog(
//       content: Column(
//       children = [
//       myContent,
//       FlatButton(child: Text("ok"), onPressed: onAccept),
//   FlatButton(child: Text("cancel"), onPressed: Navigator.pop(context),
//   ]
//   )
//   );
//   }