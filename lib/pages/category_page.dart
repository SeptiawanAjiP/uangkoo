import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uangkoo/models/category.dart';
import 'package:uangkoo/models/database.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isOutcome = true;
  int type = 2;
  final database = AppDb();
  List<Category> listCategory = [];

  Future<List<Category>> getAllCategory(int type) async {
    return await database.getAllCategory(type);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(children: [
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
                  type = (isOutcome) ? 2 : 1;
                });
              },
            ),
            Text(
              isOutcome ? "Outcome" : "Income",
              style: GoogleFonts.montserrat(fontSize: 14),
            )
          ],
        ),
        FutureBuilder<List<Category>>(
          future: getAllCategory(type),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Padding(
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
                            leading: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: (isOutcome)
                                    ? Icon(Icons.upload,
                                        color: Colors.redAccent[400])
                                    : Icon(
                                        Icons.download,
                                        color: Colors.greenAccent[400],
                                      )),
                            title: Text(
                              "Makan",
                            )),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("No has data"),
                );
              }
            }
          },
        ),
      ])),
    );
  }
}
