import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notify Listener Screen"),
      ),
      body: Column(
        children: [
        

           ValueListenableBuilder(
            valueListenable: toggle,
          builder: (context, value,child){
            return    TextFormField(
            obscureText: toggle.value,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: InkWell(
                onTap: () {
                  toggle.value=! toggle.value;
                },
                child: Icon(toggle.value?Icons.visibility_off_outlined :Icons.visibility)),
            ),
          );
          }),

         ValueListenableBuilder(valueListenable: _counter,
          builder: (context, value,child){
            return  Text(_counter.value.toString());
          })

        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        _counter.value++;
        print(_counter.value.toString());
      },
      child: Icon(Icons.add),
      ),
    );
  }
}