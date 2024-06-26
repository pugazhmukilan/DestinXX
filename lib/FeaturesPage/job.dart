import 'package:flutter/material.dart';
import 'package:destin/Constants/firebasefunctions.dart';

class jobpage extends StatefulWidget {
  const jobpage({super.key});

  @override
  State<jobpage> createState() => _jobpageState();
}

class _jobpageState extends State<jobpage> {
  String Searchtext = '';
  bool isLoading = true;

  final List<String> items = ['HR', 'SOFTWARE ', 'TL'];
  final List<String> tags = [
    'Internship',
    'Internship',
    'Internship',
  ];
  final List<String> CompanyName = [
    'infosys,bangalore,India',
    'tcs',
    'infosys',
  ];
  final List<String> worktype = [
    'work from home',
    'work from home',
    'work from home',
  ];
  final List<String> CTC = [
    '\$15,000-\$20,000',
    '\$15,000-\$20,000',
    '\$15,000-\$20,000',
  ];
  final List<String> Date = [
    '12.05.24',
    '12.05.24',
    '12.05.24',
  ];
  final List<String> Experience = [
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
  Future<List<String>> getDetails(BuildContext context) async {
    List<String> JobNoList = await getFieldFromJob("JobName", 'job');
    print("new user name============================$JobNoList");
    List<String> CTC1List = await getFieldFromJob("CTC", 'job');
    List<String> EmailList = await getFieldFromJob("Email", 'job');
    List<String> ExperiencesList = await getFieldFromJob("Experience", 'job');
    List<String> JobLocationTypeList =
        await getFieldFromJob("JobLocationType", 'job');
    List<String> JobNameList = await getFieldFromJob("JobName", 'job');
    List<String> LocationList = await getFieldFromJob("Location", 'job');
    List<String> SkillsList = await getFieldFromJob("Skills", 'job');
    List<String> StartDateList = await getFieldFromJob("StartDate", 'job');
    List<String> TagsList = await getFieldFromJob("Tags", 'job');
    List<String> ToolsList = await getFieldFromJob("Tools", 'job');
    //String Companyna = await getFieldFromJob('ComapnyName', 'job');
    String Companyna = 'Telegram';
    for (int k = 0; k < JobNameList.length; k++) {
      setState(() {
        items.add(JobNameList[k]);
        Experience.add(ExperiencesList[k]);
        Date.add(StartDateList[k]);
        worktype.add(JobLocationTypeList[k]);
        CTC.add(CTC1List[k]);
        tags.add(TagsList[k]);
        CompanyName.add(Companyna);
      });
    }
    isLoading = false;

    return items;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController Searchtexteditor =
        TextEditingController(text: Searchtext);
    return isLoading
        ? const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: Center(child: CircularProgressIndicator())))
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.navigate_before,
                    size: 42,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: const Text(
                  'Search for Jobs',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
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
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[3],
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0, right: 5.0),
                        child: TextField(
                          //onChanged: (value) => ,
                          maxLength: null,
                          maxLines: null,
                          expands:
                              true, //The maxlength and the maxlines should be null if expeands is true
                          decoration: const InputDecoration(
                            border: InputBorder.none, // Remove default border
                            hintText: 'Search...',
                          ),
                          controller: Searchtexteditor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 180,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                border: Border.all(
                                    width: 3,
                                    color: const Color.fromARGB(
                                        255, 29, 28, 25)), // Rectangular border
                                borderRadius: BorderRadius.circular(
                                    8.0), // Border radius for rounded corners
                                // Background color
                              ),
                              margin: const EdgeInsets.all(
                                  8.0), // Margin around each item
                              padding: const EdgeInsets.all(
                                  8.0), // Padding inside the container
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
                                            const CircleAvatar(
                                              radius:
                                                  11.5, //Here we have to add the logo of the company
                                            ),
                                            const SizedBox(
                                              width: 9,
                                            ),
                                            Text(
                                              items[index],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight
                                                      .w500), // Text color
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 20,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              boxShadow: kElevationToShadow[3],
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color.fromRGBO(
                                                  255, 221, 0, 1)),
                                          child: Center(
                                            child: Text(
                                              tags[index],
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, bottom: 2),
                                      child: Text(CompanyName[index],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12)),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.work_outline_outlined,
                                          color: Color.fromARGB(
                                              255, 107, 107, 107),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 3.0),
                                          child: Text(worktype[index],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10)),
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
                                              const Icon(
                                                size: 18,
                                                Icons.calendar_month_outlined,
                                                color: Color.fromARGB(
                                                    255, 107, 107, 107),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 3.0),
                                                child: Text(Date[index],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10)),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icon_assets/Cash.png',
                                                height: 23,
                                                color: Colors.black,
                                                width: 28,
                                                fit: BoxFit.cover,
                                              ),
                                              Text(CTC[index],
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icon_assets/Business.png',
                                                height: 23,
                                                color: Colors.black,
                                                width: 30,
                                                fit: BoxFit.contain,
                                              ),
                                              Text(Experience[index],
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 7.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 80,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    maximumSize: const Size(80, 30),
                                                    minimumSize: const Size(80, 25),
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 86, 237, 59)),
                                                onPressed:
                                                    () {}, //On press rpute to the details page
                                                child: const Text(
                                                  'APPLY',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white),
                                                )),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            height: 25,
                                            width: 110,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    maximumSize: const Size(90, 30),
                                                    minimumSize: const Size(80, 25),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    backgroundColor:
                                                        Colors.orange),
                                                onPressed:
                                                    () {}, //On press rpute to the details page
                                                child: const Text(
                                                  'View Details',
                                                  style: TextStyle(
                                                      fontSize: 10,
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
