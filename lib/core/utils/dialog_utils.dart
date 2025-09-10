import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isLoadingDialogVisible = false;
void showLoading(BuildContext context, {Key? key}) async {
  if(isLoadingDialogVisible) return;
  isLoadingDialogVisible = true;
  await showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          key: key,
          content: const Row(
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
hideLoading(BuildContext context) async{
  if(isLoadingDialogVisible){
    Navigator.pop(context);
    isLoadingDialogVisible = false;
  }
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
