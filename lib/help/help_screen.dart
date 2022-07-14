
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("အကူအညီရယူမည်"),),
      body: Container(
        height: 294,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("ဖုန်းနံပါတ်"),
                  Row(
                    children:  [
                      Icon(Icons.phone,size: 20,color: Theme.of(context).colorScheme.primary),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('09266669224, 09266669445'),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text("အီးမေးလ်"),
                  Row(
                    children:  [
                      Icon(Icons.mail,size: 20,color: Theme.of(context).colorScheme.primary),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('customer.services@splupmm.com'),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text("Facebook"),
                  Row(
                    children:  [
                      Icon(Icons.facebook,size: 20,color: Theme.of(context).colorScheme.primary),
                      const Expanded(
                        child:  Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('S PLUS P'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
