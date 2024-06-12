import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destin/AuthenticationPages/Loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import "../constants.dart";
import "../main.dart";

fetchDocuments(String collectionname) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> collectionReference =
      firestore.collection(collectionname);
  QuerySnapshot querySnapshot = await collectionReference.get();
  List<String> documentNames = [];
  for (var doc in querySnapshot.docs) {
    documentNames.add(doc.id);
  }
  print(documentNames.join(','));
  return documentNames;
}

//This firebase function is to retrieve the fields of the job and the hackathons
Future<List<String>> getFieldFromJob(
    String fieldName, String Subcollectiona) async {
  print("=============================================$UserID");
  try {
    // Get the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    //String DocumentsName = fetchDocuments('Companynames');
    // print('$DocumentsName');
    List<String> emailAddresses = [
      'something@gmail.com',
      'google@gmail.com',
      'something@gmail.com',
      'tcs@gmail.com'
    ];

    List<DocumentReference<Map<String, dynamic>>> documentRefs = [];
    List<String> Fields = [];
    for (int i = 0; i < emailAddresses.length; i++) {
      DocumentReference<Map<String, dynamic>> documentRef1 =
          firestore.collection('Companynames').doc(emailAddresses[i]);
      documentRefs.add(documentRef1);
    }

    for (int i = 0; i < documentRefs.length; i++) {
      CollectionReference<Map<String, dynamic>> documentRef =
          documentRefs[i].collection(Subcollectiona);
      DocumentReference userDocument = documentRef.doc('Designer');

      // Get the snapshot of the user document
      DocumentSnapshot documentSnapshot = await userDocument.get();

      // Check if the document exists and contains the specified field
      if (documentSnapshot.exists && documentSnapshot.data() != null) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        // Check if the field exists in the document
        if (userData.containsKey(fieldName)) {
          dynamic fieldValue = userData[fieldName];

          print(
              'Field $fieldName retrieved from user document with ID $UserID: $fieldValue');

          Fields.add(fieldValue.toString());
          print(
              "-------------------------------------------------------------------$Fields");

          // Assuming the field value is a String
        } else {
          print(
              'Field $fieldName does not exist in user document with ID $UserID');
          print('####################################$Fields');
          return Fields;
        }
      } else {
        print('User document with ID $UserID does not exist');
        print('######################################$Fields');
        return Fields;
      }
    }

    return Fields;
// Now you have a list of DocumentReference objects
  } catch (error) {
    print('Error getting field from user document: $error');
    return [];
  }
}

//This function is to retrive the field details
Future<String> getFieldFromCompany(String fieldName) async {
  print("=============================================$UserID");
  try {
    // Get the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the "Users" collection
    CollectionReference usersCollection = firestore.collection("Companynames");

    // Reference to the specific user document
    DocumentReference userDocument = usersCollection.doc(UserID);

    // Get the snapshot of the user document
    DocumentSnapshot documentSnapshot = await userDocument.get();

    // Check if the document exists and contains the specified field
    if (documentSnapshot.exists && documentSnapshot.data() != null) {
      Map<String, dynamic> userData =
          documentSnapshot.data() as Map<String, dynamic>;

      // Check if the field exists in the document
      if (userData.containsKey(fieldName)) {
        dynamic fieldValue = userData[fieldName];

        print(
            'Field $fieldName retrieved from user document with ID $UserID: $fieldValue');
        return fieldValue.toString(); // Assuming the field value is a String
      } else {
        print(
            'Field $fieldName does not exist in user document with ID $UserID');
        return null!;
      }
    } else {
      print('User document with ID $UserID does not exist');
      return null!;
    }
  } catch (error) {
    print('Error getting field from user document: $error');
    return "";
  }
}

//this is the firebase function used for adding the details of the company created when initiated
Future<void> addfieldscompany(
    String collectionName, String userID, String userName) async {
  try {
    // Get the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the collection
    CollectionReference collectionReference =
        firestore.collection(collectionName);

    // Create a map with specified fields initialized to null
    Map<String, dynamic> data = {
      'Name': null,
      'CompanyName': null,
      'Email': null,
      'Logo': null,
      'Companyphno': null,
      'Description': null,
      'Socialmedialinnks': null,
      'Companyemail': null,
    };

    // Add the document with specified fields and user-defined document name
    await collectionReference.doc(userID).set(data);

    print(
        'Document added successfully to $collectionName with UserName: $userName');
  } catch (error) {
    print('Error adding document: $error');
  }
}
//This is the firebase function used for the adding of the new Hackathon

Future<void> createhackathon(String Companyemail, String Jobtype) async {
  // Reference to the Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Reference to the document where you want to create the collection
    final CollectionReference<Map<String, dynamic>> documentRef = firestore
        .collection('Companynames')
        .doc(Companyemail)
        .collection('hackathon');

    Map<String, dynamic> data = {
      'UserName': null,
      'DBdate': null,
      'DBmonth': null,
      'DByear': null,
      'DBintro': null,
      'DBexperience': null,
      'DBeducation': null,
      'DBskills': null,
      'DBimage': null,
      'DBlanguage': null,
      'ProfilePic': null
    };
    //Here you have to check for adding the date and timnestamp

    await documentRef.doc(Jobtype).set(
        data); //Here the set data is used for the setting of data to the documents

    print('Collection created successfully!');
  } catch (e) {
    print('Error creating collection: $e');
  }
}

//Firebase function used to add the new job
Future<void> createjob(String Companyemail, String Jobtype) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Reference to the document where you want to create the collection

    CollectionReference<Map<String, dynamic>> documentRef = firestore
        .collection('Companynames')
        .doc(Companyemail)
        .collection('job');

    Map<String, dynamic> data = {
      'JobName': "Flutter dev",
      'Email': 'something@gmail.com',
      'JobLocationType': 'Andaman',
      'CTC': '80000',
      'Skills': 'dart',
      'Experience': 'no need',
      'Location': 'mumbai',
      'Tags': 'job',
      'Tools': 'dart,vs code',
      'JobRole': 'Flutter dev',
      'StartDate': '25.07.2026'
    };
    await documentRef.doc(Jobtype).set(data);

    print('Collection created successfully!');
  } catch (e) {
    print('Error creating collection: $e');
  }
}

Future<String> getCurrentUserEmail() async {
  try {
    // Get the current user from FirebaseAuth
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is signed in
    if (user != null) {
      // Return the email of the current user
      return user.email!;
    } else {
      // User is not signed in
      print('User is not signed in.');
      // ignore: null_check_always_fails
      return null!;
    }
  } catch (error) {
    // Handle any errors that might occur
    print('Error getting current user email: $error');
    // ignore: null_check_always_fails
    return null!;
  }
}

Future<void> addDocument(
    String collectionName, String userID, String userName) async {
  try {
    // Get the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the collection
    CollectionReference collectionReference =
        firestore.collection(collectionName);

    // Create a map with specified fields initialized to null
    Map<String, dynamic> data = {
      'UserName': userName,
      'DBdate': null,
      'DBmonth': null,
      'DByear': null,
      'DBintro': null,
      'DBexperience': null,
      'DBeducation': null,
      'DBskills': null,
      'DBimage': null,
      'DBlanguage': null,
      'ProfilePic': null
    };

    // Add the document with specified fields and user-defined document name
    await collectionReference.doc(userID).set(data);

    print(
        'Document added successfully to $collectionName with UserName: $userName');
  } catch (error) {
    print('Error adding document: $error');
  }
}

Future<String> getUserName(String userID) async {
  try {
    // Reference to the Users collection
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Users');

    // Reference to the specific document using the provided UserID
    DocumentReference userDocument = usersCollection.doc(userID);

    // Get the document snapshot
    DocumentSnapshot snapshot = await userDocument.get();

    // Explicitly specify the type for snapshot.data
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    // Check if the document exists and contains the UserName field
    if (snapshot.exists && data != null && data.containsKey('UserName')) {
      // Return the value of the UserName field
      return data['UserName'];
    } else {
      print('Document or UserName field not found for UserID: $userID');
      // ignore: null_check_always_fails
      return null!;
    }
  } catch (error) {
    print('Error getting UserName: $error');
    // ignore: null_check_always_fails
    return null!;
  }
}

void signOut(BuildContext context) async {
  try {
    // Sign out from Firebase
    prefs!.remove('email');
    prefs!.remove('password');
    UserID = "";
    UserName = "";
    fetched_details = false;
    pic = "";
    await FirebaseAuth.instance.signOut();
    print("User signed out");

    // Navigate back to the previous screen
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Loginpage()));
  } catch (e) {
    print("Error signing out: $e");
    // Handle the error, if any
  }
}

Future<void> addFieldToUserDocument(String fieldName, String content) async {
  try {
    // Get the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the "Users" collection
    CollectionReference usersCollection = firestore.collection("Users");

    // Reference to the specific user document
    DocumentReference userDocument = usersCollection.doc(UserID);

    // Update the document with the new field and content
    await userDocument.update({
      fieldName: content,
    });

    print('Field $fieldName added to user document with ID $UserID');
  } catch (error) {
    print('Error adding field to user document: $error');
  }
}

Future<String> getFieldFromUserDocument(String fieldName) async {
  print("=============================================$UserID");
  try {
    // Get the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the "Users" collection
    CollectionReference usersCollection = firestore.collection("Users");

    // Reference to the specific user document
    DocumentReference userDocument = usersCollection.doc(UserID);

    // Get the snapshot of the user document
    DocumentSnapshot documentSnapshot = await userDocument.get();

    // Check if the document exists and contains the specified field
    if (documentSnapshot.exists && documentSnapshot.data() != null) {
      Map<String, dynamic> userData =
          documentSnapshot.data() as Map<String, dynamic>;

      // Check if the field exists in the document
      if (userData.containsKey(fieldName)) {
        dynamic fieldValue = userData[fieldName];

        print(
            'Field $fieldName retrieved from user document with ID $UserID: $fieldValue');
        return fieldValue.toString(); // Assuming the field value is a String
      } else {
        print(
            'Field $fieldName does not exist in user document with ID $UserID');
        return null!;
      }
    } else {
      print('User document with ID $UserID does not exist');
      return null!;
    }
  } catch (error) {
    print('Error getting field from user document: $error');
    return "";
  }
}

Future<String> getUrlFromUserDocument(String fieldName) async {
  print("=============================================$UserID");
  try {
    // Get the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the "Users" collection
    CollectionReference usersCollection = firestore.collection("Users");

    // Reference to the specific user document
    DocumentReference userDocument = usersCollection.doc(UserID);

    // Get the snapshot of the user document
    DocumentSnapshot documentSnapshot = await userDocument.get();

    // Check if the document exists and contains the specified field
    if (documentSnapshot.exists && documentSnapshot.data() != null) {
      Map<String, dynamic> userData =
          documentSnapshot.data() as Map<String, dynamic>;

      // Check if the field exists in the document
      if (userData.containsKey(fieldName)) {
        dynamic fieldValue = userData[fieldName];

        print(
            'Field $fieldName retrieved from user document with ID $UserID: $fieldValue');
        return fieldValue.toString(); // Assuming the field value is a String
      } else {
        print(
            'Field $fieldName does not exist in user document with ID $UserID');
        return null!;
      }
    } else {
      print('User document with ID $UserID does not exist');
      return null!;
    }
  } catch (error) {
    print('Error getting field from user document: $error');
    return "https://p7.hiclipart.com/preview/722/101/213/computer-icons-user-profile-circle-abstract.jpg";
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseStorage _storage = FirebaseStorage.instance;

Future<String> uploadImageToStorage(String childName, Uint8List file) async {
  Reference ref = _storage.ref().child(childName).child(_auth.currentUser!.uid);
  UploadTask uploadTask = ref.putData(file);
  TaskSnapshot snapshot = await uploadTask;

  String downloadUrl = await snapshot.ref.getDownloadURL();
  print('Download url ----------------------');
  return downloadUrl;
}

Future<String> saveData({required Uint8List file}) async {
  String resp = "Some error Occured";
  try {
    String imageUrl = await uploadImageToStorage('ProfilePic', file);

    await addFieldToUserDocument('ProfilePic', imageUrl);
  } catch (err) {
    resp = err.toString();
  }
  return resp;
}

///DELETE THE DOCUMENT  FROM THE FIRESTORE FROM THE FIREBASE
Future<void> deleteAccountAndSignOut(
    String documentId, BuildContext context) async {
  try {
    prefs!.remove('email');
    prefs!.remove('password');
    UserID = "";
    UserName = "";
    pic = "";
    // Get the reference to the document
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Users').doc(documentId);

    // Delete the document
    await documentReference.delete();

    print('Document with ID $documentId deleted successfully');

    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Delete the user's account
      await user.delete();
      print('User account deleted successfully');
    } else {
      print('No user signed in');
    }

    // Sign out after the document deletion and user account deletion are complete
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
    Navigator.pop(context);
    // Navigate to the sign-in page or perform any other action
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Loginpage()));
  } catch (e) {
    print('Error deleting document or user account: $e');
    // Handle the error appropriately, e.g., show an error message to the user
  }
}
//    Future<String> getResumeDetails( BuildContext context) async {
//     // setState(() {
//     //   Resume_detail_collecting=true;
      
//     // });
    
//     UserName = await getFieldFromUserDocument("UserName");
//     print("new user name============================$UserName");
//     Dob = await getFieldFromUserDocument("DBdob");
//     Phone = await getFieldFromUserDocument("DBphone");
//     Email = await getFieldFromUserDocument("DBemail");
//     Intro = await getFieldFromUserDocument("DBintro");
//     Skills = await getFieldFromUserDocument("DBskills");
//     Language = await getFieldFromUserDocument("DBlanguage");
//     Experience = await getFieldFromUserDocument("DBexperience");
//     Education = await getFieldFromUserDocument("DBeducation");
//     pic = await getUrlFromUserDocument("ProfilePic");
//     pic = pic;
//     // setState(() {
//     //   Resume_detail_collecting=false;
      
//     // });
//     return pic;
// }

Future<String> getResumeDetails() async {
  UserName = await getFieldFromUserDocument("UserName");
  Dob = await getFieldFromUserDocument("DBdob");
  Email = await getFieldFromUserDocument("DBemail");
  Phone = await getFieldFromUserDocument("DBphone");
  Intro = await getFieldFromUserDocument("DBintro");
  Skills = await getFieldFromUserDocument("DBskills");
  Language = await getFieldFromUserDocument("DBlanguage");
  Experience = await getFieldFromUserDocument("DBexperience");
  Education = await getFieldFromUserDocument("DBeducation");
  pic = await getUrlFromUserDocument("ProfilePic");
  return pic;
  //print(pic);
  //print(Phone);
  //print(Skills);
}

Future<String> GetAllDetails() async{
  UserID = await getCurrentUserEmail();

  UserName = await getUserName(UserID);
  Dob = await getFieldFromUserDocument("DBdob");
  Email = await getFieldFromUserDocument("DBemail");
  Phone = await getFieldFromUserDocument("DBphone");
  Intro = await getFieldFromUserDocument("DBintro");
  Skills = await getFieldFromUserDocument("DBskills");
  Language = await getFieldFromUserDocument("DBlanguage");
  Experience = await getFieldFromUserDocument("DBexperience");
  Education = await getFieldFromUserDocument("DBeducation");
  pic = await getUrlFromUserDocument("ProfilePic");
  //print everything which i ahve fetched here
  print(UserID);
  print(UserName);
    return UserID;
}