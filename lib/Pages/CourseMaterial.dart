import 'package:flutter/material.dart';
import 'commonComponents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'CourseHome.dart';
import 'videopage.dart';
import 'viewpdf.dart';
class CourseMaterial extends StatefulWidget {
  final DocumentSnapshot metadata;
  CourseMaterial({this.metadata});

  @override
  _CourseMaterialState createState() => _CourseMaterialState();
}

class _CourseMaterialState extends State<CourseMaterial> {
  Future videoData;
  Future assignment;
  Future ebook;
  final databaseReference = FirebaseFirestore.instance;

  videolist() async {
    final databaseReference = FirebaseFirestore.instance;

    QuerySnapshot query = await databaseReference
        .collection("course")
        .doc(widget.metadata.id)
        .collection("videos")
        .get();
    return query.docs;
  }
  assignmentlist() async {
    final databaseReference = FirebaseFirestore.instance;

    QuerySnapshot query = await databaseReference
        .collection("course")
        .doc(widget.metadata.id)
        .collection("Assignments")
        .get();
    return query.docs;
  }
  ebooklist() async {
    final databaseReference = FirebaseFirestore.instance;

    QuerySnapshot query = await databaseReference
        .collection("course")
        .doc(widget.metadata.id)
        .collection("books")
        .get();
    return query.docs;
  }

  void initState() {
    super.initState();
    videoData = videolist();
    print(videoData);
    assignment = assignmentlist();
    print(assignment);
    ebook=ebooklist();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appbar(context),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              banner("Dreams don't work unless you do. \n\n -Unknown",
                  "assets/dreams.jpg"),
              SizedBox(
                height: 20.0,
              ),
              heading("Topic"),
              courseBannerLayout(context, widget.metadata, false),
              SizedBox(
                height: 20.0,
              ),
              heading("Material"),
              
              urlCallMethod("Videos",videoData),

              urlCallMethod("Assignments",assignment),

              urlCallMethod("E-books", ebook)
              // urlCallMethod("Assignments",course.assignments),
              // urlCallMethod("Question Papers",course.questionPapers),
              // SizedBox(height: 40.0,),
            ],
          )),
    );
  }
}

urlCallMethod(title, material) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: ExpansionTile(
      
      title: Text(title, style: TextStyle(fontSize: 18.0)),
      
      children: [

        Container(
          height: 250.0,
          child: FutureBuilder(
              
              future: material,
              
              builder: (context, snapshot) {
                
                if (snapshot.connectionState == ConnectionState.waiting) {
                  
                  return Center(
                    child: Text("Loading..."),
                  );
                
                } else {
                 
                  return ListView.builder(
                      
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        
                        return Padding(
                          
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            
                            title: Text(snapshot.data[index].data()["title"]),
                            
                            onTap: () {
                              var _showtitlePath =
                                  snapshot.data[index].data()["url"];
                              var _showtitle = snapshot.data[index].data()["title"];
                              if(title == "Videos"){
                                
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VideoPage(_showtitlePath)));
                              }
                              if(title == "Assignments") {
                              
                                Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) =>
                                       ViewPdf(_showtitlePath,_showtitle),));
                              }
                              if(title == "E-books") {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) =>
                                       ViewPdf(_showtitlePath,_showtitle),));
                              }
                            },
                          ),
                        );
                      });
                }
              }),
        )
      ],
    ),
  );
}
