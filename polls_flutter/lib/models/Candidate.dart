class Candidates {
  List<Candidate> candidates;

  Candidates({this.candidates});

  Candidates.fromJson(Map<String, dynamic> json) {
    if (json['candidates'] != null) {
      candidates = new List<Candidate>();
      json['candidates'].forEach((v) {
        candidates.add(new Candidate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.candidates != null) {
      data['candidates'] = this.candidates.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Candidate {
  String id;
  String name;
  String slogan;
  int votes;

  Candidate({this.id, this.name, this.votes, this.slogan});

  Candidate.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    votes = json['votes'];
    slogan = json['slogan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['votes'] = this.votes;
    data['slogan'] = this.slogan;
    return data;
  }
}
