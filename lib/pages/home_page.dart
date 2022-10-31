import 'dart:math';

import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uangkoo/models/database.dart';
import 'package:uangkoo/pages/category_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [HomePage(), CategoryPage()];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  // page controller

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Icon(
                                    Icons.download,
                                    color: Colors.greenAccent[400],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Income',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12, color: Colors.white)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Rp 3.800.000',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14, color: Colors.white)),
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
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Icon(
                                    Icons.upload,
                                    color: Colors.redAccent[400],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Outcome',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12, color: Colors.white)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Rp 1.600.000',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14, color: Colors.white)),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Transactions",
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
                  subtitle: Text("Sallary"),
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
                    "Rp. 2.000.000",
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
                  subtitle: Text("Food"),
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
          ],
        ),
      ),
    );
  }
}
