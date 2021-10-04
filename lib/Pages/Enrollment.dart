
import 'package:e_learningapp/AdminView/home_screen.dart';
import 'package:e_learningapp/Pages/CourseMaterial.dart';
import 'package:e_learningapp/Pages/verify.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
class EnrollPage extends StatefulWidget {
  String CourseTitle;
  EnrollPage(this.CourseTitle);


  @override
  _EnrollPageState createState() => _EnrollPageState(CourseTitle);
}

class _EnrollPageState extends State<EnrollPage> {
  final formkey=new GlobalKey<FormState>();
  String myValue;

  String CourseTitle;
  _EnrollPageState(this.CourseTitle);

  TextEditingController fullname=TextEditingController();
  String FullName,Email;
  final TextEditingController emailController = TextEditingController();
  //final TextEditingController fullname = TextEditingController();

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomPadding: false,

      body: Container(

        padding: EdgeInsets.fromLTRB(40.0, 140.0, 40.0, 0.0),
        color: Colors.black12,

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            Center(child: Text('Enrollment',style: TextStyle(color: Color(0xff5808e5),fontSize:35.0, fontWeight: FontWeight.w600),)),
      new Form(
        key: formkey,
        child: Column
          (
          children: <Widget>
          [
            SizedBox(height:40),
            TextFormField(
              controller: emailController,
              decoration: new InputDecoration(labelText: 'Email-id')
              ,

              validator: (value)
              {
                return value.isEmpty ? 'Email is required' :null;
              }
              ,
              onSaved: (value)
              {
                return myValue=value;
              }
              ,
            ),
            TextFormField(
              controller: fullname,
              decoration: new InputDecoration(labelText: 'Full Name'),
              validator: (value)
              {
                return value.isEmpty ? 'Name is required' :null;
              }
              ,),
            SizedBox(height:30),
            RaisedButton(
              elevation: 13.0,

              child: Text('Enroll',style:TextStyle(color: Colors.white)),
              color: Color(0xff5808e5).withOpacity(0.8),
              onPressed: saveToDatabase,

            )
          ],)),]
        ),)

      );






  }

  void showToast()
  {
    Fluttertoast.showToast
      (
        msg:'Data saved successfully in database',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 2 ,
        backgroundColor: Colors.indigo,
        textColor: Colors.white
    );
  }

  void goToHomePage()
  {
    FullName=fullname.text;
    Email=emailController.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context){
          return new CourseMaterial(CourseTitle, FullName,Email);
        }
        ));
  }

  bool validateAndSave()
  {
    final form=formkey.currentState;

    if(form.validate())
    {
      form.save();
      return true;
    }
    else
    {
      return false;
    }
  }

  void saveToDatabase()
  {
if(validateAndSave()){
      Email = emailController.text;
      FullName=fullname.text;
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var data = {
        "CourseTitle": CourseTitle,
      };
      print(Email);
     ref.child(FullName).push().set(data);
      print("Mycourse:" + CourseTitle);
      goToHomePage();}
else{
  print("went wrong");
}

  }



}
