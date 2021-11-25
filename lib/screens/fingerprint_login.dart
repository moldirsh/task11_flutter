import 'package:task11_flutter/api/localAuthApi.dart';
import 'navigation.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class FingerprintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(72, 84, 108, 1),
      title: Text("Authentication Page", style: TextStyle(color: Colors.white)),
      centerTitle: true,
      leading: IconButton(icon:Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()))),
    ),
    body: Padding(
      padding: EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAuthenticate(context),
          ],
        ),
      ),
    ),
  );

  Widget buildAuthenticate(BuildContext context) => buildButton(
    text: 'Authenticate',
    icon: Icons.lock_open,
    onClicked: () async {
      final isAuthenticated = await LocalAuthApi.authenticate();

      if (isAuthenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NavBar()),
        );
      }
    },
  );

  Widget buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF47536d),
          onPrimary: Colors.white,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
          minimumSize: Size.fromHeight(50),
        ),
        icon: Icon(icon, size: 26),
        label: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );

}