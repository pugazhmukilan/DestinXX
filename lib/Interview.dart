import 'package:flutter/material.dart';

import 'Home.dart';
import 'constants.dart';
import 'loadingscreen.dart';

double screenWidth = 0;
int currentIndex = 1;
FocusNode _focusNode = FocusNode();
List<List<dynamic>> mainlist = [];
TextEditingController searchcontroller = TextEditingController();

class Interview extends StatefulWidget {
  const Interview({super.key});

//TODO: implement search function for this page text file is ready
  @override
  State<Interview> createState() => _InterviewState();
}

class _InterviewState extends State<Interview> {
  @override
  void initState() {
    super.initState();
    mainlist = nestedList(context);
    print("=====================================");
    print(mainlist);
  }

  List<List<dynamic>> filteredList = [];
  //TODO: DESIGN PAGE IS COMING EXTRA SEEE TO IT THATS ALL FOR THE SEARCH FUNCTIONS
  void filterList() {
    filteredList.clear();
    for (int i = 0; i < nestedList(context).length - 1; i++) {
      if (searchcontroller.text.isEmpty) {
        mainlist.clear();
        filteredList.clear();
        filteredList = nestedList(context);
      }
      if (nestedList(context)[i][1]
          .contains(searchcontroller.text.toLowerCase())) {
        filteredList.add(nestedList(context)[i]);
        print(filteredList);
      }
    }
    setState(() {
      mainlist = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;

    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Kmainboard,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Kbackgroundcolor,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedIconTheme: const IconThemeData(size: 22),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.meeting_room_outlined), label: "Interview"),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_outlined), label: "Resume"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "Accounts"),
          ],
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(
              () {
                currentIndex = newIndex;
                print("index is equal to+++++++ $currentIndex");
                if (currentIndex == 0) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  setdetails();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Home()));
                } else if (currentIndex == 1) {
                } else if (currentIndex == 2) {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoadingPage()));
                } else if (currentIndex == 3) {
                  //THIS  PPAGE IS UNDER THE CONSTRUCTION AND BOTTOM POO BOX WILL COME
                  _showBottomAlertDialog(context);
                }
              },
            );

            shape:
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
            );
          },
        ),
        appBar: AppBar(
          backgroundColor: Kmainboard,
          automaticallyImplyLeading: false,
          title: Text("Interview", style: Ktitletextstyle),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0), // Adjust the height as needed
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onChanged: (qurey) {
                  filterList();
                },
                controller: searchcontroller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      filterList();
                    },
                    icon: const Icon(Icons.search_outlined),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 32, // Adjust according to your preference
                    minHeight: 32, // Adjust according to your preference
                  ),
                  hintText: 'Search here...',
                  hintStyle:
                      const TextStyle(fontFamily: "jetBrainsMono", fontSize: 15),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 29, 29, 29))),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    // Use mainlist[index][0] to build each item in the list
                    return mainlist[index][0];
                  },
                  childCount: mainlist.length,
                ),
              ),
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable

class FeaturesButton extends StatelessWidget {
  late Color startcolor;
  late Color endcolor;
  late String subtext;
  late String maintext;
  late String imagepath;
  late Function() operation;
  FeaturesButton({
    super.key,
    required this.startcolor,
    required this.endcolor,
    required this.subtext,
    required this.maintext,
    required this.imagepath,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: operation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
        child: Container(
          width: 400,
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [startcolor, endcolor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(20),
          ),

          //content inside the container
          child: Padding(
            //giving padding to the whole row to maintain the text properly
            padding: const EdgeInsets.fromLTRB(25, 18, 25, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subtext,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    Text(maintext,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                //container image
                Image.asset(imagepath),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showBottomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          child: AlertDialog(
            elevation: 40,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            buttonPadding: const EdgeInsets.all(5),
            backgroundColor: Colors.black.withOpacity(0.8),
            alignment: Alignment.bottomCenter,
            title: const Text(
              'This page is under construction',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 205, 23)),
            ),
          ),
        ),
      );
    },
  );
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
