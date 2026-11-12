// home.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/custom_column.dart';
import 'dart:math';
import 'package:flutter_application_1/widgets/custom_container.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

enum G { m, f }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    final  _isMenuOpen = true;
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
      body: Row(
        // child:SidebarPage(),
        children: [
          // 1. ANIMATED LEFT SLIDEBAR MENU WIDGET
          SizedBox(
            // duration: const Duration(milliseconds: 300),
            // curve: Curves.easeInOut,
            width: _isMenuOpen ? 60 : 0, 
            height:MediaQuery.of(context).size.height,// Shrinks to 0 when closed
            child:Container(
              color: Colors.green[900],
              // SingleChildScrollView prevents overflow errors during animation
              child: SingleChildScrollView(
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: [
                    // const SizedBox(height: 20),
                  
                    const SizedBox(height: 12),
                    
                    // const Divider(color: Colors.white24, height: 32),
                    _buildMenuItem(Icons.dashboard, 'Dashboard'),
                    _buildMenuItem(Icons.analytics, 'Analytics'),
                    _buildMenuItem(Icons.pie_chart, 'Reports'),
                    _buildMenuItem(Icons.settings, 'Settings'),
                  ],
                ),
              ),
            ),
          ),

        Expanded(
        child:Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
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
                height: 100,
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
                      height: 115,
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
                      height: 115,
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
                        double bmi = weight / pow(height / 100, 2);

                        setState(() {
                          bmi = bmi;
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
              Expanded(
                child: CustomContainer(
                  width: double.infinity,
                  
                  color: inactiveColor, 
                  height: 100,
                  onTap: (){},
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'YOUR BMI IS',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        bmi,
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
        ],
      ),
    );
  }
}
 // Helper widget to build menu list tiles
  Widget _buildMenuItem(IconData icon, String title) {
    return Material(
    color: const Color(0xFF1E1E1E), // 👈 Safe background color
    child: ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(color: Colors.white70)),
      onTap: () {},
    ),
  );
  }
class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
 late String _headline;
  final AssetImage _avatarImg = AssetImage('assets/test.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'GeeksforGeeks',
        icon: Icons.school_outlined,
        onPressed: () => setState(() => _headline = 'Geeks For Geeks'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Flutter',
        icon: Icons.flutter_dash_outlined,
        onPressed: () => setState(() => _headline = 'Flutter'),
      ),
      CollapsibleItem(
        text: 'HTML',
        icon: Icons.html_outlined,
        onPressed: () => setState(() => _headline = 'HTML'),
      ),
      CollapsibleItem(
        text: 'CSS',
        icon: Icons.css_outlined,
        onPressed: () => setState(() => _headline = 'CSS'),
      ),
      CollapsibleItem(
        text: 'JavaScript',
        icon: Icons.javascript_outlined,
        onPressed: () => setState(() => _headline = 'JavaScript'),
      ),
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home,
        onPressed: () => setState(() => _headline = 'Home'),
      ),
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        avatarImg: _avatarImg,
        title: 'MS471841',
        onTitleTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        },
        body: _body(size, context),
        selectedIconBox: Colors.transparent,
       unselectedTextColor: Colors.white,
       unselectedIconColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 44, 129, 47),
        selectedTextColor: Color.fromARGB(255, 65, 68, 255),
        textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 63, 181, 171),
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Color.fromARGB(255, 77, 240, 83),
            blurRadius: 50,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromARGB(255, 255, 255, 255),
      child: Center(
        child: Text(
          
              _headline,
              style: Theme.of(context).textTheme.displayMedium,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
      ),
    );
  }
}