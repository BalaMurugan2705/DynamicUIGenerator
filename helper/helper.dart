import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common_widgets/custom_slider.dart';
import 'package:test_app/common_widgets/custom_text_field.dart';
import 'package:test_app/common_widgets/dropdown.dart';
import 'package:test_app/model/CreateFormModel.dart';

import '../common_widgets/utils.dart';

Widget? createCustomForm(CreateFormModel data) {
  List<Widget> children = [];
  Widget? formWidget = Column(
    children: children,
  );
  data.data?.forEach((element) {
    if (element.type == "TextField") {
      var textField = Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Expanded(flex: 2, child: TitleText(element.label ?? "")),
            Expanded(
                flex: 5,
                child: CustomTextField(
                  label: element.dataValues?.label,
                ))
          ],
        ),
      );
      children.add(textField);
    }
    if (element.type == "Slider") {
      var slider = Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Expanded(flex: 2, child: TitleText(element.label ?? "")),
            Expanded(
                flex: 5,
                child: CustomSlider(
                  max: double.parse(element.dataValues?.maxVal ?? "0.0"),
                  min: double.parse(element.dataValues?.minVal ?? "0.0"),
                  sliderVal:
                      double.parse(element.dataValues?.sliderVal ?? "0.0"),
                ))
          ],
        ),
      );
      children.add(slider);
    }
    if (element.type == "Dropdown") {
      var dropDown = Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Expanded(flex: 2, child: TitleText(element.label ?? "")),
            Flexible(
                flex: 5,
                child: CustomDropdown(
                    title: element.dataValues?.title ?? "",
                    items: element.dataValues?.items ?? []))
          ],
        ),
      );
      children.add(dropDown);
    }
  });
  return formWidget;
}
