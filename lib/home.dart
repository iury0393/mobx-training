import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_training/body.dart';
import 'package:mobx_training/controller.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<Controller>();
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(controller.isValid
              ? 'Formulário Validade'
              : 'Formulário Não Validado');
        }),
      ),
      body: BodyWidget(),
    );
  }
}
