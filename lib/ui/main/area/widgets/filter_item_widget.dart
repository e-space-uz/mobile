import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/core/theme/app_text_style.dart';
import 'package:e_space_mobile/data/models/area/single_entity/single_entity_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                selectedItemBuilder: (context) {
                  return [
                    Text(value??'no item', style: TextStyle(color: AppColors.black))
                  ];
                },
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

class FilterItemsButton extends StatelessWidget {

   FilterItemsButton({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.isListVisible,
    required this.listOfItems,
    required this.onItemTap,
    required this.titleColor,
  }) : super(key: key);
  final String image;
  final String title;
  final Function() onTap;
  final Function(int index) onItemTap;
  final bool isListVisible;
  final List<String> listOfItems;
  final Color titleColor;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 12 ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.black12,width: 1),
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/$image.svg',
                    height: 16,width: 16,color: AppColors.black60),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                      title,
                      style: AppTextStyles.applicationAcceptDate
                          .copyWith(color: titleColor)),
                ),
                const SizedBox(width: 8),
                const Icon(CupertinoIcons.chevron_down,size: 16,color: AppColors.black40)
              ],
            ),
          ),
        ),
        Visibility(
          visible: isListVisible,
          child: Container(
            margin: EdgeInsets.only(top: 12),
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.searchBarBg,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: ListView.separated(
                itemCount: listOfItems.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>
                    Material(
                      color: AppColors.white,
                      child: InkWell(
                        onTap:(){
                          onItemTap(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                          child: Text(
                              listOfItems[index],
                              style: AppTextStyles.applicationTime
                          ),
                        ),
                      ),
                    ),
              separatorBuilder: (context,index)=>const Divider(height: 0),
            ),
          ),
        )
      ],
    );
  }
}

class FilterItemsButtonWithMultiCheck extends StatelessWidget {
  FilterItemsButtonWithMultiCheck({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    required this.isListVisible,
    required this.listOfItems,
    required this.onItemTap,
    this.checkedCount=0,
  }) : super(key: key);
  final String image;
  final String title;
  final Function() onTap;
  final Function(int index) onItemTap;
  final bool isListVisible;
  final List<CheckAndValue> listOfItems;
  final int checkedCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 12 ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.black12,width: 1),
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/$image.svg',
                    height: 16,width: 16,color: AppColors.black60),
                const SizedBox(width: 8),
                Text(
                    title,
                    style: AppTextStyles.applicationAcceptDate
                        .copyWith(color: checkedCount==0?
                    AppColors.black40:AppColors.black)),
                const SizedBox(width: 4),
                Visibility(
                  visible: checkedCount!=0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.lightBlue
                    ),
                    child: Text(checkedCount.toString(),
                        style: TextStyle(color: AppColors.assets)),
                  ),
                ),
                const SizedBox(width: 8),
                Spacer(),
                const Icon(CupertinoIcons.chevron_down,size: 16,color: AppColors.black40)
              ],
            ),
          ),
        ),
        Visibility(
          visible: isListVisible,
          child: Container(
            margin: EdgeInsets.only(top: 12),
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.searchBarBg,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: ListView.separated(
              itemCount: listOfItems.length,
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index)=>
                  InkWell(
                    onTap:(){
                      onItemTap(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                      child: Row(
                        children: [
                          Icon(
                              listOfItems[index].isCheck?
                              CupertinoIcons.checkmark_square_fill:
                              CupertinoIcons.stop,
                              color: listOfItems[index].isCheck?
                              AppColors.assets:AppColors.black2,
                              size: 20),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                                listOfItems[index].title,
                                style: AppTextStyles.applicationTime
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context,index)=>const Divider(height: 0),
            ),
          ),
        )
      ],
    );
  }
}

class CheckAndValue{
  bool isCheck;
  String title;

  CheckAndValue({
    required this.title,
    required this.isCheck});

}