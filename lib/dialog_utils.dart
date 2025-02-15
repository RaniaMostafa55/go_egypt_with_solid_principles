
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
    if(posMessageName!= null ){
      actions.add(
        TextButton(
          onPressed:(){
            Navigator.pop(context);
            if(posAction !=null){
              posAction.call();
            }
          },
          child: Text(posMessageName),
        ),
      );
    }if(negMessageName!= null ){
      actions.add(
        TextButton(
          onPressed: (){
            Navigator.pop(context);
            if(negAction !=null){
              negAction.call();
            }
          },
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