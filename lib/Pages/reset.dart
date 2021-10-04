import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginPage.dart';
import 'commonComponents.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  
  final auth = FirebaseAuth.instance;
final TextEditingController emailController = TextEditingController();
 final emailhiding=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
        title: Text("nEma"),
        backgroundColor: Color(0xff5808e5),
      ),
       resizeToAvoidBottomPadding: false,

      body:  Container(

          padding: EdgeInsets.fromLTRB(40.0, 140.0, 40.0, 0.0),

          decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/login_screen.jpg"),  
                fit: BoxFit.fill,
                )
              ),
          
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [

                Center(child: Text('Reset Password',style: TextStyle(color: Color(0xff5808e5),fontSize:30.0, fontWeight: FontWeight.w600),)),
                SizedBox(height:50),
                inputBox("E-mail Address",TextInputType.emailAddress,emailController,emailhiding),
                SizedBox(height:30),
               RaisedButton(
                 child: Text('Send Request',style: TextStyle(color: Colors.white)),
                 color: Color(0xff5808e5),
              onPressed: () {
                auth.sendPasswordResetEmail(email: emailController.text.trim());
                  Navigator.of(context).pop();
              },
              
            )
                
            ],
          ),

        ),
      
      
    );
  }
}