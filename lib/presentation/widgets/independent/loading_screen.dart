import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // AnnotatedRegion<SystemUiOverlayStyle>(
        //   sized: false,
        //   value: SystemUiOverlayStyle(
        //     statusBarColor: Colors.red, //top status bar
        //     systemNavigationBarContrastEnforced: false,
        //     systemNavigationBarColor:
        //         Colors.blue, // navigation bar color, the one Im looking for
        //     statusBarIconBrightness: Brightness.dark, // status bar icons' color
        //     systemNavigationBarIconBrightness:
        //         Brightness.dark, //navigation bar icons' color
        //   ),
        //   child:
        const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     systemNavigationBarColor: Colors.blue, // Navigation bar
        //     statusBarColor: Colors.amber, // Status bar
        //   ),
        // ),
        // resizeToAvoidBottomInset: false,
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      // ),
    );
  }
}
