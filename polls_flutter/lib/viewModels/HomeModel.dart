import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:polls/models/Candidate.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:http/http.dart' as http;

enum HomeState { Busy, Idle }

class HomeModel with ChangeNotifier {
  HomeState _state = HomeState.Idle;
  List<Candidate> _candidates = List();
  Socket _socket;
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  HomeModel() {
    fetchCandidates();
    setUpSocket();
  }

  void setState(HomeState homeState) {
    _state = homeState;
    notifyListeners();
  }

  fetchCandidates() {
    setState(HomeState.Busy);
    // _candidates = Ca
    setState(HomeState.Idle);
  }

  List<Candidate> get candidates => _candidates;

  HomeState get state => _state;

  void vote(String id) {
    Map<String, String> _input = Map();
    _input['id'] = id;
    http
        .post("http://192.168.100.57:4000/vote",
            body: json.encode(_input), headers: requestHeaders)
        .then((value) => {});
  }

  setUpSocket() {
    setState(HomeState.Busy);
    _socket = io('http://192.168.100.57:4000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    _socket.on('candidate', (data) {
      _candidates = Candidates.fromJson(json.decode(data)).candidates;
      setState(HomeState.Idle);
    });
  }
}
