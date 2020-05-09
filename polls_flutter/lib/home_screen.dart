import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewModels/HomeModel.dart';
import 'widgets/candidate.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Polls",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) => HomeModel(),
        child: Consumer<HomeModel>(
          builder: (context, model, child) => ListView.builder(
              itemCount: model.candidates.length,
              itemBuilder: (context, index) => CandidateWidget(
                    candidate: model.candidates[index],
                  )),
        ),
      ),
    );
  }
}
