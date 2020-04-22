import 'package:dominote/model/match.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Match test', () {
    test('Instance random', () {
      Match match = Match.random();

      expect(match.score < 50, true);
      expect(match.score > 0, true);
      expect(match.winnerTeam == Team.team1 || match.winnerTeam == Team.team2, true);
    });
  });
}
