import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Colors.blue),
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  );
}

MaterialButton longButtons(String title,  Function onSubmitButton,
    {Color color: Colors.blue, Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: onSubmitButton(),
    textColor: textColor,
    color: color,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
  );
}

tabTile(String tabName, int index, Function onTabTap, int currentIndex) {
  return Expanded(
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTabTap(index),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.blue : Colors.transparent,
            borderRadius: currentIndex == 0
                ? BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
          ),
          child: Center(
            child: Text(tabName,
                style: currentIndex == index
                    ? TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white)
                    : TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey)),
          ),
        ),
      ),
    ),
  );
}
