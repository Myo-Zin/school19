
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  final String from;
  const ChangePasswordPage(this.from,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:from != "main"? AppBar(title: const Text("စကားဝှက်ပြောင်းမည်")):null,
      body : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  Text("စကားဝှက်အဟောင်းရိုက်ထည့်ပါ"),
                  SizedBox(width: 4.0,),
                  Text("*",style: TextStyle(color: Colors.red),),

                ],
              ),
              TextFormField(
                // controller: fromDateTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ခွင့်ယူမည့်ရက်(မှ)ရွေးချယ်ပါ။';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all( 10.0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0,),
              Row(
                children: const [
                  Text("စကားဝှက်အသစ်ရိုက်ထည့်ပါ"),
                  SizedBox(width: 4.0,),
                  Text("*",style: TextStyle(color: Colors.red),),

                ],
              ),
              TextFormField(
                // controller: fromDateTextController,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ခွင့်ယူမည့်ရက်(မှ)ရွေးချယ်ပါ။';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all( 10.0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0,),
              Row(
                children: const [
                  Text("စကားဝှက်အသစ် နောက်တကြိမ်ရိုက်ထည့်ပါ"),
                  SizedBox(width: 4.0,),
                  Text("*",style: TextStyle(color: Colors.red),),

                ],
              ),
              TextFormField(
                // controller: fromDateTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ခွင့်ယူမည့်ရက်(မှ)ရွေးချယ်ပါ။';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all( 10.0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
                  // if (_formKey.currentState!.validate()) {
                  //
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //         backgroundColor: Colors.red,
                  //         content: Text('value cannot be empty')),
                  //   );
                  // }

                },
                child: const Text('စကားဝှက်ပြောင်းမည်'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
