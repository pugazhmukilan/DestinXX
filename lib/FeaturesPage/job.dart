import 'package:flutter/material.dart';
import 'package:destin/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:destin/Constants/firebasefunctions.dart';

class jobpage extends StatefulWidget {
  const jobpage({super.key});

  @override
  State<jobpage> createState() => _jobpageState();
}

class _jobpageState extends State<jobpage> {
  String Searchtext = '';

  final List<String> items = ['Designer', 'HR', 'SOFTWARE ENGINEER', 'TL'];
  final List<String> tags = [
    'Internship',
    'Internship',
    'Internship',
    'Internship',
  ];
  final List<String> CompanyName = [
    'infosys,bangalore,India',
    'infotech',
    'tcs',
    'infosys',
  ];
  final List<String> worktype = [
    'work from home',
    'work from home',
    'work from home',
    'work from home',
  ];
  final List<String> CTC = [
    '\$15,000-\$20,000',
    '\$15,000-\$20,000',
    '\$15,000-\$20,000',
    '\$15,000-\$20,000',
  ];
  final List<String> Date = [
    '12.05.24',
    '12.05.24',
    '12.05.24',
    '12.05.24',
  ];
  final List<String> Experience = [
    '2years',
    '2years',
    '2years',
    '2years',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getDetails(context);
    });
  }

  @override
  Future<String> getDetails(BuildContext context) async {
    String JobNo = await getFieldFromUserDocument("JobName");
    print("new user name============================$JobNo");
    String CTC1 = await getFieldFromUserDocument("CTC");
    String Email = await getFieldFromUserDocument("Email");
    String Experiences = await getFieldFromUserDocument("Experience");
    String JobLocationType = await getFieldFromUserDocument("JobLocationType");
    String JobName = await getFieldFromUserDocument("JobName");
    String Location = await getFieldFromUserDocument("Location");
    String Skills = await getFieldFromUserDocument("Skills");
    String StartDate = await getFieldFromUserDocument("StartDate");
    String Tags = await getUrlFromUserDocument("Tags");
    String Tools = await getUrlFromUserDocument("Tools");
    String Companyna = await getFieldFromCompany('ComapnyName');
    items.add(JobName);
    Experience.add(Experiences);
    Date.add(StartDate);
    CTC.add(CTC1);
    worktype.add(JobLocationType);
    CompanyName.add(Companyna);
    tags.add(Tags);
    return Companyna;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController Searchtexteditor =
        TextEditingController(text: Searchtext);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.navigate_before,
              size: 42,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Search for Your Jobs',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 10, right: 10, bottom: 15),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 5.0),
                  child: TextField(
                    //onChanged: (value) => ,
                    maxLength: null,
                    maxLines: null,
                    expands:
                        true, //The maxlength and the maxlines should be null if expeands is true
                    decoration: InputDecoration(
                      border: InputBorder.none, // Remove default border
                      hintText: 'Search...',
                    ),
                    controller: Searchtexteditor,
                  ),
                ),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[3],
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 247, 243, 1),
                          border: Border.all(
                              width: 2,
                              color: Color.fromARGB(
                                  255, 176, 84, 19)), // Rectangular border
                          borderRadius: BorderRadius.circular(
                              8.0), // Border radius for rounded corners
                          // Background color
                        ),
                        margin: EdgeInsets.all(8.0), // Margin around each item
                        padding:
                            EdgeInsets.all(8.0), // Padding inside the container
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        radius:
                                            16.5, //Here we have to add the logo of the company
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Text(
                                        items[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight:
                                                FontWeight.w500), // Text color
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text(
                                        tags[index],
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ),
                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        boxShadow: kElevationToShadow[3],
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromRGBO(255, 169, 119, 1)),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 1.0, left: 40, bottom: 2),
                                child: Text(CompanyName[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.work_outline_outlined,
                                    color: const Color.fromARGB(
                                        255, 107, 107, 107),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: Text(worktype[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14)),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          color: const Color.fromARGB(
                                              255, 107, 107, 107),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 3.0),
                                          child: Text(Date[index],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icon_assets/Cash.png',
                                          height: 25,
                                          color: Colors.black,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        Text(CTC[index],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icon_assets/Business.png',
                                          height: 25,
                                          color: Colors.black,
                                          width: 40,
                                          fit: BoxFit.contain,
                                        ),
                                        Text(Experience[index],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 120,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 86, 237, 59)),
                                          onPressed:
                                              () {}, //On press rpute to the details page
                                          child: Text(
                                            'APPLY',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 120,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              backgroundColor: Colors.orange),
                                          onPressed:
                                              () {}, //On press rpute to the details page
                                          child: Text(
                                            'View Details',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
/* ListTile(
                  title: Text(
                    items[index],
                    style: TextStyle(color: Colors.black), // Text color
                  ),
                  subtitle: Text('Infosys,bangalore'),
                  leading: CircleAvatar(
                    // Image
                    radius: 16.5,
                  ),
                  onTap: () {
                    // Do something when the item is tapped
                    print('Tapped on ${items[index]}');
                  },
                ),*/
