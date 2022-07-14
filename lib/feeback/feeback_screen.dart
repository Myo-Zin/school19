import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/login/login_controller.dart';
import 'package:school19/response_model.dart';
import 'package:school19/widget/loading_dialog_widget.dart';



class FeedbackPage extends ConsumerStatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  ConsumerState <FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends ConsumerState<FeedbackPage> {

  final feedbackTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ref.listen<StatusResponse?>(sendFeedbackStateProvider, (previous, next) async {
      if (next == null) {
        return;
      }
      print("feedback create${next.message} ");
      if(next.status == true){
        feedbackTextController.clear();

      }
      ///close loading
     Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       content: Text(next.message.toString()),
     ));
   });
    return Scaffold(
      appBar: AppBar(title: const Text('အကြံပြုမည်'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              Row(
                children: const [
                  Text("အကြံပြုမည့်အကြောင်းအရာဖြည့်စွပ်ပါ"),
                  Text("*",style: TextStyle(color: Colors.red),),
                ],
              ),
              TextFormField(
                controller: feedbackTextController,
                maxLines: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'အကြံပြုမည့်အကြောင်းအရာဖြည့်စွပ်ပါ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              const SizedBox(height: 16.0,),
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
                  if (_formKey.currentState!.validate()) {
                    loadingDialog(context);
                    ref.read(loginViewController).sendFeedback(feedbackTextController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('value cannot be empty')),
                    );
                  }

                },
                child: const Text('အကြံပြုမည်'),
              ),
            ],),
          ),
        ),
      ),
    );
  }
}
