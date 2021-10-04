import 'package:e_learningapp/Pages/commonComponents.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyCourses extends StatefulWidget {
  String FullName;
  MyCourses(this.FullName);



  @override
  _MyCoursesState createState() => _MyCoursesState(FullName);
}

class _MyCoursesState extends State<MyCourses> {
  String FullName;
 _MyCoursesState(this.FullName);

 List<FavCourses> FavCourseList = [];


  @override
  void initState() {
    super.initState();

    DatabaseReference courseRef = FirebaseDatabase.instance.reference().child(FullName);

    courseRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      print(KEYS);
      FavCourseList.clear();
      FavCourses course;

      for (var individualKey in KEYS) {
        course = new FavCourses(DATA[individualKey]['CourseTitle']);
        FavCourseList.add(course);
      }

      setState(() {
        print('Length:$FavCourseList.length');
      });
    });
  }



@override
Widget build(BuildContext context) {

  return Scaffold(

    body: new Container(
      child:FavCourseList.length == 0
          ? new Text("showing available courses in a moment..",textAlign:TextAlign.center,)
          : new ListView.builder
        (
        itemCount: FavCourseList.length,
        itemBuilder: (_, index) {
          return AllCourses(

            FavCourseList[index].coursename,
          ); },
      )
      ,
    ),
  );
}
Widget AllCourses(String CourseTiltle
   ) {



  return new Container(
    margin: EdgeInsets.all(15.0),
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        color:Colors.white,
        boxShadow: [
          BoxShadow(
              color:Colors.indigo.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0,3)
          )
        ]
    ),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(CourseTiltle,style: TextStyle(color: Colors.black54,
        fontWeight: FontWeight.bold,fontSize: 16.0),),)

                  ],)

        );

}
}

class FavCourses {
  String coursename;
  FavCourses(this.coursename);
}