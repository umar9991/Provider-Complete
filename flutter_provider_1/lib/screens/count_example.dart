import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider_1/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState(){
    super.initState();
     final counterProvider = Provider.of<CounterProvider>(context, listen: false);
     Timer.periodic(Duration(seconds: 0), (timer){
      counterProvider.setCount();
     });
  }
  @override
  Widget build(BuildContext context) {
   
    int count = 0;
    @override
    void initState(){
      super.initState();

      Timer.periodic(const Duration(seconds: 1), (timer){
        count++;
        setState(() {
          
        });
      }
      );

    }
     final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Example'),
      ),
      body: Column(
        children: [
         Consumer(builder: (context, value, child){
          return  Text(counterProvider.count.toString(),style: const TextStyle(
            fontSize: 50,
          ),);
         })
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counterProvider.setCount();
      },
      child: const Icon(
        Icons.add,
      ),
      ),
    );
  }
}