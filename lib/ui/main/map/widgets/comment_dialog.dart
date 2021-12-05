import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showCommentDialog(BuildContext context,Function() onTap){
  showAlignedDialog(
      followerAnchor: Alignment.center,
      targetAnchor: Alignment.center,
      context: context,
      isGlobal: false,
      builder: (context){
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.background
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text(
            'Metus hac netus sit varius '
              'nam orci sed etiam dolor. '
                'Aenean pharetra neque, diam volutpat',
            style: AppTextStyles.dialogText,
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.assets
                ),
                child: Text(
                    'Продольжить',
                    style: AppTextStyles.dialogText.copyWith(color: AppColors.white)),
              ),
            ),
          )
        ],),
      ),
    );
  });
}

 Widget showToast() {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: AppColors.assets,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("This is a Custom Toast"),
      ],
    ),
  );
  /*FToast fToast = FToast();
  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: Duration(seconds: 2),
  );*/
   return toast;
 /* // Custom Toast Position
  fToast.showToast(
      child: toast,
      toastDuration: Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          child: child,
          top: 16.0,
          left: 16.0,
        );
      });*/

}