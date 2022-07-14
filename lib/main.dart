import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/app_start_up_controller.dart';
import 'package:school19/change_password/password_change_screen.dart';
import 'package:school19/login/login_screen.dart';
import 'package:school19/school/school_screen.dart';
import 'package:school19/widget/alert_dialog_widget.dart';

import 'home/login_home_screen.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF96AA2)
  ));
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color =
    {
      50:const Color.fromRGBO(249, 106, 162, .1),
      100:const Color.fromRGBO(249, 106, 162, .2),
      200:const Color.fromRGBO(249, 106, 162, .3),
      300:const Color.fromRGBO(249, 106, 162, .4),
      400:const Color.fromRGBO(249, 106, 162, .5),
      500:const Color.fromRGBO(249, 106, 162, .6),
      600:const Color.fromRGBO(249, 106, 162, .7),
      700:const Color.fromRGBO(249, 106, 162, .8),
      800:const Color.fromRGBO(249, 106, 162, .9),
      900:const Color.fromRGBO(249, 106, 162, 1),
    };
    MaterialColor colorCustom = MaterialColor(0xFFF96AA2, color);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary:colorCustom ,
          secondary: const Color(0xFFF96AA2), // Your accent color
        ),

      ),
      home:  const MainPage(title: ''),
    );
  }
}

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  ConsumerState <MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appStartUpProvider);
    final screensLogin = <Widget> [
      const LogInHomePage(),
       const ChangePasswordPage("main"),
       const LogInHomePage(),
    ];
    final screensLogout = [
      const SchoolPage("logout"),
      const LoginPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: FlutterLogo(
            size: 20,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.add_alert_outlined,
              color: Colors.white,
            ),
          )
        ],
        elevation: 0,
        title: const Text(
          'S PlUS P',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: IndexedStack(
        index: _selectedItemIndex,
         children: state == AuthState.authenticated? screensLogin: screensLogout,
           //children: screensLogin,
      ),
      //bottomNavigationBar: _bottomNavigationBarLogin(),
       bottomNavigationBar: state == AuthState.authenticated?  _bottomNavigationBarLogin(): _bottomNavigationBarLogout(),
    );
  }

  Widget _bottomNavigationBarLogin() {
    return BottomNavigationBar(
        currentIndex: _selectedItemIndex,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white60,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ပင်မစာမျက်နှာ',
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          const BottomNavigationBarItem(
            // icon: Icon(Icons.person_add_alt_1_rounded),
              icon: Icon(Icons.key),
              // label: 'ကျောင်းအပ်ရန်',
              label: 'စကားဝှက်ပြောင်မည်'
          ),
          const BottomNavigationBarItem(
            // icon: Icon(Icons.people),
            // label: 'ဆရာ/ဆရာများ',
            icon: Icon(Icons.logout),
            label: 'အကောင့်မှထွက်မည်',
          ),
        ],
        onTap: _onItemTap);
  }
  Widget _bottomNavigationBarLogout() {
    return BottomNavigationBar(
        currentIndex: _selectedItemIndex,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white60,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'ပင်မစာမျက်နှာ',
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.login),
            label: 'အကောင့်',
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        ],
        onTap: _onItemTap);
  }

  void _onItemTap(int index) {
    if(index == 2){
      showLogoutDialog(context, ref);
    }
    setState(() {
      _selectedItemIndex = index;

    });
  }
}
