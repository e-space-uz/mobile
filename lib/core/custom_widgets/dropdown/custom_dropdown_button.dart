import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String>? list;
  final String? hint;
  final String? value;
  final Function(String value)? onChanged;
  final Widget? icon;
  final Widget? item;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final TextStyle? hintStyle;
  final TextStyle? valueStyle;
  bool _isOpen = false;

  CustomDropDownButton(
      {Key? key,
      this.list,
      this.value,
      this.hint,
      this.onChanged,
      this.icon,
      this.item,
      this.decoration,
      this.padding,
      this.hintStyle,
      this.valueStyle})
      : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.hint ?? '', style: widget.hintStyle),
        Stack(
          children: [
            Container(
              padding: widget.padding ??
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: widget.decoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(color: AppColors.border),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.value ?? '', style: widget.valueStyle),
                  InkWell(
                    onTap: () {
                      print('asdasdasdasdasd ${widget._isOpen}');

                      setState(() {
                        widget._isOpen = !widget._isOpen;
                        print('asdasdasdasdasd ${widget._isOpen}');
                      });
                    },
                    child: widget.icon ?? Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
            ExpansionPanelList(children: [
              ExpansionPanel(
                  headerBuilder: (_, isOpen) {
                    return Text("nimadir open");
                  },
                  body: Text("Now open"),
                  isExpanded: widget._isOpen)
            ])
          ],
        )
      ],
    );
  }
}
