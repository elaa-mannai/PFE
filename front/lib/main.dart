import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/bindings.dart';
import 'package:front/views/admin/home_view_admin.dart';
import 'package:front/views/login_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    print('success firebase');
    _initializeFCM();
  });
  runApp(const MyApp());
}

void _initializeFCM() {
  FirebaseMessaging.instance.requestPermission();
  FirebaseMessaging.instance.getToken().then((token) {
    print("FCM Token: $token");
    // Store the token on your server for sending targeted messages
    AccountInfoStorage.saveFCMTokenUser(token);
    print("savedfcm ${AccountInfoStorage.readFCMTokenUser()}");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: AllBindings(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
        ),
        //  home: ProductDetail());
        //  home: MyImageWidget());
        home: LoginView()
      // home: HomeViewAdmin()
      );
    //https://github.com/ahmeriqbal7aa/flutter_send_sms/blob/master/lib/main.dart

    //home: ChatScreen());
  }
}

class LandPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 640,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: -41,
                top: -82,
                child: Container(
                  width: 435,
                  height: 472,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/landpage.jpg'),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 75,
                top: 337,
                child: Container(
                  width: 210,
                  height: 111,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo1.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 448,
                child: Text(
                  'Event Planner',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD0B336),
                    fontSize: 48,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 31,
                top: 516,
                child: SizedBox(
                  width: 292,
                  child: Text(
                    'An application build for a new way to manage an event',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 140,
                top: 556,
                child: Text(
                  '......',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD0B336),
                    fontSize: 48,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
