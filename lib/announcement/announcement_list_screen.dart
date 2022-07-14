import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/announcement/announcement_controller.dart';
import 'package:school19/announcement/announcement_detail_screen.dart';
import 'package:school19/widget/loading_widget.dart';

class AnnouncementListPage extends ConsumerWidget {
  const AnnouncementListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcementResponse = ref.watch(announcementController);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ကြေညာချက်များ'),
        ),
        body: announcementResponse.when(
            data: (data) {
              final announcementList = data.announcementList??[];
              print('announcementList $announcementList');
              return announcementList.isEmpty?
              const Center(child: Text('ကြေညာချက်များမရှိသေးပါ'),)
                  : ListView.builder(
                  shrinkWrap: true,
                  itemCount: announcementList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final announcement = announcementList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AnnouncementDetailPage(announcementList: announcement,)));
                      },
                      child: Card(
                        child: Container(
                            margin: const EdgeInsets.all(8),
                          // width: double.infinity,
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${announcement.title}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                Text("${announcement.body}",maxLines: 2, overflow: TextOverflow.ellipsis,),
                                const SizedBox(width: 8.0,),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            "${announcement.createDate}"))),
                            ])),
                      ),
                    );
                  });
            },
            error: (error, stack) {
              print('$error');
              return Text('');
            },
            loading: () => loading()));
  }
}
