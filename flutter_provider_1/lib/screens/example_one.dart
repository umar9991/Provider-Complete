import 'package:flutter/material.dart';
import 'package:flutter_provider_1/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Example one'),
      ),
      body: Column(
        children: [
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.teal.withOpacity(value.value),
                    child: Text("Container 1"),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red.withOpacity(value.value),
                    child: Text("Container 2"),
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
