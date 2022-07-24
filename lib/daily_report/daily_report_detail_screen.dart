import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/daily_report/daily_report_controller.dart';
import 'package:school19/daily_report/daily_report_model.dart';
import 'package:school19/response_model.dart';
import 'package:school19/widget/loading_dialog_widget.dart';

class DailyReportDetailPage extends ConsumerStatefulWidget {
  const DailyReportDetailPage(this.dailyReport,this.gradeId,this.classId,{Key? key}) : super(key: key);
  final Data dailyReport;
  final String gradeId;
  final String  classId;

  @override
  ConsumerState<DailyReportDetailPage> createState() => _DailyReportDetailPageState();
}

class _DailyReportDetailPageState extends ConsumerState<DailyReportDetailPage> {
   TextEditingController? createDailyReportTextController;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    createDailyReportTextController = TextEditingController();
    ref.listen<StatusResponse?>(createDailyReportStateProvider, (previous, next) async {
      if (next == null) {
        return;
      }
     // print("feedback create${next.message} ");
      if(next.status == true){
        createDailyReportTextController!.clear();

      }
      ///close loading
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(next.message.toString()),
      ));
    });
    return Scaffold(
      appBar: AppBar(title: Text("Daily Report"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: dailyReport.reply == null? Colors.grey: Colors.white ,
                  // margin: const EdgeInsets.all(16),
                  // height: 100,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0, style: BorderStyle.solid, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(
                        children: [
                          Text(
                            widget.dailyReport.subject?.name ?? "",
                            maxLines: 2,
                          ),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("${widget.dailyReport.sentDate}")))
                        ],
                      ),
                      Text("${widget.dailyReport.body}")
                    ]),
                  ),
                ),
                const SizedBox(height: 8.0,),
                widget.dailyReport.reply == null? const Text("အကြောင်းပြန်မည့် အကြောင်းအရာ ဖြည့်ပါ") : Align(alignment: Alignment.centerRight,child: Text("အကြောင်ပြန်မည့်ရက်စွဲ : ${widget.dailyReport.sentDate}"),),
                const SizedBox(height: 8.0,),
                widget.dailyReport.reply == null?
                TextFormField(
                  controller: createDailyReportTextController,
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'အကြောင်းပြန်မည့်အကြောင်းအရာဖြည့်စွပ်ပါ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ):
                Container(
                  // color: dailyReport.reply == null? Colors.grey: Colors.white ,
                  // margin: const EdgeInsets.all(16),
                   width: MediaQuery.of(context).size.width,
                   height: 200,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0, style: BorderStyle.solid, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16-.0),
                    child: Text("${widget.dailyReport.reply?.reply}"),
                  ),
                )
                ,
                const SizedBox(height: 16.0,),
                if(widget.dailyReport.reply == null)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // background
                    primary: Theme.of(context).colorScheme.secondary,
                    onPrimary: Colors.white, // foreground
                    minimumSize: const Size.fromHeight(50),
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  onPressed: () {
                    final String subjectId = widget.dailyReport.subject?.boId??"";
                    if (_formKey.currentState!.validate()) {
                      loadingDialog(context);
                      ref.read(createDailyReportViewController).createDailyReport(widget.gradeId,widget.classId,subjectId,createDailyReportTextController!.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('value cannot be empty')),
                      );
                    }

                  },
                  child: const Text('အကြောင်းပြန်မည်'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
