import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'SMS Messenger'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  SmsQuery query = new SmsQuery();
  List<SmsMessage> messageList = [];
  @override
  void initState() {
    super.initState();
    _getSms();

  }
  _getSms()async {
    messageList = await query.getAllSms;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:messageList.length != 0 ? ListView.builder(
        shrinkWrap: true,
          itemCount: messageList.length,
          itemBuilder: (BuildContext context,int index){
            return smsUi(messageList[index]);
          }
      ) : Text(
        "No Record Found."
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget smsUi(SmsMessage smsMessage){
    return Column(
        children: <Widget>[
          Text(
            smsMessage.address
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
              smsMessage.body
          ),
        ],
    );
  }
}
