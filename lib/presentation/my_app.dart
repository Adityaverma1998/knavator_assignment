import 'package:flutter/material.dart';
import 'package:knavator_assignment/presentation/screen/home/home_screen.dart';

class MyApp  extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Assignemnt",
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(

      ),

      home:Scaffold(
        appBar: AppBar(title: const Text('Knavator Assignment'),),
        body: HomeScreen(),
      ),
    );
  }

}
