import 'package:flutter/material.dart';
import 'package:kuis_prakmobile/disease_data.dart';
import 'package:kuis_prakmobile/halamandetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body:
        GridView.builder(
            itemCount: listDisease.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context, index){
              final Diseases id = listDisease[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HalamanDetail(id: id,);
                  }));
                },
                child: Card(child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height /3,
                      width: MediaQuery.of(context).size.width /3,
                      child: Image.network(id.imgUrls),
                    ), SizedBox(width: 20),
                    Text(id.name)
                  ],
                ),),
              );
            }
        ),
      ),
    );
  }
}



