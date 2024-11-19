import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:knavator_assignment/presentation/screen/home/home_screen.dart';

class MyApp  extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:  ThemeData(

          ),

          home:Scaffold(
            appBar: AppBar(title: const Text('Knavator Assignment'),),
            body: HomeScreen(),
          ),
        );
      },
    );
  }

}
