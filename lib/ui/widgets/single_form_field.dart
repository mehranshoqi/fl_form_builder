import 'package:flutter/material.dart';

import '../../core/entities/from_field.dart';
import '../../core/enums.dart';
import 'b_input.dart';

class SingleFormField extends StatelessWidget {
  const SingleFormField({
    super.key,
    required this.model,
  });
  final FormFieldModel model;

  @override
  Widget build(BuildContext context) {
    late Widget child;
    switch (model.type) {
      case FieldType.bool:
        child = _booleanWidget(context, model);
        break;
      case FieldType.string:
        child = _stringWidget(context, model);
        break;
      default:
        child = const Text('Field Not Supported!');
        break;
    }
    return Container(
      height: 56,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: child,
    );
  }

  Widget _booleanWidget(BuildContext context, FormFieldModel model) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: false,
            onChanged: (v) {},
          ),
          const SizedBox(width: 2),
          Text(model.value)
        ],
      );

  Widget _stringWidget(BuildContext context, FormFieldModel model) => BInput(
        onChange: (t) {},
        label: model.value,
        width: 200,
      );
}
