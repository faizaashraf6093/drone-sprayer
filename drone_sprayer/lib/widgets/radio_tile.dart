import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/radio_controller.dart';

class ProductTypeButton extends StatelessWidget {
  final String value;
  final String title;
  final bool isLiquid;

  const ProductTypeButton(
      {super.key,
      required this.value,
      required this.title,
      required this.isLiquid});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonController>(
      builder: (buttonController) {
        return InkWell(
          onTap: () => buttonController.setProductType(value),
          child: Row(
            children: [
              Radio(
                value: value,
                groupValue: buttonController.orderType,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (String? value) {
                  //buttonController.setOrderType(value!);
                },
                activeColor: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 10),
              Text(
                title,
              ),
              const SizedBox(width: 5),
              const Text(''),
            ],
          ),
        );
      },
    );
  }
}
