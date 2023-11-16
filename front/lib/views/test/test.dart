/* import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send SMS Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            sendSMS();
          },
          child: Text('Send SMS'),
        ),
      ),
    );
  }

  void sendSMS() async {
    // Create a new SmsMessage instance
    SmsMessage smsMessage = SmsMessage(
      // Phone number to which the SMS will be sent
      '+1234567890',
      // SMS body
      'Hello, this is a test message from Flutter!',
    );

    try {
      // Send the SMS
      await smsMessage.send();
      print('SMS sent successfully!');
    } catch (error) {
      print('Error sending SMS: $error');
    }
  }
} */