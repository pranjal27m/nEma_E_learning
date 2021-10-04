import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'CourseHome.dart';
import 'CourseMaterial.dart';

class MyCourses extends StatefulWidget {
  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {

  Future data;
  final FirebaseAuth _auth = FirebaseAuth.instance;

   getUserCourse() async{

    final User firebaseUser = _auth.currentUser;
    List<QueryDocumentSnapshot> list = List<QueryDocumentSnapshot>();
    QuerySnapshot result = await FirebaseFirestore.instance.collection('user')
                        .where("userId", isEqualTo: firebaseUser.uid)
                        .get();
    var coursedata = result.docs[0].data();

    List<String> courseIdArray = List.from(coursedata['courseEnrolled']);
    print(courseIdArray);
    for(int i=0; i < courseIdArray.length ; i++){
      
      var _id = courseIdArray[i];
      QuerySnapshot query = await FirebaseFirestore.instance.collection("course").where("courseId", isEqualTo:_id).get();
      
      list.add(query.docs[0]);
    
    }

    print(list);
    return list;

  }

  void initState(){
    super.initState();
    data = getUserCourse();
  }

    @override
      Widget build(BuildContext context) { 

          return Container(
            
          child: FutureBuilder(
            future: data,
            builder: (context,snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              
              return Center(child: Text("Loading..."),);
            
            } else{

                  if(snapshot.data.length == 0){
                    return Text("hello");
              
                  }
                  else{
                     return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
              
                          return InkWell (
                      
                            child: courseBannerLayout(context,snapshot.data[index],false),

                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CourseMaterial(metadata: snapshot.data[index],)));
                            },

                          );


                      },
                    
                    );
                  }
            }

          }),
          );    
      }
    }
