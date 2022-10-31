import 'dart:math';

import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uangkoo/models/database.dart';
import 'package:uangkoo/pages/category_page.dart';
import 'package:uangkoo/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime? selectedDate;
  Random random = new Random();
  final List<Widget> _children = [HomePage(), CategoryPage()];
  int currentIndex = 0;

  bool isOutcome = true;
  final database = AppDb();

  TextEditingController categoryNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    showAwe();
    super.initState();
  }

  Future insert(String name, int type) async {
    DateTime now = DateTime.now();
    await database.into(database.categories).insert(CategoriesCompanion.insert(
        name: name, type: type, createdAt: now, updatedAt: now));
  }

  Future<List<Category>> getAllCategory() {
    return database.select(database.categories).get();
  }

  void showAwe() async {
    List<Category> al = await getAllCategory();
    print('PANJANG : ' + al.length.toString());
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void add() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: SingleChildScrollView(
                  child: Center(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Category",
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Switch(
                        // This bool value toggles the switch.
                        value: isOutcome,
                        inactiveTrackColor: Colors.green[200],
                        inactiveThumbColor: Colors.green,
                        activeColor: Colors.red,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            isOutcome = value;
                          });
                        },
                      ),
                      Text(
                        isOutcome ? "Outcome" : "Income",
                        style: GoogleFonts.montserrat(fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: categoryNameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Name"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        insert(categoryNameController.text, isOutcome ? 1 : 2);
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');

                        SnackBar(content: Text("Data successfully saved."));
                      },
                      child: Text("Save"))
                ],
              ))),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Visibility(
          visible: (currentIndex == 0) ? true : false,
          child: FloatingActionButton(
              onPressed: () {
                add();
              },
              backgroundColor: Colors.green,
              child: Icon(Icons.add)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  onTabTapped(0);
                },
                icon: Icon(Icons.home)),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  onTabTapped(1);
                },
                icon: Icon(Icons.list))
          ],
        )),
        body: _children[currentIndex],
        appBar: (currentIndex == 1)
            ? PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 36, horizontal: 16),
                    child: Text(
                      "Categories",
                      style: GoogleFonts.montserrat(fontSize: 20),
                    ),
                  ),
                ),
              )
            : CalendarAppBar(
                fullCalendar: true,
                backButton: false,
                accent: Colors.green,
                locale: 'en',
                onDateChanged: (value) => setState(() => selectedDate = value),
                lastDate: DateTime.now(),
                events: List.generate(
                    100,
                    (index) => DateTime.now()
                        .subtract(Duration(days: index * random.nextInt(5)))),
              ));
  }
}
