import 'dart:math';

import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? selectedDate;
  Random random = new Random();
  // page controller
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CalendarAppBar(
          fullCalendar: true,
          backButton: false,
          accent: Colors.green,
          locale: 'id',
          onDateChanged: (value) => setState(() => selectedDate = value),
          lastDate: DateTime.now(),
          events: List.generate(
              100,
              (index) => DateTime.now()
                  .subtract(Duration(days: index * random.nextInt(5)))),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            child: Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            SizedBox(
              width: 20,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        )),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Icon(
                                        Icons.download,
                                        color: Colors.greenAccent[400],
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Income',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              color: Colors.white)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Rp 3.800.000',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Icon(
                                        Icons.upload,
                                        color: Colors.redAccent[400],
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Outcome',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              color: Colors.white)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Rp 1.600.000',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Daftar Transaksi",
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                      subtitle: Text("Bayar iuran"),
                      leading: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.download,
                            color: Colors.greenAccent[400],
                          )),
                      title: Text(
                        "Rp. 20.000",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                      subtitle: Text("Bayar iuran"),
                      leading: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.download,
                            color: Colors.greenAccent[400],
                          )),
                      title: Text(
                        "Rp. 20.000",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                      subtitle: Text("Bayar iuran"),
                      leading: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.upload,
                            color: Colors.redAccent[400],
                          )),
                      title: Text(
                        "Rp. 20.000",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                      subtitle: Text("Bayar iuran"),
                      leading: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.upload,
                            color: Colors.redAccent[400],
                          )),
                      title: Text(
                        "Rp. 20.000",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                      subtitle: Text("Bayar iuran"),
                      leading: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.upload,
                            color: Colors.redAccent[400],
                          )),
                      title: Text(
                        "Rp. 20.000",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
