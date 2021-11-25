import 'package:flutter/material.dart';
import 'package:task11_flutter/api/apiService.dart';
import 'fingerprint_login.dart';
import 'package:task11_flutter/models/model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) => _uiSetup(context);


  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "Вход",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.phone,
                          onSaved: (input) => loginRequestModel.phone = '7'+input,
                          validator: (input) => input.length < 10
                              ? "Enter valid phone number"
                              : null,
                          decoration: new InputDecoration(
                              hintText: "Номер",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  '+7',
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style:
                          TextStyle(color: Theme.of(context).accentColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                          loginRequestModel.password = input,
                          validator: (input) => input.length < 6
                              ? "Enter valid password"
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "Пароль",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).accentColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (validateAndSave()) {
                              print(loginRequestModel.toJson());

                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIService apiService = new APIService();
                              apiService.login(loginRequestModel).then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FingerprintPage()));
                                  });

                                  if (value.token.isNotEmpty) {
                                    final snackBar = SnackBar(content: Text("Login Successful"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  } else {
                                    final snackBar = SnackBar(content: Text("User not found"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  }
                                }
                              });
                            }
                          },
                          child: Text(
                            "Отправить",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}