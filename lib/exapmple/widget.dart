import 'package:camera/exapmple/example_model.dart';
import 'package:flutter/material.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  final controller = TextEditingController();
  final controllerToken = TextEditingController();
  final _model = ExampleWidgetModel();
  final dataModel = ExampleModel2();

  @override
  void setState(VoidCallback fn) {
    _model.dataValue;
    _model.tokenData;

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сохранения данных в устройство!'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() { });
                  _model.setName(controller: controller);
                },
                child: const Text('Сохранить'),
              ),
              Text(_model.dataValue ?? ''),
              ElevatedButton(
                onPressed: _model.readName,
                child: const Text('Прочитать'),
              ),
              TextField(
                controller: controllerToken,
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() { });
                  _model.setToken(textEditingController: controllerToken);
                },
                child: const Text('Сохранить'),
              ),
              Text(_model.tokenGet??''),
              ElevatedButton(
                onPressed: _model.readToken,
                child: const Text('Прочитать'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
