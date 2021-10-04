import 'package:e_learningapp/Pages/Enrollment.dart';
import 'package:e_learningapp/modal/myCourses.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Courses.dart';
import 'PhotoUpload.dart';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState()=>_HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen> {

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
            ? new Text("showing available courses in a moment..",textAlign:TextAlign.center,)
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
    );
  }
    Widget AllCourses(String CourseTiltle, String Duration,String Img,String Instructor,
        String Ratings, String AboutCourse,String date,
        String time) {

    print(Img);
    print(CourseTiltle);
    print(AboutCourse);

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
        SizedBox(height: 15.0,),

        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: Container(child: Text(CourseTitle,
            style: TextStyle(color: Colors.black87, fontSize: 17.0,fontWeight: FontWeight.bold),)),
        ),
        SizedBox(height: 3.0,),
         Container(
             padding:EdgeInsets.only(right: 8.0,left: 10.0),
             alignment: Alignment.centerRight,
             child: Text("Instructor: "+Instructor,
            style: TextStyle(color: Colors.black54, fontSize: 17.0,),)),
        SizedBox(height: 1.0,),
        Container(child: Text("Duration : "+Duration,
            style: TextStyle(color: Colors.black54, fontSize: 17.0,),)),
        SizedBox(height: 8.0,),
        Container(
            alignment: Alignment.center,

            child:RaisedButton(
              elevation: 13.0,

              child: Text('Go To Course'),
              textColor: Colors.white,
              color: Color(0xff5808e5),
              onPressed: ()
    {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
        _HomeScreen( AboutCourse,CourseTitle,Instructor,Img,Ratings)));
    }


            ),),]
    );
  }

class _HomeScreen extends StatelessWidget {

  String AboutCourse,CourseTitle,Instructor,Img,Ratings;

  BuildContext context;
  _HomeScreen(this.AboutCourse,this.CourseTitle,this.Instructor,this.Img,this.Ratings);


  //_HomeScreen({this.AboutCourse});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(CourseTitle),
        backgroundColor: Color(0xff5808e5),

      ),
      body: Column(
          children: <Widget>[
            SizedBox(height: 20,),

            Container(
              width: 460,
              height: 160,
              child: ClipRRect(
                child: Image(
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  image: NetworkImage(Img),
                ),),
            ),
            SizedBox(height: 25.0,),
            Container(
                child: new FittedBox(
        child: Material(
        color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 50.0,
            padding: EdgeInsets.only(left:0.0,top:30.0,right: 40.0),
            child: Text("About Course:",
                style: TextStyle( fontWeight: FontWeight.bold
                    ,fontSize: 15.0,color: Colors.black87))
        ),
                  Container(
                    height: 50.0,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(left:44.0,top:10.0,),
                    child: RaisedButton
                      (
                      color: Color(0xff5808e5),
                      elevation: 14.0,
                      child: Text('Enroll'),
                      textColor: Colors.white,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EnrollPage(CourseTitle)));
                       //print(CourseTitle,Img)
                      },

                    ),
                  ),])))),
          SizedBox(height: 20,),
            Container(
               height: 180.0,
              margin: EdgeInsets.only(left:15.0,right: 15.0),
              decoration: BoxDecoration(
                  color:Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color:Colors.indigo.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0,3)
                    )
                  ]
              ),
              padding: EdgeInsets.only(right: 25,left: 25,top: 10.0),
              child: Text(AboutCourse,
                  style: TextStyle(color: Colors.black54,fontSize: 14.0))
          ),
            SizedBox(
                height: 20.0,
              ),
            Container(
              height: 20.0,
              width: 450.0,
              padding: EdgeInsets.only(left: 10.0),
              margin: EdgeInsets.only(right: 20,left: 20),
              child: Text("Instructor Info:",
                  style: TextStyle(color: Colors.black87,fontSize: 14.0,fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              height:80.0,
              width: 450.0,
              margin: EdgeInsets.only(right: 20,left: 20),
              padding: EdgeInsets.only(left:20.0,top:7.0),
             // color: Colors.black54,
              decoration: BoxDecoration(
                  color:Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color:Colors.indigo.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0,3)
                    )
                  ]
              ),
              child: Text(Instructor+" : "+Ratings,style: TextStyle(color: Colors.black54,fontSize: 14.0),),
            )

                ]
      )
    ,);
  }




 // }


}








