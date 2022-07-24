
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/daily_report/daily_report_detail_screen.dart';
import 'package:school19/my_parameter.dart';
import 'package:school19/student/student_widget.dart';
import 'package:school19/widget/loading_widget.dart';
import 'daily_report_controller.dart';

class DailyReportListPage extends StatelessWidget {
  const DailyReportListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Report"),),
      body: const StudentsWidget("daily_report"),
    );
  }
}

class DailyReportListWidget extends ConsumerWidget {
  const DailyReportListWidget(this.gradeId,this.classId,{Key? key}) : super(key: key);
  final String gradeId;
  final String classId;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final dailyReportResponse = ref.watch(dailyReportController(MyParameter("", gradeId, classId, "", "")));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(
                      child: Text('ဘာသာရပ်အားလုံး'),
                    ),
                  ],
                  onChanged: (value) {},

                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0,),
          dailyReportResponse.when(data: (data){
            final dailyReportList = data.data??[];
            return  Expanded(
              child: ListView.builder(
                 // shrinkWrap: true,
                  itemCount: dailyReportList.length,
                  itemBuilder: (BuildContext context, int index) {
                     final dailyReport = dailyReportList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DailyReportDetailPage(dailyReport,gradeId,classId)));
                      },
                      child: Card(
                        elevation: 10,
                        child: Container(
                          color: dailyReport.reply == null? Colors.grey: Colors.white ,
                          // margin: const EdgeInsets.all(16),
                          // height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children:  [
                                      Text(
                                        dailyReport.subject?.name??"",
                                        maxLines: 2,
                                      ),
                                      Expanded(
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("${dailyReport.sentDate}")))
                                    ],
                                  ),
                                   Text("${dailyReport.body}")
                                ]),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }, error: (error,stack){
            return Text("$error");
          }, loading:()=> Center(child: loading(),))

        ],
      ),
    );
  }
}

