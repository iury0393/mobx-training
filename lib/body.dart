import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_training/controller.dart';

class BodyWidget extends StatelessWidget {
  _textField({String labelText, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<Controller>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Observer(
            builder: (_) {
              return _textField(
                labelText: 'Nome',
                onChanged: controller.client.changeName,
                errorText: controller.validateName,
              );
            },
          ),
          SizedBox(height: 20),
          Observer(
            builder: (_) {
              return _textField(
                labelText: 'Email',
                onChanged: controller.client.changeEmail,
                errorText: controller.validateEmail,
              );
            },
          ),
          SizedBox(height: 20),
          Observer(
            builder: (_) {
              return _textField(
                labelText: 'CPF',
                onChanged: controller.client.changeCpf,
                errorText: controller.validateCpf,
              );
            },
          ),
          SizedBox(height: 50),
          Observer(builder: (_) {
            return ElevatedButton(
              onPressed: controller.isValid ? () {} : null,
              child: Text('Salvar'),
            );
          }),
        ],
      ),
    );
  }
}
