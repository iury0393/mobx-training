import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_training/body.dart';
import 'package:mobx_training/controller.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);
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
