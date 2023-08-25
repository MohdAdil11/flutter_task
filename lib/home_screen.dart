import 'package:flutter/material.dart';
import 'package:flutter_task/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

  final snackBar = SnackBar(
    content: const Text('Sorry wrong pin'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );


  final TextEditingController pincodeController = TextEditingController();
  final String pincode = "1234";



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.withOpacity(.30),
        title: const Center(child: Text('Login Screen')),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            TextField(
              controller: pincodeController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffE7D8F8).withOpacity(.30),
                hintText: 'Enter the pin code',
                hintStyle: const TextStyle(color: Color(0xffA9A9B1)),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE7D8F8), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE7D8F8), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  pincode == pincodeController.text
                    ? Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                  ) : ScaffoldMessenger.of(context).showSnackBar(snackBar);

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff9163D7).withOpacity(.50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                ),
                child: const Text('Login',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
