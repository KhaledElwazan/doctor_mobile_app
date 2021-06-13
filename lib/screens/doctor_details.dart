import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_4/models/doctor.dart';
import 'dart:core';

class DoctorDetails extends StatefulWidget {
  Doctor doctor;

  DoctorDetails(this.doctor);

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      bottomNavigationBar: bottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Container(
              width: 0.8 * MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  drCard(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 2
                    ,
                    color: Colors.grey[350],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Short Description',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 15),
                  Text(widget.doctor.shortDescription +
                      widget.doctor.shortDescription +
                      widget.doctor.shortDescription +
                      widget.doctor.shortDescription +
                      widget.doctor.shortDescription +
                      widget.doctor.shortDescription,style: TextStyle(color: Colors.blueGrey[600],fontSize: 12,wordSpacing: 2,height: 1.7,fontWeight: FontWeight.w300)),
                  SizedBox(height: 55),
                  Text(
                    'Location',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,color: Colors.blueGrey[200],size: 20,),
                      Text(widget.doctor.address,style: TextStyle(color: Colors.blueGrey[600],fontSize: 12,wordSpacing: 2,height: 1.7,fontWeight: FontWeight.w300))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/map.jpg",
                    width: 300,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text('Request',style: TextStyle(color: Colors.white,fontSize: 18),),
                      color: Color(0xff07da5f),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItem,
      onTap: (index) {
        setState(() {
          _selectedItem = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_important_sharp),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
  Widget drCard() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(00),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(00.0),
              child: CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage(widget.doctor.urlPhoto),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 80,
              child: Column(
                children: [
                  Text(widget.doctor.name, style: TextStyle(fontSize: 20)),
                  RichText(
                    text: new TextSpan(
                      text: widget.doctor.speciality,
                      style: TextStyle(color: Color(0xff07da5f), fontSize: 18),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => print('Tap Here onTap')
                      //TODO go to specialization screen
                      ,
                    ),
                  ),
                  Row(
                    children: generateStars(widget.doctor.rating),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> generateStars(double stars) {
    int dr_stars = stars.round();
    print(dr_stars);
    final total_stars = 5;
    List<Widget> a = [];
    for (int i = 0; i < dr_stars; i++) {
      a.add(_starIcon(true));
    }
    for (int i = 0; i < total_stars - dr_stars; i++) {
      a.add(_starIcon(false));
    }
    a.add(SizedBox(
      width: 15,
    ));
    a.add(Text(
      stars.toString(),
      style: TextStyle(fontSize: 18, color: Color(0x770000000)),
    ));
    return a;
    // return ListView.builder(
    //   itemCount: total_stars,
    //     itemBuilder: (context, index) {
    //       return starIcon(
    //         yellow: index<dr_stars,
    //       );
    //     },);
  }

  Widget _starIcon(bool yellow) {
    return Icon(
      Icons.star,
      color: Color(yellow ? 0xffffd500 : 0xfffffff),
    );
  }
}

// Row(
//   children: [
//     // Image.asset('assets/images/1.jpg'),
//     Padding(
//       // padding: const EdgeInsets.all(30.0),
//       padding: const EdgeInsets.only(left: 20,top: 20),
//       child: CircleAvatar(
//         // child: Image.asset('assets/images/1.jpg'),
//         backgroundImage: AssetImage(doctor.urlPhoto),
//         radius: 65,
//       ),
//     ),
//     Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text(
//               doctor.name,
//               style: TextStyle(
//                 fontSize: 22,
//               ),
//             ),
//             // Icon(
//             //   Icons.star,
//             //   color: Color(0xffffd500),
//             // ),
//             // Text(
//             //   '4.9',
//             //   style:
//             //       TextStyle(fontSize: 18, color: Color(0x770000000)),
//             // )
//           ],
//         ),
//         Text(
//           doctor.speciality,
//           style: TextStyle(
//               color: Color(0xff07da5f),
//               fontSize: 20,
//               fontStyle: FontStyle.italic),
//         ),
//       ],
//     )
//   ],
// ),
