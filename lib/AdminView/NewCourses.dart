//import 'dart:js';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Courses.dart';
import 'PhotoUpload.dart';


class AdminView extends StatefulWidget{
  @override
  _AdminViewState createState()=>_AdminViewState();

}
class _AdminViewState extends State<AdminView> {

  List<Courses> CourseList = [];


  @override
  void initState() {
    super.initState();

    DatabaseReference courseRef = FirebaseDatabase.instance.reference().child(
        "Posts");

    courseRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      CourseList.clear();
      Courses course;

      print(KEYS);

      for (var individualKey in KEYS) {
        course = new Courses
          (DATA[individualKey]['CourseTiltle'],
            DATA[individualKey]['Duration'],
            DATA[individualKey]['Image'],
            DATA[individualKey]['Instructor'],
            DATA[individualKey]['Ratings'],
            DATA[individualKey]['AboutCourse'],
            DATA[individualKey]['date'],
            DATA[individualKey]['time']

        );
        print(DATA[individualKey]['CourseTiltle']);
        print(DATA[individualKey]['AboutCourse']);

        CourseList.add(course);
      }

      setState(() {
        print('Length:$CourseList.length');
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: new Container(
        child:CourseList.length == 0
            ? new Text("you are offline :(",textAlign:TextAlign.center,)
            : new ListView.builder
          (
          itemCount: CourseList.length,
          itemBuilder: (_, index) {
            return AllCourses(

              CourseList[index].CourseTiltle,
              CourseList[index].Duration,
              CourseList[index].Img,
              CourseList[index].Instructor,
              CourseList[index].Ratings,
              CourseList[index].AboutCourse,
              CourseList[index].date,
              CourseList[index].time,);
          },
        )
        ,
      ),
      bottomNavigationBar: new BottomAppBar(
          color: Colors.indigo,

          child: new Container(
              margin: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,


                children: <Widget>[

                  new IconButton(
                    icon: new Icon(Icons.image),
                    iconSize: 35,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return new PhotoUpload();
                          }));
                    },)
                ],
              )
          )
      ),


    );
  }
  Widget AllCourses(String CourseTiltle, String Duration,String Img,String Instructor,
      String Ratings, String AboutCourse,String date,
      String time) {

    print(Img);
    print(CourseTiltle);
    print(AboutCourse);

    //print("inside all courses");
    return new Container(
      //elevation: 12.0,
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
            child: new FittedBox(
              child: Material(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Container(
                        width: 160,
                        height: 160,
                        child: ClipRRect(
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            image: NetworkImage(Img),
                          ),),),

                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 1.0),
                          child: myDetailsContainer(CourseTiltle,Instructor,Duration,Ratings,AboutCourse,context,Img),
                        ),
                      ),
                    ],)
              ),
            ),
          )
        ],
      ),
    );
  }
}
Widget myDetailsContainer(String CourseTitle,String Instructor,String Duration,String Ratings,
    String AboutCourse,BuildContext context,String Img) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: <Widget>[

        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: Container(child: Text(CourseTitle,
            style: TextStyle(color: Colors.black87, fontSize: 17.0,fontWeight: FontWeight.bold),)),
        ),
        Container(
            padding:EdgeInsets.only(right: 8.0,left: 10.0),
            alignment: Alignment.centerRight,
            child: Text("Instructor: "+Instructor,
              style: TextStyle(color: Colors.black54, fontSize: 17.0,),)),
        Container(child: Text("Duration : "+Duration,
          style: TextStyle(color: Colors.black54, fontSize: 17.0,),)),
        //Container(child: Text("Ratings : "+Ratings,
         // style: TextStyle(color: Colors.black54, fontSize: 17.0,),)),
        SizedBox(height: 15.0,),
        Container(
          alignment: Alignment.center,

          child:RaisedButton(
              elevation: 10.0,
              child: Text('Go To Course'),
              textColor: Colors.white,
              color: Colors.indigo,
              onPressed: ()
              {
              }


          ),),]
  );
}








