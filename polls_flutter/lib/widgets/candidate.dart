import 'package:flutter/material.dart';
import '../viewModels/HomeModel.dart';
import 'package:provider/provider.dart';
import '../models/Candidate.dart';

class CandidateWidget extends StatelessWidget {
  final Candidate candidate;

  const CandidateWidget({Key key, this.candidate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeModel state = Provider.of<HomeModel>(context);
    return Container(
      margin: EdgeInsets.all(15),
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          spreadRadius: -7,
          offset: Offset(0, 10),
          color: Theme.of(context).primaryColorDark.withOpacity(.2),
          blurRadius: 25,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: 100,
      child: ListTile(
        title: Text(
          candidate.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(candidate.slogan),
        trailing: Container(
          width: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("votes"),
                  Text(
                    candidate.votes.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Container(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () => state.vote(candidate.id),
                  child: Icon(Icons.arrow_upward),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
