import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 20,
              ),
              Text("Loading...")
            ],
          ),
        );
      });
}

void showMessage(BuildContext context,
    {String? title,
    String? message,
    String? posButtonText,
    Function? onPosClick,
    String? negButtonText,
    Function? onNegClick}) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title != null ? Text(title, style: TextStyle(fontSize: 20)) : null,
          content: message != null ? Text(message, style: TextStyle(fontSize: 16)) : null,
          actions: [
            if (posButtonText != null)
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if(onPosClick != null){
                      onPosClick();
                    }
                  },
                  child: Text(posButtonText)),
            if (negButtonText != null)
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if(onPosClick != null){
                      onPosClick();
                    }
                  },
                  child: Text(negButtonText))
          ],
        );
      });
}
