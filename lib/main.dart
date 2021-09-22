import 'package:flutter/material.dart';
import 'makepwd.dart';
import 'makepwdLegacy.dart';
import 'package:clipboard/clipboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Taskit Password Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool _showCode = false;
  String _password = "";
  String _name = "";
  String _code = "";
  bool isSwitched = false;
  String _modus = "";

  final nameController = TextEditingController();
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey,
      body: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_modus),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      modus();
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Colors.yellow,
                  activeColor: Colors.orangeAccent,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person_add),
                  ),
                ),
                TextFormField(
                  controller: codeController,
                  obscureText: !this._showCode,
                  decoration: InputDecoration(
                    labelText: 'Code',
                    prefixIcon: Icon(Icons.security),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: this._showCode ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() => this._showCode = !this._showCode);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      if (isSwitched == false) {
                        setState(() {
                          _name = nameController.text;
                          _code = codeController.text;

                          _password = generatePassword(_name, _code);
                          print(_password);
                          print('switch = false');
                        });
                      } else
                        setState(() {
                          _name = nameController.text;
                          _code = codeController.text;

                          _password = generatePasswordLegacy(_name, _code);
                          print(_password);
                          print('switch = true');
                        });
                    },
                    child: const Text('Generate Password')),
                SizedBox(height: 20),
                Text(
                  _password,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                IconButton(
                  icon: Icon(
                    Icons.copy,
                    color: Colors.brown,
                  ),
                  onPressed: () {
                    if (_password != "") {
                      FlutterClipboard.copy(_password)
                          .then((value) => print('copied'));
                    } else {
                      print('nothing to copy');
                    }
                  },
                ),
              ]),
        ),
      ),
    );
  }

  modus() {
    if (isSwitched == false) {
      _modus = "2021 Mode active";
    } else {
      _modus = "Legacy Mode active";
    }
  }
}
