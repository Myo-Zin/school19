import 'package:flutter/material.dart';
import 'package:school19/announcement/announcement_response_model.dart';


class AnnouncementDetailPage extends StatelessWidget {
  final AnnouncementList announcementList;
  const AnnouncementDetailPage({Key? key, required this.announcementList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ကြေငြာချက်'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children:  [
                Text('ကြေငြာစာ',style: TextStyle(decorationStyle: TextDecorationStyle.dashed)),
                Expanded(child: Align(alignment: Alignment.centerRight,child: Text('${announcementList.createDate}')))
              ],
            ),
            SizedBox(
              width: 70.0,
              child: Divider(
                color: Colors.black,
                thickness: 2.0,
                height: 3.0,
              ),
            ),
            SizedBox(height: 16,),
            Container(
             // color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${announcementList.title}",
                    // style: TextStyle(color: Colors.white
                    // ),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  )
              ),
            ),
            SizedBox(height: 16,),
            Container(
                // decoration: BoxDecoration(
                //     border:Border.all(color: Colors.grey),
                //     borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${announcementList.body}'),
                )
            ),
            // SizedBox(height: 16,),
            // Text('ဒေါ်အေးအေး'),
            // Text('0977777744',style: TextStyle(color:Theme.of(context).colorScheme.secondary),)
          ],),
      ),
    );
  }
}
