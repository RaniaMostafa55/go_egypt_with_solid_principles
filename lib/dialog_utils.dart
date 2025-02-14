
import 'package:flutter/material.dart';

class DialogUtils{

  static void  showLoading({required BuildContext context}){
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 10.0),
          Text('Loading...'),
        ],
      ),
    ));
  }
  static void  hideLoading( BuildContext context){
    Navigator.pop(context);
  }
  static void  showMessage({required BuildContext context, required String message , String? title, String?posMessageName,Function? posAction,String?negMessageName,Function? negAction}){
    List<Widget> actions = [];
    if(posMessageName!= null && posAction!= null){
      actions.add(
        TextButton(
          onPressed:(){
            posAction.call();
          },
          child: Text(posMessageName),
        ),
      );
    }if(negMessageName!= null && negAction!= null){
      actions.add(
        TextButton(
          onPressed: negAction.call(),
          child: Text(negMessageName),
        ),
      );
    }
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Text(message),
      title:Text( title??""),
      actions: actions,
      ),
    );
  }
}