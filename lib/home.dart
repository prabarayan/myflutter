// home.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/custom_column.dart';
import 'dart:math';
import 'package:flutter_application_1/widgets/custom_container.dart';

enum G { m, f }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final activeColor = Colors.white30;
  final inactiveColor = Colors.white12;
   G isSelected=G.m;
  int height = 160;
  int weight = 60;
  int age = 25;
  String bmi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prabaharan'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: isSelected == G.f ? activeColor : inactiveColor,
                      onTap: () {
                        setState(() {
                          isSelected = G.f;
                        });
                      },
                      height: 50,
                      width: 100,
                      child: Center(
                        child: Text(
                          'FEMALE',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomContainer(
                      color: isSelected == G.m ? activeColor : inactiveColor,
                      onTap: () {
                        setState(() {
                          isSelected = G.m;
                        });
                      },
                      height: 50,
                      width: 100,
                      child: Center(
                        child: Text(
                          'MALE',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              CustomContainer(
                color: inactiveColor,
                height: 120,
                width: 350,
                onTap: () {  },
                child: CustomColumn(
                  text: 'HEIGHT $height cm',
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.green,
                      overlayColor: Color(0x2900ff00),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.floor();
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: inactiveColor,
                      height: 135,
                      width: 100,
                      onTap: (){},
                      child: CustomColumn(
                        text: 'WEIGHT $weight',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                onTap: () {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                },
                                icon: Icons.arrow_downward,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                onTap: () {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                                icon: Icons.arrow_upward,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomContainer(
                      color: inactiveColor,
                      height: 135,
                      width: 100,
                      onTap: () {  },
                      child: CustomColumn(
                        text: 'AGE $age',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                onTap: () {
                                  setState(() {
                                    age = age - 1;
                                  });
                                },
                                icon: Icons.arrow_downward,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                onTap: () {
                                  setState(() {
                                    age = age + 1;
                                  });
                                },
                                icon: Icons.arrow_upward,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      onTap: () {
                        setState(() {
                          bmi = '';
                        });
                      },
                      width: double.infinity,
                     
                      color: activeColor, 
                      height: 50,
                       child: Center(
                        child: Text(
                          'CLEAR',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomContainer(
                      onTap: () {
                        final double bmiValue = weight / pow(height / 100, 2);

                        setState(() {
                          bmi = bmiValue.toStringAsFixed(1);
                        });
                      },
                      width: double.infinity,
                      
                      color: Colors.green, 
                      height: 50,
                      child: Center(
                        child: Text(
                          'GET BMI',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 180,
                child: CustomContainer(
                  width: double.infinity,
                  color: inactiveColor,
                  height: 180,
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'YOUR BMI IS',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        bmi.isEmpty ? '0.0' : bmi,
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
