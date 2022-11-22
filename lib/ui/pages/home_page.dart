import 'package:flutter/material.dart';

import '../../core/entities/from_field.dart';
import '../../core/enums.dart';
import '../widgets/b_input.dart';
import '../widgets/single_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FormFieldModel> formFields = [];
  final TextEditingController _dataController = TextEditingController(
          text:
              'string field1\nbool field2\nbool field3\nbool field4\nbool field5'),
      _columnsNumberController = TextEditingController(text: '1');
  int columsNumber = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                _formBuilderWidget(context),
                const Divider(),
                const SizedBox(height: 16),
                _formFieldsWidget(context),
              ],
            ),
          ),
        ),
      );

  Widget _formBuilderWidget(BuildContext context) => Container(
        color: Colors.blue.withOpacity(.1),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BInput(
              onChange: (t) {},
              label: 'data',
              height: 140,
              controller: _dataController,
            ),
            const SizedBox(width: 32),
            BInput(
              controller: _columnsNumberController,
              onChange: (t) => columsNumber = int.parse(t),
              inputType: TextInputType.number,
              maxLength: 1,
              label: 'Number of colums',
            ),
            const Spacer(),
            SizedBox(
              height: 48,
              width: 120,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade900),
                ),
                onPressed: () => _generateForm(context),
                child: const Text('Build'),
              ),
            ),
          ],
        ),
      );

  Widget _formFieldsWidget(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i in Iterable.generate(columsNumber))
                _singleColumn(context, i),
            ],
          ),
        ),
      );

  Widget _singleColumn(BuildContext context, int i) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (FormFieldModel model in formFields)
            if (formFields.indexOf(model) % columsNumber == i)
              SingleFormField(model: model)
        ],
      );

  void _generateForm(BuildContext context) {
    formFields = [];
    final String dataStr = _dataController.text.trim();
    final List<String> fields = dataStr.split('\n');
    for (String strField in fields) {
      final List<String> splitedStrField = strField.split(' ');
      formFields.add(
        FormFieldModel(
          FieldType.values.firstWhere(
            (e) => e.toString() == 'FieldType.${splitedStrField.first}',
          ),
          splitedStrField.last,
        ),
      );
    }
    setState(() {});
  }
}
