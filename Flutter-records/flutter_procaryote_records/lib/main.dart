import 'dart:async';
import 'dart:io';
import 'dart:math';

//import 'dart:convert' as convert;

import 'package:flutter_procaryote_records/emergency_contacts_per_country.dart';
//import 'package:flutter_procaryote_records/health_record.dart';
import 'package:flutter_procaryote_records/vaccine_per_country.dart';
//import 'package:flutter_procaryote_records/pharmacy_shopping_list.dart';
//import 'package:flutter_procaryote_records/country.dart';
//import 'package:flutter_procaryote_records/country_map.dart';
//import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;

/////////////////////////////////////////////////////////////////////
//
// firebase_options where default firebase app parameters are defined
//
/////////////////////////////////////////////////////////////////////
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
//  used in register and sign-in pages
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import '/firebase_options.dart';
//import 'package:flutter_procaryote_records/firebase_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_functions/cloud_functions.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:firebase_remote_config/firebase_remote_config.dart';
// ANALYTICS does not work for the web - dont know exctly why
// import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
//import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
//import 'package:firebase_performance/firebase_performance.dart';

//////////////////////////////////////////////////////////////////
///
/// Authentification
///
/// /////////////////////////////////////////////////////////////
import './register_page.dart';
import './signin_page.dart';

// on phone savings
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Icons
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
//import 'package:flutter_icons/flutter_icons.dart';

// URL Launcher
//import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:dropdown_search/dropdown_search.dart';
/////////////////////////////////////////////////////////////////////
///
/// END OF IMPORT
///
/// /////////////////////////////////////////////////////////////////
/*
void main() {
  runApp(const EmergencyContactsApp());
}

class EmergencyContactsApp extends StatelessWidget {
  const EmergencyContactsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
/*
    if (_languageCode=='fr') {
        const _myHomePageTitle = 'Numéros d\'urgences en' '$_country';
    } else {
        const _myHomePageTitle = 'Emergency numbers in ' '$_country';
    }
*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'procaryote_records',
      theme: ThemeData(
        // This is the theme of your application.
        //primarySwatch: Colors.blue,
        primaryColor: Colors.teal[300],
      ),
      home: const MyHomePage(title: 'Emergency contacts'),
    );
  }
}
*/

Future<void> main() async {
  // essential to further initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  // Wait for Firebase to initialize and set `_initialized` state to true
  // already initialised in index.html
//  await Firebase.initializeApp();
//  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//  await FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//  await FirebaseAuth auth = FirebaseAuth.instance;
//  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  //////////////////////////////////////////////////////////////////
//  runApp(AuthExampleApp());
  //////////////////////////////////////////////////////////////////
  runApp(const MaterialApp(
    home: MyHomePage(),
//    home: AuthExampleApp(),
    debugShowCheckedModeBanner: false,
  ));
}

//////////////////////////////////////////////////////////////////////////
///
/// HomePage
///
//////////////////////////////////////////////////////////////////////////

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
//  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

//  final String title;

//  @override
//  State<MyHomePage> createState() => _MyHomePageState();
//}
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Health'),
          backgroundColor: const Color(0xFF202124),
//          toolbarHeight: 100,
        ),
        //////////////////////////////////////////////////////////////
        body: Container(
          color: const Color(0xFF202124),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              ////////////////////////////////////////////////////////
              /// Emergency contacts
              ////////////////////////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xFF303134),
                ),
                alignment: const Alignment(0.0, 0.0),
                padding: const EdgeInsets.all(8),
                child: InkResponse(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const EmergencyContactsPerCountry()),
                    );
                  },
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          MaterialCommunityIcons.phone_plus,
                          size: 100.0,
                          color: Color(0xFFaa2222),
                        ),
                        Text('Emergency contacts',
                            textAlign: TextAlign.center,
                            style: TextStyle(
//                                fontSize: 25,
                                color: Color(0xFFbcc0c5))),
                      ]),
                ),
              ),
              ////////////////////////////////////////////////////////
              /// Travel advices
              ////////////////////////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xFF303134),
                ),
                alignment: const Alignment(0.0, 0.0),
                padding: const EdgeInsets.all(8),
                child: InkResponse(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VaccinePerCountry()),
                    );
                  },
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
//                          MaterialCommunityIcons.needle,
                          MaterialCommunityIcons.wallet_travel,
                          size: 100.0,
                          color: Colors.amber,
                        ),
                        Text('Travel advices',
                            textAlign: TextAlign.center,
                            style: TextStyle(
//                                fontSize: 25,
                                color: Color(0xFFbcc0c5))),
                      ]),
                ),
              ),
              ////////////////////////////////////////////////////////
              /// Shopping lists
              ////////////////////////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xFF303134),
                ),
                alignment: const Alignment(0.0, 0.0),
                padding: const EdgeInsets.all(8),
                child: InkResponse(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
//                          builder: (context) => const PharmacyShoppingList()),
                          builder: (context) => const AuthExampleApp()),
                    );
                  },
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          MaterialCommunityIcons.pill,
                          size: 100.0,
                          color: Colors.teal[700],
                        ),
                        const Text('Shopping lists',
                            textAlign: TextAlign.center,
                            style: TextStyle(
//                                fontSize: 25,
                                color: Color(0xFFbcc0c5))),
                      ]),
                ),
              ),
              ////////////////////////////////////////////////////////
              /// Health records
              ////////////////////////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xFF303134),
                ),
                alignment: const Alignment(0.0, 0.0),
                padding: const EdgeInsets.all(8),
                child: InkResponse(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
//                              const HealthRecords(title: 'Health records')),
//                              GetUserName('KgWoyAkmjtRtSzpTerzh')),
                              const GetUserName(documentId: '1')),
                    );
                  },
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          MaterialCommunityIcons.notebook,
                          size: 100.0,
                          color: Colors.blue[700],
                        ),
                        const Text('Health records',
                            textAlign: TextAlign.center,
                            style: TextStyle(
//                                fontSize: 25,
                                color: Color(0xFFbcc0c5))),
                      ]),
                ),
              ),
              ////////////////////////////////////////////////////////
              /// Settings
              ////////////////////////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xFF303134),
                ),
                alignment: const Alignment(0.0, 0.0),
                padding: const EdgeInsets.all(8),
                child: InkResponse(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SharedPreferencesDemo()),
                    );
                  },
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          MaterialCommunityIcons.settings,
                          size: 100.0,
                          color: Colors.purple[700],
                        ),
                        const Text('Settings',
                            textAlign: TextAlign.center,
                            style: TextStyle(
//                                fontSize: 25,
                                color: Color(0xFFbcc0c5))),
                      ]),
                ),
              ),
              ////////////////////////////////////////////////////////
              /// http JSON Test
              ////////////////////////////////////////////////////////
/*
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFF303134),
                ),
                alignment: Alignment(0.0, 0.0),
                padding: const EdgeInsets.all(8),
                child: new InkResponse(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => httpTest()),
                    );
                  },
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          MaterialCommunityIcons.settings,
                          size: 100.0,
                          color: Colors.purple[700],
                        ),
                        Text('http Test',
                            textAlign: TextAlign.center,
                            style: TextStyle(
//                                fontSize: 25,
                                color: Color(0xFFbcc0c5))),
                      ]),
                ),
              ),
*/
            ],
          ),
        )

/*
      body: Column(
        children: [
          Card(
            elevation: 10,
            child: ListTile(
              leading: Icon(
                MaterialCommunityIcons.phone_plus,
                color: Colors.red,
              ),
              title: Text('Emergency Contacts'),
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmergencyContactsPerCountry()),
                );
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmergencyContactsPerCountry()),
                );
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal[300],
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: ListTile(
              leading: Icon(
                MaterialCommunityIcons.pill,
                color: Colors.amber,
              ),
              title: Text('Vaccines per country'),
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VaccinePerCountry()),
                );
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VaccinePerCountry()),
                );
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.teal[300],
              ),
            ),
          ),
        ],
      ),
      */
        );
  }
}

//////////////////////////////////////////////////////////////////////////
///
/// Emergency Contacts pe country
///
//////////////////////////////////////////////////////////////////////////
class EmergencyContactsPerCountry extends StatefulWidget {
  const EmergencyContactsPerCountry({Key? key}) : super(key: key);

//  @override
//  State<EmergencyContactsPerCountry> createState() => _EmergencyContactsPerCountryState();
//}
  @override
  _EmergencyContactsPerCountryState createState() =>
      _EmergencyContactsPerCountryState();
}

class _EmergencyContactsPerCountryState
    extends State<EmergencyContactsPerCountry> {
//class EmergencyContactsPerCountry extends StatelessWidget {
//   EmergencyContactsPerCountry({Key? key}) : super(key: key);

/*
class MyHomePage extends StatefulWidget {
//  @override
//  State<MyHomePage> createState() => _MyHomePageState();
//}
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
*/

//  int _counter = 0;
  List emergencyContactsAllCountries = [];
  List emergencyContactsFilteredCountries = [];
  bool isSearching = true;
  String selectedCountry = '';

/*
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
*/

  @override
  void initState() {
    getEmergencyContactsPerCountry().then((data) {
      setState(() {
        emergencyContactsAllCountries =
            emergencyContactsFilteredCountries = data;
      });
    });
    super.initState();
  }

  void _filterCountries(value) {
    setState(() {
      selectedCountry = value;
      emergencyContactsFilteredCountries = emergencyContactsAllCountries
          .where((emergencyContactsAllCountries) =>
              emergencyContactsAllCountries.country
                  .toLowerCase()
                  .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //////////////////////////////////////////////////
      /// bottom Source
      //////////////////////////////////////////////////
      bottomSheet: BottomSheet(
        elevation: 10,
        backgroundColor: const Color(0xFF303134),
        onClosing: () {},
        builder: (BuildContext ctx) => ListTile(
          title: const Text(
            'Source: World Population Review',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFFdddddd)),
          ),
          onLongPress: () async {
            // indirect url launch
            await canLaunch(
                    'https://worldpopulationreview.com/country-rankings/911-by-country')
                ? await launch(
                    'https://worldpopulationreview.com/country-rankings/911-by-country')
                : throw 'Could not launch';
          },
          onTap: () async {
            // indirect url launch
            await canLaunch(
                    'https://worldpopulationreview.com/country-rankings/911-by-country')
                ? await launch(
                    'https://worldpopulationreview.com/country-rankings/911-by-country')
                : throw 'Could not launch';
          },
        ),
      ),
      //////////////////////////////////////////////////
      /// Title bar
      //////////////////////////////////////////////////
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: const Color(0xFF202124),
//        toolbarHeight: 100,
//        flexibleSpace: true,
        title: !isSearching
            ? Text(
                'Emergency contacts' '\n' '\'' + selectedCountry + '\'',
//                textAlign: TextAlign.left,
              )
            : Column(
//                    child: (
                children: const [
                    Text(
                      'Emergency Contacts', textAlign: TextAlign.left,
//                      textAlign: TextAlign.center,
                    ),
/*
                    TextField(
                        onChanged: (value) {
                          // search logic
                          _filterCountries(value);
                        },
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
//                            labelText: "Emergency contacts in ...",
//                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "Search country",
                            hintStyle: TextStyle(color: Colors.white))),
*/
                  ]),
/*
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
*/
      ),
      //////////////////////////////////////////////////
      /// body list of countries
      //////////////////////////////////////////////////
      body: Container(
        color: const Color(0xFF202124),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                  onChanged: (value) {
                    // search logic
                    _filterCountries(value);
                  },
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
//                            labelText: "Emergency contacts in ...",
//                            labelStyle: TextStyle(color: Colors.white),
                      hintText: "Search country",
                      hintStyle: TextStyle(color: Colors.white))),
            ),
            Expanded(
//        padding: EdgeInsets.all(10),
//        child: Column(children: [
//          Container(
              child: emergencyContactsFilteredCountries.isNotEmpty
//            ? Column(children: [
//        child: Column(children: [
//          filteredCountries.length > 0
                  ? ListView.builder(
//                Container(
//                    child: (ListView.builder(
                      itemCount: emergencyContactsFilteredCountries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
//                    child: (
                          children: [
                            ListTile(
                                focusColor: Colors.teal[300],
                                title: Text(
                                    emergencyContactsFilteredCountries[index]
                                        .country,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Color(0xFFeeeeee)))),
                            Card(
                              color: const Color(0xFF303134),
                              elevation: 10,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.local_hospital,
                                  color: Colors.red,
                                ),
                                title: Text(
                                    emergencyContactsFilteredCountries[index]
                                        .ambulance,
                                    style: const TextStyle(
                                        color: Color(0xFFeeeeee))),
                                onTap: () async {
                                  // indirect phone call
                                  launch(
                                      'tel:${emergencyContactsFilteredCountries[index].ambulance}');
                                },
                                trailing: const Icon(
                                  Icons.phone,
                                  color: Color(0xFFeeeeee),
                                ),
                              ),
                            ),
                            Card(
                              color: const Color(0xFF303134),
                              elevation: 10,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.local_fire_department,
                                  color: Colors.amber,
                                ),
                                title: Text(
                                    emergencyContactsFilteredCountries[index]
                                        .fire,
                                    style: const TextStyle(
                                        color: Color(0xFFeeeeee))),
                                onTap: () async {
                                  // indirect phone call
                                  launch(
                                      'tel:${emergencyContactsFilteredCountries[index].fire}');
                                },
                                trailing: const Icon(
                                  Icons.phone,
                                  color: Color(0xFFeeeeee),
                                ),
                              ),
                            ),
                            Card(
                              color: const Color(0xFF303134),
                              elevation: 10,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.local_police,
                                  color: Colors.blue,
                                ),
                                title: Text(
                                    emergencyContactsFilteredCountries[index]
                                        .police,
                                    style: const TextStyle(
                                        color: Color(0xFFeeeeee))),
                                onTap: () async {
                                  // indirect phone call
                                  launch(
                                      'tel:${emergencyContactsFilteredCountries[index].police}');
                                },
                                trailing: const Icon(
                                  Icons.phone,
                                  color: Color(0xFFeeeeee),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(color: Colors.teal[300]),
                    ),
            ),
          ],
        ),
      ),
//                      );
//                        ))),
/*
                Container(
                  child: ListTile(
                    title: Text('Source: World Population Review'),
                    onLongPress: () async {
                      // indirect url launch
                      await canLaunch(
                              'https://worldpopulationreview.com/country-rankings/911-by-country')
                          ? await launch(
                              'https://worldpopulationreview.com/country-rankings/911-by-country')
                          : throw 'Could not launch';
                    },
                  ),
                ),
*/
//              ]
//}
/*
          ),
          Container(
            child: ListTile(
              title: Text('Source: World Population Review'),
              onLongPress: () async {
                // indirect url launch
                await canLaunch(
                        'https://worldpopulationreview.com/country-rankings/911-by-country')
                    ? await launch(
                        'https://worldpopulationreview.com/country-rankings/911-by-country')
                    : throw 'Could not launch';
              },
            ),
          ),
*/
//        ]),

/*
            : ListView.builder(
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        numbers[index].leadingIcon,
                        color: numbers[index].leadingIconColor,
                      ),
                      title: Text(numbers[index].number),
                      subtitle: Text(
                          numbers[index].name + '\n' + numbers[index].url,
                          overflow: TextOverflow.ellipsis),
                      isThreeLine: true,
                      onTap: () async {
                        // indirect phone call
                        launch('tel:${numbers[index].numberToLaunch}');
                      },
                      onLongPress: () async {
                        // indirect url launch
                        await canLaunch(numbers[index].url)
                            ? await launch(numbers[index].url)
                            : throw 'Could not launch';
                      },
                      trailing: Icon(
                        Icons.phone,
                        color: Colors.teal[300],
                      ),
                    ),
                  );
                }),
*/

/*
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple[800],
        unselectedItemColor: Colors.deepPurpleAccent[100],
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: const <BottomNavigationBarItem>[
/*
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
*/
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.pill),
            label: 'Vaccine',
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.phone_plus),
            label: 'Emergency',
          ),
/*
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
*/
        ],
//        onTap: _onItemTapped,
/*
        onTap: (value) {
          // Respond to item press.
        },
*/
      ),
*/

/*
      bottomNavigationBar: BottomAppBar(
          child: Row(children: [
//        IconButton(icon: Icon(Icons.home), onPressed: () {}),
        IconButton(
            icon: Icon(MaterialCommunityIcons.pill),
            color: Colors.deepPurpleAccent[100],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VaccinePerCountry()),
              );
            }),
        IconButton(
            icon: Icon(MaterialCommunityIcons.phone_plus),
            color: Colors.deepPurple[800],
            onPressed: () {}),
//        IconButton(icon: Icon(Icons.settings), onPressed: () {}),
      ])),

//        currentIndex: _selectedCountry,
//        selectedItemColor: Colors.amber[800],
//        onTap: _onItemTapped,
//      ),
*/
      /*
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Aide médicale urgente: 112'),
            const Text('Incendie: 112'),
            const Text('Police: 112'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      */
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: const Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//////////////////////////////////////////////////////////////////////////
///
/// Vaccines per country
///
//////////////////////////////////////////////////////////////////////////
class VaccinePerCountry extends StatefulWidget {
  const VaccinePerCountry({Key? key}) : super(key: key);

  @override
  _VaccinePerCountryState createState() => _VaccinePerCountryState();
}

class _VaccinePerCountryState extends State<VaccinePerCountry> {
  List countries = [];
  List filteredCountries = [];
  bool isSearching = true;
  String selectedCountry = '';

  @override
  void initState() {
    getVaccinePerCountries().then((data) {
      setState(() {
        countries = filteredCountries = data;
      });
    });
    super.initState();
  }

  void _filterCountries(value) {
    setState(() {
      selectedCountry = value;
      filteredCountries = countries
          .where((countries) =>
              countries.country.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////////////////////////////////////////////
      bottomSheet: BottomSheet(
        elevation: 10,
        backgroundColor: const Color(0xFF303134),
        onClosing: () {},
        builder: (BuildContext ctx) => ListTile(
          title: const Text(
            'Source: Institute of Tropical Medecine',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
/*            
            subtitle: Text(
              '\u{2705}: imperative for intertropical Africa & America \n \u{2755}: strongly recommended \n \u{1F90D}: adviced depending on the travel conditions',
              style: TextStyle(color: Colors.white),
            ),
*/
          onLongPress: () async {
            // indirect url launch
            await canLaunch('https://www.itg.be')
                ? await launch('https://www.itg.be')
                : throw 'Could not launch';
          },
          onTap: () async {
            // indirect url launch
            await canLaunch('https://www.itg.be')
                ? await launch('https://www.itg.be')
                : throw 'Could not launch';
          },
        ),
      ),
      ////////////////////////////////////////////////////////////
      /// AppBar title
      /// ///////////////////////////////////////////////////////
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: const Color(0xFF202124),
//        toolbarHeight: 100,
        title: !isSearching
            ? Text(
                'Travel advices' '\n' '\'' + selectedCountry + '\'',
                textAlign: TextAlign.left,
              )
            : Column(children: const [
                Text(
                  'Travel advices',
                ),
/*
                TextField(
                    onChanged: (value) {
                      // search logic
                      _filterCountries(value);
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Search country",
                        hintStyle: TextStyle(color: Colors.white))),
*/
              ]),
      ),
      ////////////////////////////////////////////////////////////
      ///
      /// body list of countries with links
      ///
      /// ////////////////////////////////////////////////////////
      body: Container(
        color: const Color(0xFF202124),
//                        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                  onChanged: (value) {
                    // search logic
                    _filterCountries(value);
                  },
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Search country",
                      hintStyle: TextStyle(color: Colors.white))),
            ),
            Expanded(
              child: filteredCountries.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredCountries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Card(
                              color: const Color(0xFF303134),
                              elevation: 10,
                              child: ListTile(
                                title: Text(filteredCountries[index].country,
                                    style: const TextStyle(
                                        color: Color(0xFFeeeeee))),
                                onLongPress: () async {
                                  // indirect url launch
                                  await canLaunch(
                                          'https://www.wanda.be/en/landen/' +
                                              filteredCountries[index]
                                                  .country
                                                  .replaceAll(' ', '-'))
                                      ? await launch(
                                          'https://www.wanda.be/en/landen/' +
                                              filteredCountries[index]
                                                  .country
                                                  .replaceAll(' ', '-'))
                                      : throw 'Could not launch';
                                },
                                onTap: () async {
                                  // indirect url launch
                                  await canLaunch(
                                          'https://www.wanda.be/en/landen/' +
                                              filteredCountries[index]
                                                  .country
                                                  .replaceAll(' ', '-'))
                                      ? await launch(
                                          'https://www.wanda.be/en/landen/' +
                                              filteredCountries[index]
                                                  .country
                                                  .replaceAll(' ', '-'))
                                      : throw 'Could not launch';
                                },
                                trailing: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
//                      Divider(color: Color(0xFF303134)),
                          ],
                        );
                      })
                  : const Center(
                      child: CircularProgressIndicator(color: Colors.amber),
                    ),
            ),
          ],
        ),
      ),

/*      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple[800],
        unselectedItemColor: Colors.deepPurpleAccent[100],
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: const <BottomNavigationBarItem>[
/*
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
*/
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.pill),
            label: 'Vaccine',
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.phone_plus),
            label: 'Phone',
          ),
/*
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
*/
        ],
//        onTap: _onItemTapped,

        onTap: (value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
      ),
*/
    );
  }
}

//////////////////////////////////////////////////////////////////////////
///
/// Authorization page introduction
///
//////////////////////////////////////////////////////////////////////////
/// The entry point of the application.
///
/// Returns a [MaterialApp].
///
class AuthExampleApp extends StatelessWidget {
  const AuthExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authorization',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: const AuthTypeSelector(),
      ),
    );
  }
//}
}

//////////////////////////////////////////////////////////////////////////
///
/// Authorization page
///
//////////////////////////////////////////////////////////////////////////

/// Provides a UI to select a authentication type page
class AuthTypeSelector extends StatelessWidget {
  const AuthTypeSelector({Key? key}) : super(key: key);

  ////////////////////////////////////////////////////////////
  // Navigates to a new page
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////////////////////////////////////
      appBar: AppBar(
        title: const Text('Authorization'),
      ),
      ///////////////////////////////////////////////////
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: Colors.indigo,
              text: 'Registration',
//              onPressed: () => _pushPage(context, const RegisterPage()),
              onPressed: () => _pushPage(context, const RegisterPage()),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SignInButtonBuilder(
              icon: Icons.verified_user,
              backgroundColor: Colors.orange,
              text: 'Sign In',
//              onPressed: () => _pushPage(context, const SignInPage()),
              onPressed: () => _pushPage(context, SignInPage()),
            ),
          ),
        ],
      ),
    );
  }
}
///////////////////////////////////////////////////////
///
/// END OF AUTHENTIFICATION
///
/// //////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
///
///  Pharmacy Shopping List
///
//////////////////////////////////////////////////////////////////////////
//class PharmacyShoppingList extends StatefulWidget {
class PharmacyShoppingList extends StatefulWidget {
  const PharmacyShoppingList({Key? key}) : super(key: key);

  @override
  _PharmacyShoppingListState createState() => _PharmacyShoppingListState();
}

////////////////////////////////////////////
enum _Actions { deleteAll }
enum _ItemActions { delete, edit, containsKey }

////////////////////////////////////////////
////////////////////////////////////////////
class _PharmacyShoppingListState extends State<PharmacyShoppingList> {
  final _storage = const FlutterSecureStorage();
  final _accountNameController = TextEditingController(text: '');

  List<_SecItem> _items = [];
//  List listOfDrugs = [];
//  List filteredListOfDrugs = [];
//  bool isSearching = true;
//  String selectedDrug = '';

  @override
  void initState() {
//     getMyPharmacyShoppingList().then((data) {
//      setState(() {
//        listOfDrugs = filteredListOfDrugs = data;
//      });
//    });
//    super.initState();

    super.initState();

    _accountNameController.addListener(() => _readAll());
    _readAll();
  }

  Future<void> _readAll() async {
    final all = await _storage.readAll(
        iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
    setState(() {
      _items = all.entries
          .map((entry) => _SecItem(entry.key, entry.value))
          .toList(growable: false);
    });
  }

  void _deleteAll() async {
    await _storage.deleteAll(
        iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
    _readAll();
  }

  void _addNewItem() async {
    final String key = _randomValue() + _accountNameController.text;
//    final String key = _accountNameController.text;
//    final String value = _randomValue();
    String value = 'Item';

    await _storage.write(
        key: key,
        value: value,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
    _readAll();
  }

  IOSOptions _getIOSOptions() => IOSOptions(
        accountName: _getAccountName(),
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  String? _getAccountName() =>
      _accountNameController.text.isEmpty ? null : _accountNameController.text;

  //////////////////////////////////////////////////////
  //////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////////////////////////////////////
      ////////////////////////////////////////////////////
      appBar: AppBar(
        backgroundColor: const Color(0xFF202124),
        title: const Text('shopping list'),
        actions: <Widget>[
/*
          IconButton(
              key: const Key('add_random'),
              onPressed: _addNewItem,
              icon: const Icon(Icons.add)),
*/
          PopupMenuButton<_Actions>(
              icon: const Icon(Icons.delete),
              key: const Key('popup_menu'),
              onSelected: (action) {
                switch (action) {
                  case _Actions.deleteAll:
                    _deleteAll();
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<_Actions>>[
                    const PopupMenuItem(
                      key: Key('delete_all'),
                      value: _Actions.deleteAll,
                      child: Text('Delete all'),
                    ),
                  ])
        ],
      ),
      ////////////////////////////////////////////////////
      ////////////////////////////////////////////////////
/*
      body: Container(
        padding: EdgeInsets.all(10),
        child: filteredListOfDrugs.length > 0
            ? ListView.builder(
                itemCount: filteredListOfDrugs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                          focusColor: Colors.teal[300],
                          title: Text(filteredListOfDrugs[index].drug)),
                      Card(
                        elevation: 10,
                        child: ListTile(
                          leading: Icon(
                            Icons.check_circle_outline,
                            color: Colors.red,
                          ),
                          title: Text(filteredListOfDrugs[index].package),
                          onTap: () {
                            // indirect delete item in list
                            _deleteListOfDrugs(filteredListOfDrugs[index].drug);
                          },
                          trailing: Icon(
                            Icons.delete,
                            color: Colors.teal[300],
                          ),
                        ),
                      ),
                    ],
                  );
                })
            : Center(
                child: CircularProgressIndicator(color: Colors.teal[300]),
              ),
      ),
*/
      body: Container(
        color: const Color(0xFF202124),
        child: Column(
          children: [
            if (!kIsWeb && Platform.isIOS)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _accountNameController,
                  style: const TextStyle(color: Color(0xFFdddddd)),
                  cursorColor: const Color(0xFFdddddd),
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFdddddd))),
//                     hintText: "Selected list",
//                     hintStyle: TextStyle(color: Color(0xFFdddddd)),
                      labelText: 'Selected list',
                      labelStyle: TextStyle(color: Color(0xFFdddddd))),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  trailing: PopupMenuButton(
                      icon: const Icon(Icons.edit, color: Color(0xFFbbbbbb)),
                      key: Key('popup_row_$index'),
                      onSelected: (_ItemActions action) =>
                          _performAction(action, _items[index], context),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<_ItemActions>>[
                            PopupMenuItem(
                              value: _ItemActions.delete,
                              child: Text(
                                'Delete',
                                key: Key('delete_row_$index'),
                              ),
                            ),
                            PopupMenuItem(
                              value: _ItemActions.edit,
                              child: Text(
                                'Edit',
                                key: Key('edit_row_$index'),
                              ),
                            ),
/*
                          PopupMenuItem(
                            value: _ItemActions.containsKey,
                            child: Text(
                              'Contains Key',
                              key: Key('contains_row_$index'),
                            ),
                          ),
*/
                          ]),
                  title: Text(
                    _items[index].value,
                    style: const TextStyle(color: Color(0xFFeeeeee)),
                    key: Key('title_row_$index'),
                  ),
                  subtitle: Text(
                    _items[index].key.substring(20),
                    style: const TextStyle(color: Color(0xFFbbbbbb)),
//                  key: Key('subtitle_row_$index'),
                  ),
/*                
                subtitle: Text(
                  _items[index].key,
                  key: Key('subtitle_row_$index'),
                ),
*/
                ),
              ),
            ),
          ],
        ),
      ),

      ////////////////////////////////////////////////////
      ////////////////////////////////////////////////////
/*
      bottomNavigationBar: BottomAppBar(
          child: Row(children: [
//        IconButton(icon: Icon(Icons.home), onPressed: () {}),
        IconButton(
            icon: Icon(MaterialCommunityIcons.pill),
            color: Colors.deepPurpleAccent[100],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VaccinePerCountry()),
              );
            }),
        IconButton(
            icon: Icon(MaterialCommunityIcons.phone_plus),
            color: Colors.deepPurple[800],
            onPressed: () {}),
//        IconButton(icon: Icon(Icons.settings), onPressed: () {}),
      ])),
*/

      ////////////////////////////////////////////////////
      ////////////////////////////////////////////////////
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF303134),
        child: Icon(Icons.add, color: Colors.teal[300]),
        key: const Key('add_random'),
        onPressed: _addNewItem,
/*
        onPressed: () {
          // dart code here
          _addNewItem;
        },
*/
      ),

//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: const Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.

//        currentIndex: _selectedCountry,
//        selectedItemColor: Colors.amber[800],
//        onTap: _onItemTapped,
//      ),
    );
  }

////////////////////////////////////////////////////
  ///
  /// For saving data
  ///
  ///
  ///
  Future<void> _performAction(
      _ItemActions action, _SecItem item, BuildContext context) async {
    switch (action) {
      case _ItemActions.delete:
        await _storage.delete(
            key: item.key,
            iOptions: _getIOSOptions(),
            aOptions: _getAndroidOptions());
        _readAll();

        break;
      case _ItemActions.edit:
        final result = await showDialog<String>(
            context: context,
            builder: (context) => _EditItemWidget(item.value));
        if (result != null) {
          await _storage.write(
              key: item.key,
              value: result,
              iOptions: _getIOSOptions(),
              aOptions: _getAndroidOptions());
          _readAll();
        }
        break;
      case _ItemActions.containsKey:
        final result = await _storage.containsKey(key: item.key);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Contains Key: $result'),
          // backgroundColor: Colors.green,
          duration: const Duration(seconds: 4),
        ));
        break;
    }
  }

  String _randomValue() {
    final rand = Random();
    final codeUnits = List.generate(20, (index) {
      return rand.nextInt(26) + 65;
    });

    return String.fromCharCodes(codeUnits);
  }
}

/*
Widget _drawerPopup() => PopupMenuButton<int>(
    itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text(
              "Flutter Open",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              "Flutter Tutorial",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
        ],
    icon: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: ShapeDecoration(
          color: Colors.blue,
          shape: StadiumBorder(
            side: BorderSide(color: Colors.white, width: 2),
          )),
      //child: Icon(Icons.menu, color: Colors.white), <-- You can give your icon here
    ));
*/

class _EditItemWidget extends StatelessWidget {
  _EditItemWidget(String text)
      : _controller = TextEditingController(text: text);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit item'),
      content: TextField(
        key: const Key('title_field'),
        controller: _controller,
        autofocus: true,
      ),
      actions: <Widget>[
        TextButton(
            key: const Key('cancel'),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel')),
        TextButton(
            key: const Key('save'),
            onPressed: () => Navigator.of(context).pop(_controller.text),
            child: const Text('Save')),
      ],
    );
  }
}

class _SecItem {
  _SecItem(this.key, this.value);

  final String key;
  final String value;
}

//////////////////////////////////////////////////////////////////////////
///
///  HealthRecords
///
//////////////////////////////////////////////////////////////////////////
/*
/////////////////////////////////////////////////////
class AddHealthRecord extends StatelessWidget {
  final String date;
  final String userID;
  final String weight;

  AddHealthRecord(this.date, this.userID, this.weight);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference healthrecords =
        FirebaseFirestore.instance.collection('healthrecords');

    Future<void> addHealthRecord() {
      // Call the user's CollectionReference to add a new user
      return healthrecords
          .add({
            'full_name': date, // John Doe
            'company': userID, // Stokes and Sons
            'age': weight // 42
          })
          .then((value) => print("Health Record Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addHealthRecord,
      child: Text(
        "Add User",
      ),
    );
  }
}
///////////////////////////////////////////////////
*/
///////////////////////////////////////////////////

class GetUserName extends StatefulWidget {
  const GetUserName({required this.documentId, Key? key}) : super(key: key);
  final String documentId;

  @override
  _GetUserNameState createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
//  late Stream<QuerySnapshot> _GetUserNameData;

  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside build.
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
//      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();

    super.initState();
//    _GetUserNameData =
//        FirebaseFirestore.instance.collection('healthrecords').snapshots();
//    _GetUserNameData =
//        FirebaseFirestore.instance.collection("healthrecords").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection("healthrecords");

    // Show error message if initialization failed
    if (_error) {
//      return SomethingWentWrong();
      return const Text('Error');
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
//      return Loading();
      return const Text('Loading collection ...');
    }

//    return const Text('no issue');

    return Scaffold(
      //////////////////////////////////////////
      appBar: AppBar(
        title: const Text('Firestore test'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc('KgWoyAkmjtRtSzpTerzh').get(),
//        future: FirebaseFirestore.instance.collection("healthrecords").doc("KgWoyAkmjtRtSzpTerzh").get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text("data: ${data['date']} ${data['weight']}");
          }

          return const Text("loading");
        },
      ),
    );
  }
}

/*

 final Future<FirebaseApp> _initialization = Firebase.initializeApp();

class GetUserName extends StatelessWidget {
//  const GetUserName({Key? key}) : super(key: key);
  final String documentId;


  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {

    CollectionReference users =
        FirebaseFirestore.instance.collection('healthrecords');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("data: ${data['date']} ${data['weight']}");
        }

        return Text("loading");
      },
    );
  }
}
*/

////////////////////////////////////////////////////
/*

class HealthRecords extends StatefulWidget {
  const HealthRecords({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  _HealthRecordsState createState() => _HealthRecordsState();
}

class _HealthRecordsState extends State<HealthRecords> {
  late Stream<QuerySnapshot> _healthRecordsData;

  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside build.

/*
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Text('something wrong');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const Text('My app...');
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Text('Loading...');
      },
    );
*/

  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();

    super.initState();
    _healthRecordsData =
        FirebaseFirestore.instance.collection('healthrecords').snapshots();
  }

  @override
  Widget build(BuildContext context) {

      // Show error message if initialization failed
    if (_error) {
//      return SomethingWentWrong();
      return const Text('Error');
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
//      return Loading();
      return const Text('Loading...');
    }


//    return MyAwesomeApp();
//    return const Text('Firebase Core example app');

    return Scaffold(
      //////////////////////////////////////////
      appBar: AppBar(
        title: const Text('Firestore test'),
      ),
/*
      //////////////////////////////////////////
      // This is a example use for 'snapshots in sync'.
      // The view reflects the time of the last Firestore sync; which happens any time a field is updated.
        body: StreamBuilder<QuerySnapshot>(
          stream: _healthRecordsData,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading...'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(
                  snapshot.data!.docs[index]['weight'],
                  style: const TextStyle(color: Color(0xFFeeeeee)),
                ),
                subtitle: Text(
                  snapshot.data!.docs[index]["date"],
                  style: const TextStyle(color: Color(0xFFbbbbbb)),
                ),
              ),
            );
          },
        )
*/      
    );

/*    
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        ///////////////////////////////////////////////////////
        // Check for errors
        if (snapshot.hasError) {
//          return const Text('Something went wrong');
          return Text('Error: ${snapshot.error}');
        }
        ///////////////////////////////////////////////////////
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
//          return MyAwesomeApp();
          return const Text('Firebase Core example app');
/*
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading...');
            default:
*/
/*
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(
                    snapshot.data!.docs[index]['weight'],
                    style: const TextStyle(color: Color(0xFFeeeeee)),
                  ),
                  subtitle: Text(
                    snapshot.data!.docs[index]["date"],
                    style: const TextStyle(color: Color(0xFFbbbbbb)),
                  ),
                ),
              );
*/
/*
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return foodCard(document['weight'],document['date']);
                }).toList(),
              );
*/
//          }
/*
          return StreamBuilder<QuerySnapshot>(
            //recover data from firebase and shows in the listview
            stream: FirebaseFirestore.instance
                .collection('healthrecords')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return const Text('THAT IS ALL FOLKS');
            },
          );
*/
/*          
          
          StreamBuilder(
//          initialData: Firebase.initializeApp(),
          stream: FirebaseFirestore.instance.collection('healthrecords').snapshots(),
          builder: (context, snapshot) {
//            if (!snapshot.hasData) return const Text('loading...');
            return Container(
              color: Color(0xFF303134),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: healthRecordFilteredDates.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(
                    healthRecordFilteredDates[index].weight,
                    style: TextStyle(color: Color(0xFFeeeeee)),
                  ),
                  subtitle: Text(
                    healthRecordFilteredDates[index].date,
                    style: TextStyle(color: Color(0xFFbbbbbb)),
                  ),
                ),
              ),
            );
          }),
*/

        }

        ///////////////////////////////////////////////////////
        // Otherwise, show something whilst waiting for initialization to complete
//        return Loading();
        return const Text('Loading ...');
      },
    );
*/
  }
}

/*
  List healthRecordAllDates = [];
  List healthRecordFilteredDates = [];
  bool isSearching = true;
  String selectedDate = '';


  @override
  void initState() {
    super.initState();
//    Firebase.initializeApp().whenComplete(() {
//      print("completed");
//      setState(() {});
//    });
    getHealthRecordPerDate().then((data) {
      setState(() {
        healthRecordAllDates = healthRecordFilteredDates = data;
      });
    });
  }

  void _filterDates(value) {
    setState(() {
      selectedDate = value;
      healthRecordFilteredDates = healthRecordAllDates
          .where((healthRecordAllDates) => healthRecordAllDates.date
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

/*
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return Loading();
      },
    );
  }
*/
/*
  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
//        options: const FirebaseOptions(
//      apiKey: 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0',
//      appId: '1:448618578101:ios:2bc5c1fe2ec336f8ac3efc',
//      messagingSenderId: '448618578101',
//      projectId: 'react-native-firebase-testing',
//    )
        );
    assert(app != null);
    print('Initialized default app $app');
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////////////////////////////////////
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Color(0xFF202124),
        title: const Text('Health records'),
//        toolbarHeight: 100,
      ),
      ////////////////////////////////////////////////////////////
      body: StreamBuilder(
//          initialData: Firebase.initializeApp(),
          stream: FirebaseFirestore.instance
              .collection('healthrecords')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('loading...');
            return Container(
              color: Color(0xFF303134),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: healthRecordFilteredDates.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(
                    healthRecordFilteredDates[index].weight,
                    style: TextStyle(color: Color(0xFFeeeeee)),
                  ),
                  subtitle: Text(
                    healthRecordFilteredDates[index].date,
                    style: TextStyle(color: Color(0xFFbbbbbb)),
                  ),
                ),
              ),
            );
          }),
    );
  }

*/

//}
*/
//////////////////////////////////////////////////////////////////////////
///
///  SharedPreferences
///
//////////////////////////////////////////////////////////////////////////
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SharedPreferences Demo',
      home: SharedPreferencesDemo(),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Center(
          child: FutureBuilder<int>(
              future: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                        'This should persist across restarts.',
                      );
                    }
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////
///
///  test JSON http
///
//////////////////////////////////////////////////////////////////////////
//class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
//
/*
class httpTest extends StatefulWidget {
  @override
  _httpTestState createState() => _httpTestState();
}

class _httpTestState extends State<httpTest> {
  List httpTestList = [];

//  void main(List<String> arguments) async {
  void _httpTest(List<String> arguments) async {
    var url =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////////////////////////////////////
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Color(0xFF202124),
        title: const Text('http test'),
//        toolbarHeight: 100,
      ),
      ////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////
      body: Container(
        color: Color(0xFF202124),
//                        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Search country",
                      hintStyle: TextStyle(color: Colors.white))),
            ),
            Expanded(
              child: _httpTest.length > 0
                  ? ListView.builder(
                      itemCount: _httpTest.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Card(
                              color: Color(0xFF303134),
                              elevation: 10,
                              child: ListTile(
                                title: Text(_httpTest[index].country,
                                    style: TextStyle(color: Color(0xFFeeeeee))),
                                trailing: Icon(
                                  Icons.chevron_right,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
//                      Divider(color: Color(0xFF303134)),
                          ],
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(color: Colors.amber),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
