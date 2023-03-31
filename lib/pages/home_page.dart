import "package:flutter/material.dart";
import 'package:health1/pages/m_test.dart';
import 'package:health1/util/category_card.dart';
import 'package:health1/util/doctor_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Column(
        children: [
          //app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Mitch Koko",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
                // Profile picture
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.person),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          //card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(87, 249, 203, 226),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('lib/icons/doc.png'),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How do you feel?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Fill out your medical card right now",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          child: ElevatedButton(
                            child: const Text('Get Started'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const QuizApp()));
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 12,
                                backgroundColor:
                                    Color.fromARGB(255, 93, 112, 254)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.fromARGB(34, 152, 152, 250),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'How can we help you'),
              ),
            ),
          ),
          // categories:
          SizedBox(
            height: 25,
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCard(
                  categoryName: 'Yoga',
                  icon: 'lib/icons/yoga.png',
                ),
                CategoryCard(
                  categoryName: 'Surgeon',
                  icon: 'lib/icons/surgeon.png',
                ),
                CategoryCard(
                  categoryName: 'Pharmasist',
                  icon: 'lib/icons/pharma.png',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          //doctor list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Doctor list',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DoctorCard(
                  doctorpath: 'lib/images/doc1.png',
                  doctorname: 'Dr Marck',
                  rating: '5.0',
                  doctorsepicail: 'Phycologist',
                ),
                DoctorCard(
                  doctorpath: 'lib/images/doc2.png',
                  doctorname: 'Dr Juli',
                  rating: '4.8',
                  doctorsepicail: 'Phycatrist',
                ),
                DoctorCard(
                  doctorpath: 'lib/images/doc3.png',
                  doctorname: 'Dr Micky',
                  rating: '4.9',
                  doctorsepicail: 'Nuro Surgeon',
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
