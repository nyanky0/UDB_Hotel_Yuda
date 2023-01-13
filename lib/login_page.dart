import 'package:flutter/material.dart';
import 'package:udb_hotel_yuda/travelapp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: const [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.deepPurpleAccent,
              Colors.purpleAccent,
              Colors.grey.shade50,
              Colors.white30,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            // Text(
            //   'UDB',
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 32,
            //       color: Colors.black,
            //       height: 2),
            // ),
            // SizedBox(
            //   height: 0.1,
            // ),
            // Text(
            //   'TRAVEL',
            //   style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 28,
            //       color: Colors.black,
            //       height: 1),
            // ),
            const SizedBox(
              height: 50,
            ),
            Image.asset('lg.png', height: 200),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  hintText: 'Masukkan username',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Masukkan password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (userNameController.text == 'admin' &&
                      passwordController.text == 'admin') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Login berhasil'),
                    ));

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnBoardPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username atau Password salah'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text('LOG IN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
