import 'package:flutter/material.dart';
import 'package:flutter_task/api.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Future ? getData;

  @override
  void initState() {
    getData = API.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      " Error: ${snapshot.error}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.purpleAccent.withOpacity(.30),
                      title: const Center(child: Text('Home Screen')),
                    ),
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text('fund_house :'),
                                Text('scheme_type :'),
                                Text('scheme_category :'),
                                Text('scheme_code :'),
                                Text('scheme_name :'),
                              ],
                            ),
                            SizedBox(
                              height: 140,
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      snapshot.data["meta"]["fund_house"].toString()),
                                  Text(
                                      snapshot.data["meta"]["scheme_type"].toString()),
                                  Text(
                                      snapshot.data["meta"]["scheme_category"].toString()),
                                  Text(
                                      snapshot.data["meta"]["scheme_code"].toString()),
                                  Flexible(
                                    child: Text(
                                        snapshot.data["meta"]["scheme_name"].toString()),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                              onPressed: (){Navigator.pop(context);},
                              child: const Text('Log out')),
                        )
                      ],
                    )
                  );
                }
            }
          }),
    );
  }
}


