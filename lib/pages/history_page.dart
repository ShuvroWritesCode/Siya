
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siya/constants.dart';
import 'package:siya/model/DoctorInfo.dart';

// const kPrimaryColor = Color(0xFF53AFE4);
// const kTextPrimaryColor = Color(0xFF22252A);
// const kTextSecondaryColor = Color(0xFF7F8793);
// const kBackgroundColor = Color(0xFFF8F8F8);
// const kLightAsh = Color(0xFFB8B8B8);
// const kBluePrimary = Color(0xFF0A8ED9);

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  List<DoctorInfo> searchItems = [
    DoctorInfo(
        doctorName: 'Masud Ahmed',
        location: 'Dhanmondi, Dhaka',
        timing: '10-12pm',
        fee: 550,
    specialization: 'Eye'),
    DoctorInfo(
        doctorName: 'Shoyeb Haque',
        location: 'Uttara, Dhaka',
        timing: '5-7:30pm',
        fee: 450,
        specialization: 'Rheumatology'),
    DoctorInfo(
        doctorName: 'Md. Abu Shuvro',
        location: 'Mirpur, Dhaka',
        timing: '10-12am',
        fee: 650,
        specialization: 'Cardiac'),
    DoctorInfo(
        doctorName: 'Ridun',
        location: 'Mohammadpur, Dhaka',
        timing: '3-7pm',
        fee: 550,
        specialization: 'Gastrology'),
    DoctorInfo(
        doctorName: 'Mahfuz Abrar',
        location: 'Mirpur, Dhaka',
        timing: '6-7pm',
        fee: 550,
        specialization: 'ENT'),
  ];

  List<DoctorInfo> foundItems = [];

  List<String> categories = [
    'Gastrology',
    'ENT',
    '6-7pm',
    'Rheumatology',
    'Cardiac',
  ];

  // List<String> bedrooms = [
  //   'Any',
  //   '1',
  //   '2',
  //   '3',
  // ];
  //
  // List<String> bathrooms = [
  //   'Any',
  //   '1',
  //   '2',
  //   '3',
  // ];

  String selectedCategory = 'Gastrology';
  String selectedBedrooms = 'Any';
  String selectedBathrooms = 'Any';

  @override
  void initState() {
    super.initState();
    foundItems = searchItems;
  }

  void showSearchResults(String enteredValue) {
    List<DoctorInfo> results = [];

    if (enteredValue.isNotEmpty) {
      results = searchItems
          .where((item) =>
          item.doctorName.toLowerCase().contains(enteredValue.toLowerCase()))
          .toList();
    } else {
      results = searchItems;
    }

    setState(() {
      foundItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: buildSearchBar(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 0.04 * screenWidth,
                  vertical: 0.01 * screenHeight),
              height: 0.05 * screenHeight,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        if (selectedCategory != categories[index]) {
                          selectedCategory = categories[index];
                        }
                      });
                    },
                    child: Container(
                      // padding: EdgeInsets.symmetric(horizontal:0.05*screenWidth),
                      margin: EdgeInsets.all(0.01 * screenWidth),
                      child: Container(
                        // height: 0.18*screenHeight,
                        // width: 0.9*screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(0.03 * screenWidth)),
                          color: categories[index] == selectedCategory
                              ? kGreenSecondaryColor
                              : Color(0xFFFFFFFF),
                        ),
                        child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.03 * screenWidth),
                              child: Text(
                                categories[index],
                                style: TextStyle(
                                    color: categories[index] == selectedCategory
                                        ? CupertinoColors.white
                                        : kTextColor),
                              ),
                            )),
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.05 * screenWidth,
                  vertical: 0.01 * screenHeight),
              child: Text(
                'Search result',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
            ),
            Expanded(
              child: foundItems.length == 0
                  ? Center(
                  child: Text(
                    'No results found',
                    style: TextStyle(fontWeight: FontWeight.w600,color: kPrimaryColor),
                  ))
                  : ListView.builder(
                itemCount: foundItems.length,
                itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 0.01 * screenHeight),
                    padding: EdgeInsets.all(0.01 * screenHeight),
                    child: Stack(
                      children: [
                        Container(
                          // height: 0.18*screenHeight,
                          // width: 0.9*screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(0.03 * screenWidth)),
                            color: Color(0xFFFFFFFF),
                          ),
                          child: ListTile(
                            contentPadding:
                            EdgeInsets.all(0.01 * screenHeight),
                            title: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 0.03 * screenWidth),
                                  height: 0.16 * screenHeight,
                                  width: 0.25 * screenWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            0.03 * screenWidth)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/doctor.jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      // mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          foundItems[index].doctorName,
                                          softWrap: false, maxLines: 2,
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColor),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      foundItems[index].location,
                                      style: TextStyle(fontSize: 14,color: kTextColor),
                                    ),
                                    SizedBox(
                                      height: 0.01 * screenHeight,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.lock_clock,
                                          size: 0.04 * screenWidth,
                                        ),
                                        Text(
                                          '${foundItems[index].timing} ',
                                          style: TextStyle(fontSize: 11,color: kGreenSecondaryColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.01 * screenHeight,
                                    ),
                                    Text(
                                      '${foundItems[index].fee} BDT / per visit',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: kPrimaryColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Icon(CupertinoIcons.heart),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin:
                          EdgeInsets.only(top: 0.025 * screenHeight),
                          padding:
                          EdgeInsets.only(left: 0.04 * screenWidth),
                          height: 0.02 * screenHeight,
                          width: 0.22 * screenWidth,
                          decoration: BoxDecoration(
                              color: Color(0xFFF09E1B),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Text(
                            "Recommended",
                            style: TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 0.011 * screenHeight),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              top: 0.025 * screenHeight * 2),
                          padding:
                          EdgeInsets.only(left: 0.04 * screenWidth),
                          height: 0.02 * screenHeight,
                          width: 0.15 * screenWidth,
                          decoration: BoxDecoration(
                              color: Color(0xFF2CAC31),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Text(
                            "Verified",
                            style: TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 0.011 * screenHeight),
                          ),
                        ),
                      ],
                    )),
                // separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 0.00001,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Container(
  // height: 0.8*screenHeight,
  // child: ListView.builder(
  // itemCount: foundItems.length,
  // shrinkWrap: true,
  // itemBuilder: (context, index) => SearchPageCard(
  // screenHeight: screenHeight,
  // screenWidth: screenWidth,
  // buildingName: foundItems[index].buildingName,
  // location: foundItems[index].location,
  // size: foundItems[index].size,
  // bedrooms: foundItems[index].bedrooms,
  // bathrooms: foundItems[index].bathrooms,
  // floor: foundItems[index].floor,
  // rent: foundItems[index].rent,
  // ),
  // ),
  // ),

  PreferredSize buildSearchBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      // child: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.centerLeft,
      //         end: Alignment.centerRight,
      //         colors: <Color>[Color(0xFF5FB4E5), Color(0xFF0A8ED9)]),
      //   ),
      child: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: kPrimaryColor,
        leading: null,
        foregroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                setState(() async {
                  Navigator.pop(context);
                });
              }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search,
                      color: kGreenSecondaryColor,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search Doctor',
                            hintStyle: TextStyle(color: kGreenSecondaryColor)),
                        style: TextStyle(color: kGreenSecondaryColor),
                        onChanged: (value) => showSearchResults(value),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          openDialog();
                        },
                        icon: const Icon(Icons.sync_alt))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // ),
    );
  }
  int fee=130;
  void openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Center(child: Text('Filter your search')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Range'),
          Slider(
            value: fee.toDouble(),
            min: 120,
            max: 240,
            onChanged: (double newVal) {
              setState(() {
                fee = newVal.round();
              });
            },
          ),
          Text('Bedrooms'),

          Text('Bathrooms'),
          Text('Price Range'),
        ],
      ),
      actions: [
        Center(
          child: TextButton(
            child: Text('Apply'),
            onPressed: (){

            },
          ),
        )
      ],
    ),
  );
}

class SearchPageCard extends StatelessWidget {
  const SearchPageCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.buildingName,
    required this.location,
    required this.size,
    required this.bedrooms,
    required this.bathrooms,
    required this.floor,
    required this.rent,
  });

  final double screenHeight;
  final double screenWidth;
  final String buildingName;
  final String location;
  final String size;
  final int bedrooms, bathrooms, floor;
  final int rent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.03 * screenWidth),
      padding: EdgeInsets.all(0.02 * screenWidth),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.03 * screenWidth)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 0.03 * screenWidth),
            height: 0.16 * screenHeight,
            width: 0.25 * screenWidth,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(0.03 * screenWidth)),
              image: DecorationImage(
                image: AssetImage('images/doctor.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    this.buildingName,
                    // softWrap: false,maxLines:2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 0.2 * screenWidth),
                  const Icon(CupertinoIcons.heart),
                ],
              ),
              Text(
                this.location,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              Text(this.size),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.bed_double,
                    size: 0.04 * screenWidth,
                  ),
                  SizedBox(
                    width: 0.01 * screenHeight,
                  ),
                  Text(
                    '${this.bedrooms} Bedrooms',
                    style: TextStyle(fontSize: 11),
                  ),
                  SizedBox(
                    width: 0.02 * screenHeight,
                  ),
                  Icon(
                    Icons.bathtub_outlined,
                    size: 0.04 * screenWidth,
                  ),
                  SizedBox(
                    width: 0.01 * screenHeight,
                  ),
                  Text(
                    '${this.bathrooms} Bathrooms',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.stairs,
                    size: 0.04 * screenWidth,
                  ),
                  Text(
                    '${this.floor} Floor',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              Text(
                '${this.rent} BDT / per month',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Container(
// margin: EdgeInsets.symmetric(
// horizontal: 0.04 * screenWidth,
// vertical: 0.01 * screenHeight),
// height: 0.05 * screenHeight,
// child: ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// itemCount: bedrooms.length,
// itemBuilder: (context, index) => InkWell(
// onTap: () {
// setState(() {
// if (selectedBedrooms != bedrooms[index]) {
// selectedBedrooms = bedrooms[index];
// }
// });
// },
// child: Container(
// // padding: EdgeInsets.symmetric(horizontal:0.05*screenWidth),
// margin: EdgeInsets.all(0.01 * screenWidth),
// child: Container(
// // height: 0.18*screenHeight,
// // width: 0.9*screenWidth,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(
// Radius.circular(0.03 * screenWidth)),
// color: bedrooms[index] == selectedBedrooms
// ? kBluePrimary
//     : Color(0xFFFFFFFF),
// ),
// child: Center(
// child: Padding(
// padding: EdgeInsets.symmetric(
// horizontal: 0.03 * screenWidth),
// child: Text(
// bedrooms[index],
// style: TextStyle(
// color: bedrooms[index] == selectedBedrooms
// ? CupertinoColors.white
//     : kTextPrimaryColor),
// ),
// )),
// ),
// ),
// )),
// ),
