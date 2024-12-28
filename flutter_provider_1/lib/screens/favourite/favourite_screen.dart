import 'package:flutter/material.dart';
import 'package:flutter_provider_1/provider/favourite_provider.dart';
import 'package:flutter_provider_1/screens/favourite/myfavourite.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  

  // to make list
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    // final favouriteProvider =  Provider.of<FavouriteProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Myfavourite()));
            },
            child: Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
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