

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ryalize_assignment/constants/app_colors.dart';
import 'package:ryalize_assignment/utils/theming/screen_util.dart';

///
/// Common widget to show success or failure toast messages.
///

class Toast {
  Toast._();
  static void showToast(
      BuildContext context, String title,{ToastType toastType = ToastType.success,int toastLength = ToastLength.medium,ToastGravity grevity = ToastGravity.CENTER}) {
    var toast = FToast();
    var widget = ToastWidget(title: title,type: toastType,);
    toast.init(context);
    toast.showToast(
        child: widget,
        toastDuration: Duration(seconds: toastLength),
        gravity: grevity
    );
  }
}

enum ToastType{
  error,
  warning,
  success
}

class ToastLength{
 static const int short=2;
 static const int long=5;
 static const int medium = 3;
}


class ToastWidget extends StatelessWidget {
  const ToastWidget({required this.title,required this.type,this.icon,Key? key}) : super(key: key);
  final Widget? icon;
  final String title;
  final ToastType type;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        constraints: BoxConstraints(minHeight:44.toHeight),
        decoration: BoxDecoration(
          color: AppColors.color000000,
            borderRadius: BorderRadius.circular(14.toWidth),),
      margin:  EdgeInsets.symmetric(horizontal: 24.toWidth),
      padding: EdgeInsets.symmetric(horizontal: 16.toWidth,vertical: 10.toHeight),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: icon==null?MainAxisAlignment.center:MainAxisAlignment.start,
        children: [
          if(icon!=null)...[
          icon??const SizedBox.shrink(),
            const SizedBox(width: 12,)
          ],
          Flexible(
              fit: FlexFit.tight,
              child: Text(title,style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15.toFont,color: theme.primaryColorLight),textAlign: icon==null?TextAlign.center:TextAlign.start,))
        ],
      ),
    );
  }
}
