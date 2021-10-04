import 'materialModal.dart';

class AllCourse {
  final int courseId;
  final String courseName;
  final String imagePath;
  final List<UploadedByDetails> uploadedByDetails;
  final int courseDuration;
  final List<Videos> videos;
  final List<EBooks> eBooks;
  final List<Assignments> assignments;
  final List<QuestionPapers> questionPapers;



  AllCourse(
      {this.courseId,this.courseName,this.uploadedByDetails,this.imagePath,this.courseDuration,this.videos,this.eBooks,this.assignments,this.questionPapers});

static List<AllCourse> fetchAll(){
    return[
      AllCourse(
       courseId: 1,
       courseName: "Course 1",
       uploadedByDetails: [
         UploadedByDetails('Rutuja Pisalkar','M.Tech(Human Psychology)','Proffesor at GECA Aurangabad')
       ],
       imagePath: "assets/image.jpg",
       courseDuration: 10,
       videos:[
          Videos('Video-1.1','assets/videos/video-1.mp4'),
          Videos('Video-1.2','assets/videos/video-2.mp4'),
          Videos('Video-1.3','assets/videos/video-1.mp4'),
          Videos('Video-1.4','assets/videos/video-2.mp4')
        ],
        eBooks:[
          EBooks('E-book-1.1','assets/EBooks/Book-1.pdf'),
          EBooks('E-book-1.2','assets/EBooks/Book-2.pdf'),
          EBooks('E-book-1.3','assets/EBooks/Book-1.pdf'),
          EBooks('E-book-1.4','assets/EBooks/Book-2.pdf'),
        ],
        assignments:[
          Assignments('Assignment-1.1','assets/Assignments/Assignment-1.pdf'),
          Assignments('Assignment-1.2','assets/Assignments/Assignment-2.pdf'),
          Assignments('Assignment-1.3','assets/Assignments/Assignment-1.pdf'),
          Assignments('Assignment-1.4','assets/Assignments/Assignment-2.pdf'),
        ],
        questionPapers:[
          QuestionPapers('QuestionPaper-1.1','assets/QuestionPapers/Paper-1.pdf'),
          QuestionPapers('QuestionPaper-1.2','assets/QuestionPapers/Paper-2.pdf'),
          QuestionPapers('QuestionPaper-1.3','assets/QuestionPapers/Paper-1.pdf'),
          QuestionPapers('QuestionPaper-1.4','assets/QuestionPapers/Paper-2.pdf'),
        ],
      ),
      
       AllCourse(
       courseId: 2,
       courseName: "Course 2",
       uploadedByDetails: [
         UploadedByDetails('Pranjal Mahajan','M.Tech(System Software)','Proffesor at GECA Aurangabad')
       ],
       imagePath: "assets/image.jpg",
       courseDuration: 12,
       videos:[
          Videos('Video-2.1','assets/videos/video-1.mp4'),
          Videos('Video-2.2','assets/videos/video-2.mp4'),
          Videos('Video-2.3','assets/videos/video-1.mp4'),
          Videos('Video-2.4','assets/videos/video-2.mp4')
        ],
        eBooks:[
          EBooks('E-book-2.1','assets/EBooks/Book-1.pdf'),
          EBooks('E-book-2.2','assets/EBooks/Book-2.pdf'),
          EBooks('E-book-2.3','assets/EBooks/Book-1.pdf'),
          EBooks('E-book-2.4','assets/EBooks/Book-2.pdf'),
        ],
        assignments:[
          Assignments('Assignment-2.1','assets/Assignments/Assignment-1.pdf'),
          Assignments('Assignment-2.2','assets/Assignments/Assignment-2.pdf'),
          Assignments('Assignment-2.3','assets/Assignments/Assignment-1.pdf'),
          Assignments('Assignment-2.4','assets/Assignments/Assignment-2.pdf'),
        ],
        questionPapers:[
          QuestionPapers('QuestionPaper-2.1','assets/QuestionPapers/Paper-1.pdf'),
          QuestionPapers('QuestionPaper-2.2','assets/QuestionPapers/Paper-2.pdf'),
          QuestionPapers('QuestionPaper-2.3','assets/QuestionPapers/Paper-1.pdf'),
          QuestionPapers('QuestionPaper-2.4','assets/QuestionPapers/Paper-2.pdf'),
        ],
      ),

       AllCourse(
       courseId: 3,
       courseName: "Course 3",
       uploadedByDetails: [
         UploadedByDetails('Dr.Prachi Nikalje','P.H.D()','Proffesor at GECA Aurangabad')
       ],
       imagePath: "assets/image.jpg",
       courseDuration: 20,
       videos:[
          Videos('Video-3.1','assets/videos/video-1.mp4'),
          Videos('Video-3.2','assets/videos/video-2.mp4'),
          Videos('Video-3.3','assets/videos/video-1.mp4'),
          Videos('Video-3.4','assets/videos/video-2.mp4')
        ],
        eBooks:[
          EBooks('E-book-3.1','assets/EBooks/Book-1.pdf'),
          EBooks('E-book-3.2','assets/EBooks/Book-2.pdf'),
          EBooks('E-book-3.3','assets/EBooks/Book-1.pdf'),
          EBooks('E-book-3.4','assets/EBooks/Book-2.pdf'),
        ],
        assignments:[
          Assignments('Assignment-3.1','assets/Assignments/Assignment-1.pdf'),
          Assignments('Assignment-3.2','assets/Assignments/Assignment-2.pdf'),
          Assignments('Assignment-3.3','assets/Assignments/Assignment-1.pdf'),
          Assignments('Assignment-3.4','assets/Assignments/Assignment-2.pdf'),
        ],
        questionPapers:[
          QuestionPapers('QuestionPaper-3.1','assets/QuestionPapers/Paper-1.pdf'),
          QuestionPapers('QuestionPaper-3.2','assets/QuestionPapers/Paper-2.pdf'),
          QuestionPapers('QuestionPaper-3.3','assets/QuestionPapers/Paper-1.pdf'),
          QuestionPapers('QuestionPaper-3.4','assets/QuestionPapers/Paper-2.pdf'),
        ],
      ),

       AllCourse(
       courseId: 4,
       courseName: "course 4",
       uploadedByDetails: [
         UploadedByDetails('Rutuja Pisalkar','M.Tech','Proffesor at GECA Aurangabad')
       ],
       imagePath: "assets/image.jpg",
       courseDuration: 12,
       videos:[
          Videos('Video-4.1','assets/videos/video-1.mp4'),
          Videos('Video-4.2','assets/videos/video-2.mp4'),
          Videos('Video-4.3','assets/videos/video-1.mp4'),
          Videos('Video-4.4','assets/videos/video-2.mp4')
        ],
        eBooks:[
          EBooks('E-book-4.1','assets/EBooks/Book-1.pdf'),
          EBooks('E-book-4.2','assets/EBooks/Book-2.pdf'),
          EBooks('E-book-4.3','assets/EBooks/Book-1.pdf'),
          EBooks('E-book-4.4','assets/EBooks/Book-2.pdf'),
        ],
        assignments:[
          Assignments('Assignment-4.1','assets/Assignments/Assignment-1.pdf'),
          Assignments('Assignment-4.2','assets/Assignments/Assignment-2.pdf'),
          Assignments('Assignment-4.3','assets/Assignments/Assignment-1.pdf'),
          Assignments('Assignment-4.4','assets/Assignments/Assignment-2.pdf'),
        ],
        questionPapers:[
          QuestionPapers('QuestionPaper-4.1','assets/QuestionPapers/Paper-1.pdf'),
          QuestionPapers('QuestionPaper-4.2','assets/QuestionPapers/Paper-2.pdf'),
          QuestionPapers('QuestionPaper-4.3','assets/QuestionPapers/Paper-1.pdf'),
          QuestionPapers('QuestionPaper-4.4','assets/QuestionPapers/Paper-2.pdf'),
        ],
      ),

       AllCourse(
       courseId: 5,
       courseName: "Course 5",
       uploadedByDetails: [
         UploadedByDetails('Pranjal Mahajan','M.Tech','Proffesor at GECA Aurangabad')
       ],
       imagePath: "assets/image.jpg",
       courseDuration: 12,
       videos:[
          Videos('Video-5.1','assets/videos/video-1.mp4'),
          Videos('Video-5.2','assets/videos/video-2.mp4'),
          Videos('Video-5.3','assets/videos/video-1.mp4'),
          Videos('Video-5.4','assets/videos/video-2.mp4')
        ],
        eBooks:[
          EBooks('E-book-5.1','assets/EBooks/Book-1.pdf'),
          EBooks('E-book-5.2','assets/EBooks/Book-2.pdf'),
          EBooks('E-book-5.3','assets/EBooks/Book-1.pdf'),
          EBooks('E-book-5.4','assets/EBooks/Book-2.pdf'),
        ],
        assignments:[
          Assignments('Assignment-5.1','assets/Assignments/Assignment-1.pdf'),
          Assignments('Assignment-5.2','assets/Assignments/Assignment-2.pdf'),
          Assignments('Assignment-5.3','assets/Assignments/Assignment-1.pdf'),
          Assignments('Assignment-5.4','assets/Assignments/Assignment-2.pdf'),
        ],
        questionPapers:[
          QuestionPapers('QuestionPaper-5.1','assets/QuestionPapers/Paper-1.pdf'),
          QuestionPapers('QuestionPaper-5.2','assets/QuestionPapers/Paper-2.pdf'),
          QuestionPapers('QuestionPaper-5.3','assets/QuestionPapers/Paper-1.pdf'),
          QuestionPapers('QuestionPaper-5.4','assets/QuestionPapers/Paper-2.pdf'),
        ],
      ),

    ];
  }
  static AllCourse fetchByID(int courseID){
    List<AllCourse> allcourses = AllCourse.fetchAll();
    for(var i=0;i<allcourses.length;i++) {
      if(allcourses[i].courseId==courseID) {
        return allcourses[i];
      }
    }
    return null;
  }

}
