import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_training/app/home/components/item_component.dart';
import 'package:mobx_training/app/home/home_controller.dart';
import 'package:mobx_training/app/models/item_model.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final controller = HomeController();
  _dialog() {
    var model = ItemModel();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Adicionar item'),
          content: TextField(
            onChanged: model.setTitle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Novo item',
            ),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                controller.addItem(model);
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(labelText: 'Pesquisa...'),
          ),
          actions: [
            IconButton(
              icon: Observer(builder: (_) {
                return Text('${controller.totalChecked}');
              }),
              onPressed: () {},
            ),
          ],
        ),
        body: Observer(builder: (_) {
          return ListView.builder(
            itemCount: controller.listItems.length,
            itemBuilder: (_, index) {
              var item = controller.listItems[index];
              return ItemComponent(
                item: item,
                removeClicked: () {
                  controller.removeItem(item);
                },
              );
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _dialog();
          },
        ),
      ),
    );
  }
}
