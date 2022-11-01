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

  final database = AppDb();

  TextEditingController categoryNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    showAwe();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Visibility(
          visible: (currentIndex == 0) ? true : false,
          child: FloatingActionButton(
              onPressed: () {},
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
