import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final Function(String? value) onChanged;
  final String? value;
  final String? label;
  final String? hint;
  final List<String> listOfItems;

   CustomDropDown({
    Key? key,
    required this.onChanged,
    this.value,
    this.label,
    this.hint,
    required this.listOfItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Text(label ?? ''),
        SizedBox(height: 4),
        Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: /*value==null?
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 2.0),
                child: Text(hint ?? '',
                    style: AppTextStyles.midGreyPerson
                        .copyWith(color: AppColors.black3)
                ),
              ):*/
              DropdownButton<String>(
                underline: SizedBox.shrink(),
                isExpanded: true,
                // selectedItemBuilder: (context) {
                //   return [
                //     Text('zdvsad', style: TextStyle(color: AppColors.black))
                //   ];
                // },
                focusColor: Colors.white,
                value: value,
                hint: Text(hint??''),
                menuMaxHeight: 400,
                style: TextStyle(color: Colors.white),
                icon: Icon(Icons.keyboard_arrow_down),
                iconEnabledColor: Colors.black,
                items:listOfItems.
                map<DropdownMenuItem<String>>((String val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(
                      val, style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          /*  Visibility(
              visible: value == null,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Text(hint ?? '',
                    style: AppTextStyles.midGreyPerson
                        .copyWith(color: AppColors.black3)
                ),
              ),
            )*/
          ],
        ),
      ],
    );
  }
}
