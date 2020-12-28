import 'package:flutter/material.dart';
import 'package:flutter_app_4/models/doctor.dart';

class DoctorDetails extends StatelessWidget {
  Doctor doctor;

  DoctorDetails(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              // Image.asset('assets/images/1.jpg'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  // child: Image.asset('assets/images/1.jpg'),
                  backgroundImage: AssetImage(doctor.urlPhoto),
                  radius: 65,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        doctor.name,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      // Icon(
                      //   Icons.star,
                      //   color: Color(0xffffd500),
                      // ),
                      // Text(
                      //   '4.9',
                      //   style:
                      //       TextStyle(fontSize: 18, color: Color(0x770000000)),
                      // )
                    ],
                  ),
                  Text(
                    doctor.speciality,
                    style: TextStyle(
                        color: Color(0xff07da5f),
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
