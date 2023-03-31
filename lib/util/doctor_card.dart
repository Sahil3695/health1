import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String doctorpath;
  final String rating;
  final String doctorname;
  final String doctorsepicail;

  DoctorCard(
      {required this.doctorpath,
      required this.doctorname,
      required this.rating,
      required this.doctorsepicail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(20, 17, 119, 187),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          // picture of doctor
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Container(
                width: 150,
                height: 110,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 176, 212, 246),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(doctorpath), fit: BoxFit.contain)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 85),
                      child: Container(
                          height: 25,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[600],
                              ),
                              Text(
                                rating,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),

            // child: CircleAvatar(
            //   backgroundColor: Color.fromARGB(255, 176, 212, 246),
            //   backgroundImage: AssetImage('lib/images/doc2.png'),
            //   radius: 50,
            // ),
            // rating

            // doctors name
            SizedBox(height: 10),
            Text(
              doctorname,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            //doctors title
            SizedBox(height: 5),
            Text(doctorsepicail),
          ],
        ),
      ),
    );
  }
}
