import 'dart:math';

import 'package:flutter/material.dart';

import "Interview.dart";
import "Interview_details_Page.dart";
import "Start_interview.dart";

double screenWidth = 0;
String UserName = "";
late String UserID;
String projectName = "ProjectX";
Color Kquizlinecolor = const Color.fromARGB(255, 219, 219, 219);
Color Kbackgroundcolor = const Color.fromARGB(255, 29, 29, 29);
Color Ksidebarcolor = const Color.fromARGB(255, 29, 29, 29);
Color Kmainboard = const Color.fromARGB(255, 255, 255, 255);
Color Kblacktextcolor = const Color.fromARGB(255, 29, 29, 29);
Color Kgreycolor_dark = const Color.fromARGB(255, 161, 161, 161);
Color Kgreycolor_light = const Color.fromARGB(255, 242, 246, 249);
Color Kgreylinecolor = const Color.fromARGB(255, 194, 194, 194);
Color Kgreytextcolor = const Color.fromARGB(255, 186, 171, 171);
Color Kprogressbarbackgroundcolor = const Color.fromARGB(255, 230, 230, 230);
TextStyle Ktitletextstyle = const TextStyle(
    fontFamily: "Inter", fontSize: 30, fontWeight: FontWeight.bold);
TextStyle Kcommontextstyle = const TextStyle(
    fontFamily: "Inter", fontSize: 20, fontWeight: FontWeight.w500);
TextStyle Kresumetextstyle = const TextStyle(
    fontFamily: "Inter",
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Color.fromARGB(255, 104, 103, 103));
TextStyle Kprogressbarnumber = const TextStyle(
    fontFamily: "Inter",
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: Colors.black);
TextStyle Kreporttextstyle = const TextStyle(
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 23);
TextStyle Kquizcattext = const TextStyle(
    fontFamily: "Inter",
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 92, 92, 92));
//profile image for the user
//picking the image from the file using the some modules

BorderRadius KMyborder = BorderRadius.circular(10);

List<String> Design_questions = [
  "Explain the Singleton pattern.",
  "How does the Factory Method pattern work?",
  "What is the Observer pattern and how is it implemented?",
  "Explain the differences between composition and inheritance.",
  "How do you design a cache system?",
  "What is the purpose of the Builder pattern?",
  "Explain the Proxy pattern and its use cases.",
  "How would you design a URL shortening service?",
  "What is the Adapter pattern and when would you use it?",
  "How do you approach designing a scalable system?",
  "What is the Command pattern and where is it useful?",
  "How would you design a secure authentication system?",
  "Explain the Decorator pattern and its advantages.",
  "What are the key components of a distributed system?",
  "How do you design a file storage system?",
  "Explain the Strategy pattern and when to apply it.",
  "What is the role of a load balancer in system design?",
  "How would you design a recommendation system?",
  "Explain the Composite pattern and its application.",
  "What is the purpose of the State pattern?",
  "How do you design a messaging system?",
  "Explain the Bridge pattern and its real-world use.",
  "What are the principles of designing a RESTful API?",
  "How would you design a real-time chat application?",
  "Explain the Chain of Responsibility pattern.",
  "What is the role of a reverse proxy in system architecture?",
  "How do you design a logging and monitoring system?",
  "Explain the Template Method pattern.",
  "What is the purpose of the Command Query Responsibility Segregation (CQRS) pattern?",
  "How would you design a social network platform?",
  "Explain the Flyweight pattern and its benefits.",
  "What are the key considerations in designing a database schema?",
  "How do you design a fault-tolerant system?",
  "Explain the Memento pattern and its use cases.",
  "What is the role of a message broker in system design?",
  "How would you design a content delivery network (CDN)?",
  "Explain the Interpreter pattern and its application.",
  "What is the purpose of the Publish-Subscribe pattern?",
  "How do you design a scalable authentication system?",
  "Explain the Visitor pattern and when to use it.",
  "What are the trade-offs in designing a microservices architecture?",
  "How would you design a recommendation engine?",
  "Explain the Object Pool pattern and its advantages.",
  "What is the purpose of the Bulkhead pattern?",
  "How do you design a distributed database system?",
  "Explain the Data Access Object (DAO) pattern.",
  "What is the role of a service discovery mechanism in microservices?",
  "How would you design a video streaming service?",
  "Explain the Front Controller pattern and its implementation.",
];
List<String> Management_questions = [
  "Can you describe your management philosophy?",
  "How do you handle team conflicts?",
  "What strategies do you use for employee development?",
  "Give an example of a challenging decision you had to make as a manager.",
  "How do you ensure effective communication within your team?",
  "Describe a situation where you successfully implemented a change in processes.",
  "How do you motivate and engage your team?",
  "Can you share a leadership success story?",
  "What steps do you take to foster a positive work culture?",
  "How do you handle performance reviews and feedback?",
  "Describe your approach to goal-setting and performance metrics.",
  "Give an example of how you prioritize tasks and delegate responsibilities.",
  "How do you handle tight deadlines and high-pressure situations?",
  "Can you share a time when you had to adapt to a sudden change in business priorities?",
  "What is your strategy for talent acquisition and recruitment?",
  "Describe your experience in strategic planning and execution.",
  "How do you promote diversity and inclusion within your team?",
  "What do you consider your biggest management challenge?",
  "How do you stay updated on industry trends and best management practices?",
  "Give an example of a successful project you managed from start to finish.",
  "How do you handle difficult conversations with team members?",
  "What's your approach to fostering innovation and creativity?",
  "Can you share a time when you had to terminate an employee? How did you handle it?",
  "Describe your experience in budget management.",
  "How do you ensure a healthy work-life balance for your team?",
  "What are the most important qualities of a successful manager?",
  "How do you ensure your team aligns with the overall goals and vision of the organization?",
  "Give an example of a situation where you had to lead your team through a crisis.",
  "What strategies do you use for team building?",
  "Describe your approach to conflict resolution.",
  "How do you handle competing priorities and tight resources?",
  "Give an example of a time when you had to handle a difficult team member.",
  "How do you handle situations where your team is not meeting expectations or facing challenges?",
  "What role does mentorship play in your management style?",
  "Describe your experience in managing remote or dispersed teams.",
  "How do you handle situations where your team is not meeting expectations or facing challenges?",
  "Give an example of how you promote professional development within your team.",
  "What do you do to create a positive and inclusive work environment?",
  "How do you handle confidential information and maintain trust with your team?",
  "Describe a time when you had to lead a cross-functional team.",
  "How do you ensure your team is adaptable to changes in the business environment?",
  "Can you share a time when you had to manage a project with limited resources?",
  "Describe a situation where you had to deal with a difficult stakeholder or client.",
  "How do you ensure that your team's goals align with the organization's strategic objectives?",
  "Give an example of how you handle feedback from your team.",
  "Describe your approach to coaching and mentoring your team members.",
  "How do you balance short-term goals with long-term strategic planning?",
  "What role do metrics and KPIs play in your management strategy?",
  "Give an example of how you promote accountability within your team.",
  "How do you handle situations where your team members have conflicting priorities?",
  "Describe your experience in leading teams through change initiatives.",
];
List<String> Tech_questions = [
  "What is Object-Oriented Programming (OOP)?",
  "Explain the difference between abstract class and interface in Java.",
  "What is the significance of the keyword 'static' in Java?",
  "How does exception handling work in Java?",
  "What is the difference between process and thread?",
  "Explain the concept of a database transaction.",
  "What are RESTful web services?",
  "What is the purpose of the 'this' keyword in Java?",
  "Explain the concept of polymorphism.",
  "What is the difference between a stack and a queue?",
  "How does garbage collection work in Java?",
  "Explain the concept of dependency injection.",
  "What is the purpose of the 'super' keyword in Java?",
  "What is the difference between an inner join and an outer join in SQL?",
  "Explain the concept of design patterns.",
  "How does the Model-View-Controller (MVC) pattern work in web development?",
  "What is the purpose of the 'final' keyword in Java?",
  "Explain the difference between GET and POST HTTP methods.",
  "What is the role of a version control system like Git?",
  "How does multithreading improve application performance?",
  "What is the difference between a shallow copy and a deep copy?",
  "Explain the SOLID principles in object-oriented design.",
  "What is the significance of the 'volatile' keyword in Java?",
  "How does a hash table work?",
  "Explain the concept of Big O notation.",
  "What is the difference between a primary key and a foreign key in a database?",
  "What is the role of a package manager in software development?",
  "Explain the principles of Test-Driven Development (TDD).",
  "What is the purpose of the 'try-with-resources' statement in Java?",
  "What is the difference between a stack and a heap memory?",
  "Explain the concept of microservices architecture.",
  "What is a closure in programming languages?",
  "How does the Model-View-ViewModel (MVVM) pattern differ from the MVC pattern?",
  "What is a design pattern? Can you provide an example?",
  "How does a binary search algorithm work?",
  "Explain the concept of CORS (Cross-Origin Resource Sharing).",
  "What is the purpose of the Singleton pattern?",
  "How does HTTPS provide a secure connection over HTTP?",
  "What are the advantages of using version control systems like Git in a collaborative environment?",
  "Explain the concept of virtualization in cloud computing.",
  "What is the difference between an interface and an abstract class in C#?",
  "How does the Observer pattern work?",
  "Explain the concept of lazy loading in the context of database access.",
  "What is the purpose of the 'async' and 'await' keywords in C#?",
  "Explain the concept of a containerization platform like Docker.",
  "What is the role of a reverse proxy in web architecture?",
  "What is the difference between optimistic and pessimistic concurrency control in database management?",
  "Explain the concept of Continuous Integration (CI) and Continuous Deployment (CD).",
  "How does a cookie work in web development?",
  "What is the difference between a mutex and a semaphore?"
];
List<String> HR_question = [
  "Can you tell me a little about yourself?",
  "What made you apply for this position?",
  "How did you hear about our company?",
  "What do you know about our company?",
  "Why do you want to work here?",
  "What are your strengths and weaknesses?",
  "Describe a challenging situation you faced at work and how you handled it.",
  "How do you handle stress and pressure?",
  "Can you provide an example of a successful project you worked on?",
  "How do you prioritize your work and manage your time?",
  "What is your management style?",
  "How do you handle conflicts with colleagues?",
  "Where do you see yourself in five years?",
  "What do you consider your greatest professional achievement?",
  "How do you stay updated on industry trends and changes?",
  "Why should we hire you?",
  "What motivates you to do your best work?",
  "How do you handle feedback and criticism?",
  "Can you give an example of a time when you had to adapt to a change at work?",
  "Describe your ideal work environment.",
  "How do you handle tight deadlines?",
  "What skills do you bring to this role that make you a good fit?",
  "How do you stay organized and keep track of tasks?",
  "Can you describe a situation where you demonstrated leadership skills?",
  "How do you handle multiple priorities?",
  "What do you think is the most challenging aspect of this role?",
  "How do you ensure that your work is accurate and error-free?",
  "How do you approach building relationships with colleagues?",
  "Can you share an example of a time when you had to deal with a difficult team member?",
  "How do you contribute to a positive team environment?",
  "What are your salary expectations?",
  "How do you handle tight deadlines and stressful situations?",
  "What strategies do you use for effective communication?",
  "Can you share an experience where you had to solve a complex problem?",
  "How do you handle confidential information and sensitive situations?",
  "How do you ensure diversity and inclusion in the workplace?",
  "What are your favorite HR tools or software?",
  "How do you keep up-to-date with employment laws and regulations?",
  "Can you describe your experience with performance reviews?",
  "How do you handle employee relations issues?",
  "Can you share an example of a time when you had to mediate a conflict between employees?",
  "How do you approach recruitment and talent acquisition?",
  "What role do you think HR plays in employee development?",
  "How do you ensure a fair and unbiased recruitment process?",
  "Can you provide an example of a successful employee engagement initiative you implemented?",
  "How do you handle employee terminations or layoffs?",
  "How do you measure the success of HR programs or initiatives?",
  "Can you share an experience where you had to deal with a challenging employee situation?",
  "How do you stay current with changes in employment law?",
  "Can you share an example of a time when you had to handle a confidential employee matter?"
];

//GENERATING REANDOWM ELEMEWNT FROM THE ORIGINAL LIST TO NEW LIST
List<String> randomElementsList(List<String> inputList) {
  final random = Random();
  final shuffledList = inputList.toList()..shuffle(random); // Shuffle the list
  final uniqueElements = <String>{}; // Set to store unique elements

  // Add elements to the set until it has 10 unique elements or the list is exhausted
  for (var element in shuffledList) {
    if (uniqueElements.length < 10) {
      uniqueElements.add(element);
    } else {
      break; // No need to continue if we already have 10 unique elements
    }
  }

  return uniqueElements.toList(); // Convert the set back to a list
}

class ErrorDialog extends StatelessWidget {
  final String title;
  final String content;

  const ErrorDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Kmainboard,
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void showErrorDialog(BuildContext context, String errorMessage, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(color: Colors.red),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: const Text('OK'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
      );
    },
  );
}

void _showBottomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          child: AlertDialog(
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            buttonPadding: const EdgeInsets.all(5),
            backgroundColor: Colors.black.withOpacity(0.8),
            alignment: Alignment.bottomCenter,
            title: const Text(
              'This page is under construction',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
      );
    },
  );
}

//this dialogue box is shown when the ppl exit the interview in the middle of the interview
void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "On going interview",
          style: TextStyle(color: Colors.red),
        ),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want to leave this interview in the middle?",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              next_button_live = true;
              question_increment = 0;

              Navigator.of(context).pop();
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Interview())); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            child: const Text('Yes'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
      );
    },
  );
}

List<List<dynamic>> nestedList(BuildContext context) {
  return [
    [
      ImageFeaturesButton(
          imagepath: "assets/Page_assets/Start_Interview_Technology.png",
          operation: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Interview_details_Page(
                        type: "Technology",
                        catid: 1,
                        maintext: "TechInterview",
                        imagepath:
                            "assets/Page_assets/technology_page_main.png",
                        appbarimage: "assets/Page_assets/appbar_tech.png",
                        context_text:
                            'Elevate your tech interviews with our cutting-edge AI interview app! Seamlessly blend general questions, fundamental projects, and technical inquiries to assess candidates skills comprehensively. Revolutionize our hiring process for a tech-savvy future.')));
          }),
      'technology'
    ],
    [
      ImageFeaturesButton(
          imagepath: "assets/Page_assets/Start_Interview_Management.png",
          operation: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Interview_details_Page(
                        type: "Management",
                        catid: 1,
                        maintext: "Management",
                        imagepath:
                            "assets/Page_assets/management_page_main.png",
                        appbarimage: "assets/Page_assets/appbar_management.png",
                        context_text:
                            'Transform your management role interviews with our state-of-the-art AI interview app! Effortlessly integrate a mix of general inquiries,fundamental projects, and strategic questions to holistically evaluate candidates capabilities. Redefine your hiring approach for a leadership-driven tomorrow')));
          }),
      'management'
    ],
    [
      ImageFeaturesButton(
          imagepath: "assets/Page_assets/Start_Interview_Design.png",
          operation: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Interview_details_Page(
                        type: "Design",
                        catid: 1,
                        maintext: "Design",
                        imagepath: "assets/Page_assets/design_page_main.png",
                        appbarimage: "assets/Page_assets/appbar_design.png",
                        context_text:
                            "Revolutionize your design role interviews with our avant-garde AI interview app! Merge insightful general questions, creative projects, and design-focused inquiries to thoroughly assess candidates' abilities. Redefine your hiring process for a visually innovative future.")));
          }),
      'design'
    ],
    [
      ImageFeaturesButton(
          imagepath: "assets/Page_assets/Start_Interview_HR.png",
          operation: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const Interview_details_Page(
                        type: "HR",
                        catid: 1,
                        maintext: "HR Interview",
                        imagepath: "assets/Page_assets/hr_page_main.png",
                        appbarimage: "assets/Page_assets/appbar_hr.png",
                        context_text:
                            "Revolutionize your design role interviews with our avant-garde AI interview app! Merge insightful general questions, creative projects, and design-focused inquiries to thoroughly assess candidates' abilities. Redefine your hiring process for a visually innovative future.")));
          }),
      'hrinterview'
    ],
  ];
}

class ImageFeaturesButton extends StatelessWidget {
  late String imagepath;
  late Function() operation;
  ImageFeaturesButton({
    super.key,
    required this.imagepath,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: operation, child: Image.asset(imagepath, height: 145));
  }
}
