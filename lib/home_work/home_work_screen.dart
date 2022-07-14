
import 'package:flutter/material.dart';

class HomeWorkPage extends StatelessWidget {
  const HomeWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("အိမ်စာများ"),),
      body: ListView.builder(
        // shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            // final lyric = lyrics.data![index];
            return GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ComplainDetailPage()));
              },
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  // height: 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Myanmar အတွက်အိမ်စာများ",
                              maxLines: 2,
                            ),
                            Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("20.8.2022")))
                          ],
                        ),
                        const Text("page 5 no 1 and 2")
                      ]),
                ),
              ),
            );
          }),
    );
  }
}