//import 'dart:html';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as prefix;


class  PhotoUpload extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return _PhotoUpload();
}
}

class _PhotoUpload extends State<PhotoUpload>
{
  prefix.File sampleImg;
  String myValue,url;
  final formkey=new GlobalKey<FormState>();
  TextEditingController CourseNameController=TextEditingController();
  TextEditingController InstructorController=TextEditingController();
  TextEditingController DurationController=TextEditingController();
  TextEditingController RatingsController=TextEditingController();
  TextEditingController InfoController=TextEditingController();

  get postImageRef => {goToHomePage()};

  Future getImage() async
  {
   var tempImage=await ImagePicker.pickImage(source: ImageSource.gallery,maxHeight: 150.0,maxWidth: 150.0);
   setState(() {
     sampleImg=tempImage;
   });
  }

  void UploadCourse () async
  {

    if(validateAndSave()) {
      var timeKey = new DateTime.now();
      var name=timeKey.toString();
      final StorageReference postImg = FirebaseStorage.instance.ref().child(name);

      final StorageUploadTask uploadTask = postImg.putFile(sampleImg);
      StorageTaskSnapshot takeSnap=await uploadTask.onComplete;
      var ImageUrl=await(await uploadTask.onComplete).ref.getDownloadURL();
      takeSnap.ref.getDownloadURL().then(
          (val)=>print("done:$val")
      );
       print("ImgUrl:"+ImageUrl);
      url=ImageUrl.toString();

       print("Image url="+url);
      showToast();
       goToHomePage();
       saveToDatabase(url);
    }
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
    Navigator.push(context,
    MaterialPageRoute(builder: (context){
      return new HomeScreen();
    }
    ));
  }

  void saveToDatabase(url)
  {
    var dbTimeKey=new DateTime.now();

    var formatDate=new DateFormat('MMM d,yyyy');
    var formatTime=new DateFormat('EEEE,hh:mm aaa');

    String date=formatDate.format(dbTimeKey);
    String time=formatTime.format(dbTimeKey);

    DatabaseReference ref=FirebaseDatabase.instance.reference();
    var data={
      "Image": url,
      "CourseTiltle":myValue,
      "Instructor":InstructorController.text,
      "Duration":DurationController.text,
       "Ratings":RatingsController.text,
      "AboutCourse":InfoController.text,
      "date":date,
      "time":time,
    };

   ref.child("Posts").push().set(data);
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

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title:new Text('Upload new Course'),
        centerTitle: true,
      ),
      body: new Center(
        child: sampleImg==null? Text('Select course'):enableUpload(),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: getImage,
      tooltip: 'add image and course',
      child: new Icon(Icons.add_a_photo),),
    );
  }

  Widget enableUpload()
  {
    return new Container(
        color: Colors.black26,
      padding: EdgeInsets.all(20),
      child: new Form(
          key: formkey,
          child: Column
            (
            children: <Widget>
            [
              Container(
                child:Image.file(sampleImg,height:120.0,width:140.0),
                height: 180.0,
                width: 180.0,
                color: Colors.grey,
                  padding: EdgeInsets.all(2.0),
              ),

              SizedBox(height:8.0),

              TextFormField(
                controller: CourseNameController,
                decoration: new InputDecoration(labelText: 'Course Title')
                ,

                validator: (value)
                {
                  return value.isEmpty ? 'Course name is required' :null;
                }
                ,
                onSaved: (value)
                {
                  return myValue=value;
                  }
                ,
              ),
              TextFormField(
                controller: InstructorController,
                decoration: new InputDecoration(labelText: 'Instructor Name'),
                validator: (value)
                {
                  return value.isEmpty ? 'Instructor name is required' :null;
                }
                ,),
              TextFormField(

                decoration: new InputDecoration(labelText: 'Course Duration'),

                controller: DurationController,
                validator: (value)
                {
                  return value.isEmpty ? 'Course duration is required' :null;
                }
                ,

              ),

              TextFormField(

                decoration: new InputDecoration(labelText: 'Instructor Info'),
                controller: RatingsController,
                validator: (value)
                {
                  return value.isEmpty ? 'Instructor info  is required' :null;
                }
                ,
              ),
              TextFormField(
                controller: InfoController,
                decoration: new InputDecoration(labelText: 'About Course'),
                validator: (value)
                {
                  return value.isEmpty ? ' Course info is required' :null;
                }
                ,),

             SizedBox(height:5.0),

              RaisedButton(

                elevation: 10.0,
                  child: Text('Upload Course'),
                textColor: Colors.white,
                color: Colors.indigo,

                onPressed: UploadCourse,
              )
            ]
            ,
          )
      ),
      );


  }
}