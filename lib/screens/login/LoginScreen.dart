import 'package:customer/common/resource/Dimension.dart';
import 'package:customer/common/utils/CommonWidgets.dart';
import 'package:customer/common/utils/Validator.dart';
import 'package:customer/screens/dashboard/DashboardScreen.dart';
import 'package:customer/screens/register/RegisterScreen.dart';
import 'package:customer/screens/tabview/TabScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TabController? _tabController;
  FocusNode? fcEmail;
  FocusNode? fcPassword;

  var _formKey = GlobalKey<FormState>();
  var validator = Validator();
  var isPasswordValid = true;

  int currentIndex = 0;
  int currentIndexForInnerTab = 0;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    fcEmail = FocusNode();
    fcPassword = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController?.dispose();
    passwordController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Spacing.large,
              ),
              getTabTiles,
              SizedBox(
                height: Spacing.large,
              ),
              getLoginContainer,
            ],
          ),
        ),
      ),
    );
  }

  get getTabTiles => Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Row(
            children: [
              tabTile('Customer', 0, onToggleBtnClick, currentIndex),
              tabTile('Instructor', 1, onToggleBtnClick, currentIndex),
            ],
          ),
        ),
      );
  onToggleBtnClick(int index) {
    if (index == 0) {
      currentIndexForInnerTab = 0;
    }
    setState(() {
      currentIndex = index;
    });
  }

  get getLoginContainer => Container(
        padding: EdgeInsets.only(left: Spacing.JUMBO40, right: Spacing.JUMBO40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: emailController,
                autofocus: false,
                validator: (value) {
                  if (validator.emailVerification(value!))
                    return 'Enter Valid Email';
                  return null;
                },
                // onSaved: (value)=> _userName = value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.blue),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.blue),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: passwordController,
                autofocus: false,
                validator: (value) =>
                    value!.isEmpty ? "Please enter password" : null,
                // onSaved: (value)=> _userName = value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.blue),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              onLoginButtonClick,
              SizedBox(
                height: 20.0,
              ),
              getDontHaveAccountTextButton,
            ],
          ),
        ),
      );

  get onLoginButtonClick => MaterialButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        ),
        textColor: Colors.white,
        color: Colors.blue,
        child: SizedBox(
          width: double.infinity,
          child: Text(
            'Login',
            textAlign: TextAlign.center,
          ),
        ),
        height: 45,
        minWidth: 600,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      );

  get getDontHaveAccountTextButton => Center(
        child: TextButton(
          child: Container(
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Don' 't have and Account ? ',
                    style: TextStyle(color: Colors.blue)),
                TextSpan(
                    text: 'SIGN UP',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue)),
              ]),
            ),
          ),
          onPressed: () {},
        ),
      );
}
