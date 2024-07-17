import 'package:flutter/material.dart';
import 'package:second/components/app_drawer.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  void navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-learning platform'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Welcome to learn!',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Welcome to LearnPro, your ultimate destination for flexible, engaging, and high-quality online education. Whether you are looking to advance your career, gain new skills, or pursue personal interests, our expert-led courses are designed to meet your needs. Join our vibrant community of learners, explore a wide range of topics, and achieve your goals with LearnPro. Sign up today and start your journey to success!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 255, 253, 253),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () => navigateToLogin(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 18, 0, 66),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text('It\'s your time to learn'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
