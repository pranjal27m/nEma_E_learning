import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'commonComponents.dart';

class SignupPage extends StatelessWidget {
  
  final _auth;

  SignupPage(this._auth);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passController2 = TextEditingController();
  final emailhiding=false;
  final passhiding=true;

  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text("nEma"),
            backgroundColor:Color(0xff5808e5),
  ),
       resizeToAvoidBottomPadding: false,

      body: Container(

        padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),

        decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/login_screen.jpg"),  
              fit: BoxFit.fill,
              )
            ),
        
        child: Form(

            key: _formKey,

            child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [

                Center(child: Text('Sign up',style: TextStyle(color: Color(0xff5808e5),fontSize:35.0, fontWeight: FontWeight.w600),)),
                
                SizedBox(height:40),
                
                inputBox("E-mail Address",TextInputType.emailAddress,_emailController,emailhiding),
                
                SizedBox(height:20),
                
                inputBox("Password",TextInputType.visiblePassword,_passController,passhiding),
                
                SizedBox(height:20),
                
                inputBox("Confirm Password",TextInputType.visiblePassword,_passController2,passhiding),
                
                SizedBox(height:30),
                
                RaisedButton(
                  child: Text('SignUp',style: TextStyle(color: Colors.white)),
                  color: Color(0xff5808e5),
                  onPressed: () {

                    if(_formKey.currentState.validate()){

                    _register(context);

                  }

                  },
              
            )
            ],
          ),
        ),

      ),
      
    );
  }

  void _register(BuildContext context) async{

   if(_passController2.text == _passController.text){

      try{

      final User user = (
                    await _auth.createUserWithEmailAndPassword(
                      email: _emailController.text, 
                      password: _passController.text)
                  ).user;

                  try{

                    if(user != null){
                   
                        user.sendEmailVerification().whenComplete(() {
                          _success = true;
                        _userEmail = user.email;
                        showAlertDialog(context,"Mail sent for verification.","Sucessful Registration");
                        _emailController.clear();
                        _passController.clear();
                        _passController2.clear();
                        });
                        CollectionReference collectionReference= FirebaseFirestore.instance.collection('user');
                        Map<String,dynamic> userdata ={'userId':user.uid,'userName':user.email};
                        collectionReference.add(userdata);
                        //Navigator.pushNamed(context, '/');

                      }else{

                        _success = false;
                        showAlertDialog(context,"Please check entered email id and password","Error");
                      
                      }

                  }catch(e){
                      print(e);
                  }
      print("Account created");

    } on FirebaseAuthException catch (e){

      if (e.code == 'weak-password') {
        print('The password provided is too weak or less than 6 characters long');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

    } catch (e) {
      print(e);
    }

   }else{
     showAlertDialog(context, "Confirm paswword does not match password","Error");
   }

  }
  
}
