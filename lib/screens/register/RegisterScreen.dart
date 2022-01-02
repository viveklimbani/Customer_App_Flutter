import 'package:customer/common/resource/Dimension.dart';
import 'package:customer/common/resource/images.dart';
import 'package:customer/common/utils/CommonWidgets.dart';
import 'package:customer/common/utils/Validator.dart';
import 'package:customer/screens/dashboard/DashboardScreen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController? fNameController;
  TextEditingController? lNameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  FocusNode? fcFirstName;
  FocusNode? fcLastName;
  FocusNode? fcEmail;
  FocusNode? fcPassword;

  int currentIndex = 0;
  int currentIndexForInnerTab = 0;

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  var _formKey = GlobalKey<FormState>();
  var validator = Validator();
  var isPasswordValid = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fcFirstName = FocusNode();
    fcLastName = FocusNode();
    fcEmail = FocusNode();
    fcPassword = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    fNameController?.dispose();
    lNameController?.dispose();
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
              getSignUpContainer
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

  get getSignUpContainer => Container(
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
                controller: fNameController,
                autofocus: false,
                validator: (value) =>
                    value!.isEmpty ? "Please enter First Name" : null,
                // onSaved: (value)=> _userName = value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                  hintText: 'First Name',
                  hintStyle: TextStyle(color: Colors.blue),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: lNameController,
                autofocus: false,
                validator: (value) =>
                    value!.isEmpty ? "Please enter Last Name" : null,
                // onSaved: (value)=> _userName = value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                  hintText: 'Last Name',
                  hintStyle: TextStyle(color: Colors.blue),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(
                height: 20.0,
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
                      borderRadius: BorderRadius.circular(20.0)),
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
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                autofocus: false,
                validator: (value) =>
                    value!.isEmpty ? "Please enter password" : null,
                // onSaved: (value)=> _userName = value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(color: Colors.blue),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              getPolicyText,
              SizedBox(
                height: 20.0,
              ),
              onSignUpButtonClick,
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      );
  get onSignUpButtonClick => MaterialButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        ),
        textColor: Colors.white,
        color: Colors.blue,
        child: SizedBox(
          width: double.infinity,
          child: Text(
            'Sign Up',
            textAlign: TextAlign.center,
          ),
        ),
        height: 45,
        minWidth: 600,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      );

  get getPolicyText => Center(
        child: TextButton(
          child: Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  Images.icSelected,
                  height: 15,
                  width: 15,
                ),
              ),
              SizedBox(
                width: 05,
              ),
              Expanded(
                flex: 1,
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'I hereby accept',
                        style: TextStyle(color: Colors.blue, fontSize: 12)),
                    TextSpan(
                        text: ' Terms and Conditions\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 14)),
                    TextSpan(
                        text: ' and have read the',
                        style: TextStyle(color: Colors.blue, fontSize: 12)),
                    TextSpan(
                        text: ' Privacy Policy.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 14)),
                  ]),
                ),
              ),
            ],
          )),
          onPressed: () {},
        ),
      );
}
