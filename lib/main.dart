import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Input Display',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResultScreen(title: 'User Input Display'),
    );
  }
}

class ResultScreen extends StatefulWidget {
  ResultScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  TextEditingController answerController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    answerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
        widget.title,
      )),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Question asked from User will be displayed in dialog box',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                    ),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'What is your experience with the HNG internship so far?',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic ),
                    textAlign: TextAlign.center
                ),
              ),

              Container(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextField(
                    controller: answerController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Answer',
                      hintText: 'Type in your answer here',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child:FloatingActionButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // Retrieve the text the that user has entered by using the
                              // TextEditingController.
                              content: Text(answerController.text),
                            );
                          },
                        );
                      },
                      tooltip: 'Show me the value!',
                      child: const Icon(Icons.text_fields),

                    ),
                    //Text(answerController.text),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

