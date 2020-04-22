import 'dart:math';

enum Team { team1, team2 }

class Match {
  Team winnerTeam;
  int score;

  Match(this.winnerTeam, this.score);

  Match.random() {
    if (Random().nextInt(10) % 2 == 0) {
      this.winnerTeam = Team.team1;
    } else {
      this.winnerTeam = Team.team2;
    }
    this.score = Random().nextInt(50);
  }
}
