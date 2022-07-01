import 'package:flutter/material.dart';
import 'package:flutter_demo/page/HomePage.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences loginDataPref;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    loginDataPref = await SharedPreferences.getInstance();
    newUser = (loginDataPref.getBool('login') ?? true);
    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  void dispose() {
    userNameController.clear();
    passwordController.clear();
    super.dispose();
  }

  moveToNext(BuildContext buildContext) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedButton = true;
      });

      loginDataPref.setString('UserName', userNameController.text);
      loginDataPref.setString('Password', passwordController.text);
      loginDataPref.setBool('login', false);

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      // Navigator.pushNamed(context, "/home");

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => HomePage()));

      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/hey.png",
                fit: BoxFit.cover,
                height: 250,
                width: 300,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: userNameController,
                          decoration: InputDecoration(
                              hintText: "Enter Username",
                              labelText: "Username"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty..!";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty..!";
                            } else if (value.length < 6) {
                              return "Password length should be atleast 6";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 40.0,
                        ),

                        Material(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changedButton ? 50 : 8),
                          child: InkWell(
                            onTap: () => moveToNext(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changedButton ? 50 : 150,
                              height: 50,
                              // color: Colors.deepPurple,
                              alignment: Alignment.center,
                              child: changedButton
                                  ? Icon(Icons.done, color: Colors.white)
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                              // decoration: BoxDecoration(
                              //     color: Colors.deepPurple,
                              //     // shape: changedButton
                              //     //     ? BoxShape.circle
                              //     //     : BoxShape.rectangle),
                              //     borderRadius: BorderRadius.circular(
                              //         changedButton ? 50 : 8)),
                            ),
                          ),
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                        //   },
                        //   child: Text("Login"),
                        //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                        // )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
