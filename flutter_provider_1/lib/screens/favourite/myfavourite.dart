

import 'package:flutter/material.dart';
import 'package:flutter_provider_1/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class Myfavourite extends StatefulWidget {
  const Myfavourite({super.key});

  @override
  State<Myfavourite> createState() => _MyfavouriteState();
}

class _MyfavouriteState extends State<Myfavourite> {
   @override
  Widget build(BuildContext context) {
    final favouriteProvider =  Provider.of<FavouriteProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourite App"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Myfavourite()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Icon(Icons.favorite),
            ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteProvider.selectedItems.length,
              itemBuilder: (context,index){
              return Consumer <FavouriteProvider>(
                builder: (context,value, child){
                  return  ListTile(
                  onTap: () {
                    if(value.selectedItems.contains(index)){
                      value.removeItems(index);
                    }else{
                      value.addItem(index);
                    };
                    
                    
                  },
                  title: Text('Items' +index.toString()),
                  trailing: Icon(
                    value.selectedItems.contains(index)? Icons.favorite:
                    Icons.favorite_border_outlined),
                );
                },
              
              );
            }),
          )

        ],
      ),
    );
  }
}