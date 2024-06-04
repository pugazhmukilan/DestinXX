import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Callapi {
//  Future<List<dynamic>> fetchData(List<String> questions, List<String> answers, Function(bool) setLoading) async {
//     setLoading(true); // Set loading indicator to true before fetching data
//     try {
//       if (questions.length >= 7) {
//         print("QUESTIONS=============\n ${questions}");
//         print("ANSWERS===============\n ${answers}");
//         var url = 'https://karthiksagar.us-east-1.modelbit.com/v1/predict/latest';
//         var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
//         var body = {
//           'Question1': questions[0],
//           'Answer1': answers[0],
//           'Question2': questions[1],
//           'Answer2': answers[1],
//           'Question3': questions[2],
//           'Answer3': answers[2],
//           'Question4': questions[3],
//           'Answer4': answers[3],
//           'Question5': questions[4],
//           'Answer5': answers[4],
//           'Question6': questions[5],
//           'Answer6': answers[5],
//           'Question7': questions[6],
//           'Answer7': answers[6],
//         };

//         var response = await http.post(Uri.parse(url), body: body);

//         if (response.statusCode == 200) {
//           print(calculate_overallscore(jsonDecode(response.body)));

//           setLoading(false); // Set loading indicator to false after data is fetched

//           return jsonDecode(response.body);
//         } else {
//           print('Request failed with status: ${response.statusCode}');
//           setLoading(false); // Set loading indicator to false if request fails
//           return jsonDecode(response.body);
//         }
//       } else {
//         print('Not enough questions provided.');
//         setLoading(false); // Set loading indicator to false if there are not enough questions
//         return [];
//       }
//     } catch (e) {
//       setLoading(false); // Set loading indicator to false if an exception occurs
//       return [];
//     }
//   }

//   double calculate_overallscore(List<dynamic> result) {
//     double score = 0;
//     for (int i = 0; i < result.length; i++) {
//       score = score + result[i]['Similarity'];
//     }
//     try{
//     score = score / result.length.toDouble();}
//     catch (e){
//       score = 0;
//     }
//     print("===========================AVERGAE SCORE IS +++++++ ${score}");
//     return score;
//   }

// }

  Future<void> writeDataToFile(Map<String, dynamic> data) async {
    // Convert the map data to a JSON string
    String jsonString = json.encode(data);

    // Get the current directory
    String currentDirectory = Directory.current.path;

    // Construct the file path for "report_analysis.json" in the current directory
    String filePath = '$currentDirectory/report_analysis.json';

    // Create a new file
    File file = File(filePath);

    try {
      // Open the file for writing (create if not exists)
      IOSink sink = file.openWrite(mode: FileMode.write);

      // Write the JSON data to the file
      sink.write(jsonString);

      // Close the file
      await sink.close();
      print('Data written to file successfully: $filePath');
    } catch (e) {
      print('Error writing data to file: $e');
    }
  }

  Future fetchData(List<String> questions, List<String> answers,
      Function(bool) setLoading) async {
    setLoading(true); // Set loading indicator to true before fetching data

    try {
      final response = await http.post(
        Uri.parse(
            'https://karthiksagar.us-east-1.modelbit.com/v1/predict/latest'),
        body: json.encode({
          'data': [
            questions[0],
            answers[0],
            questions[1],
            answers[1],
            questions[2],
            answers[2],
            questions[3],
            answers[3],
            questions[4],
            answers[4],
            questions[5],
            answers[5],
            questions[6],
            answers[6],
          ]
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        print("${response.statusCode}");
        print(decodedResponse.runtimeType);
        print(decodedResponse);
        //print(calculateOverallScore(decodedResponse));
        return decodedResponse;
      } else {
        print('Request failed with status: ${response.statusCode}');
        setLoading(false); // Set loading indicator to false if request fails
        return [];
      }
    } catch (e) {
      print('Exception during API call: $e');
      setLoading(false); // Set loading indicator to false if exception occurs
      return [];
    }
  }

  double calculateOverallScore(Map<String, dynamic> result) {
    double score = 0;
    if (result is List) {
      for (int i = 0; i < result.length; i++) {
        if (result[i] is Map<String, dynamic> &&
            result[i].containsKey('Similarity')) {
          score += result[i]['Similarity'] as double;
        }
      }
      if (result.isNotEmpty) {
        score /= result.length;
      }
    }
    print("===========================AVERAGE SCORE IS +++++++ $score");
    return score;
  }
}
















/*Future<List<dynamic>> fetchData(List <String> questions,List<String> answers) async {
  
    print("hi");
  var url = 'https://modeldeploy-prgrybkmta-el.a.run.app/submit';
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var body = {
    'Question1': 'What is Object-Oriented Programming (OOP)?',
    'Answer1':
        'Object-Oriented Programming (OOP) is a programming paradigm based on the concept of objects, which can contain data in the form of fields and code in the form of procedures. It allows for the organization of code into reusable components and promotes concepts such as encapsulation, inheritance, and polymorphism.',
    'Question2':
        'Explain the difference between abstract class and interface in Java.',
    'Answer2':
        'An abstract class in Java is a class that cannot be instantiated and may contain abstract methods, concrete methods, or both. It can also have instance variables. An interface, on the other hand, is a reference type similar to a class but can only contain abstract methods, constants, and default methods. Classes can implement multiple interfaces but can only inherit from one abstract class.',
    'Question3': 'What is the significance of the keyword "static" in Java?',
    'Answer3':
        'In Java, the "static" keyword is used to create variables and methods that belong to the class rather than instances of the class. Static variables are shared among all instances of the class, while static methods can be called without creating an instance of the class. Static methods cannot access non-static variables or methods directly.',
    'Question4': 'How does exception handling work in Java?',
    'Answer4':
        'Exception handling in Java allows programmers to handle errors and unexpected situations gracefully. It involves using try, catch, and finally blocks to handle exceptions. When an exception occurs within the try block, it is caught by the corresponding catch block, where appropriate actions can be taken. The finally block is used to execute code that should always run, regardless of whether an exception occurred.',
    'Question5': 'What is the difference between process and thread?',
    'Answer5':
        'In Java, a process is an independent unit of execution that has its own memory space and resources. It is managed by the operating system. On the other hand, a thread is a lightweight unit of execution within a process. Threads share the same memory space and resources as the process and can communicate with each other more efficiently than processes. Threads are managed by the Java Virtual Machine (JVM).',
    'Question6': 'Explain the concept of a database transaction.',
    'Answer6':
        'A database transaction is a unit of work performed against a database management system (DBMS) that is treated as a single, indivisible operation. It consists of one or more SQL statements that are executed as a single unit. The transaction ensures the atomicity, consistency, isolation, and durability (ACID) properties of the database. Transactions are used to maintain data integrity and recoverability in databases.',
    'Question7': 'What is RESTful web services?',
    'Answer7':
        'RESTful web services are a type of web service that adhere to the principles of Representational State Transfer (REST). They use standard HTTP methods such as GET, POST, PUT, DELETE to perform CRUD (Create, Read, Update, Delete) operations on resources. RESTful APIs are stateless, scalable, and platform-independent, making them ideal for building distributed systems and web applications.'
  };

  var response = await http.post(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode == 200) {
    // Request successful, do something with the response.
    print('Response: ${response.body}');
    return jsonDecode(response.body);
  } else {
    // Request failed, handle error.
    print('Request failed with status: ${response.statusCode}');
    return jsonDecode(response.body);
  }
  
}*/


// var body = {
//            questions[0],
//           answers[0],
//            questions[1],
//            answers[1],
//            questions[2],
//            answers[2],
//            questions[3],
//          answers[3],
//            questions[4],
//            answers[4],
//            questions[5],
//            answers[5],
//            questions[6],
//            answers[6],
//         };