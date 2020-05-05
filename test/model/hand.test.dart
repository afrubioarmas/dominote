import 'package:dominote/model/hand.dart';
import 'package:dominote/model/player.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Hand Test', () {
    List<Player> players = List<Player>();
    players.add(Player("Andres", 1));
    players.add(Player("Oscar", 2));
    players.add(Player("Dani", 3));
    players.add(Player("Felo", 4));

    Hand hand = Hand.fromPlayersRandom(players, 100);
    test('Instance with random hands', () {
      expect(hand.matchesTeam1.length < 10, true);
      expect(hand.matchesTeam2.length < 10, true);
    });

    test('Contain team by number', () {
      expect(hand.containsTeamByNumber(1, 2), true);
      expect(hand.containsTeamByNumber(2, 1), true);

      expect(hand.containsTeamByNumber(3, 4), true);
      expect(hand.containsTeamByNumber(4, 3), true);

      expect(hand.containsTeamByNumber(1, 3), false);
      expect(hand.containsTeamByNumber(3, 1), false);

      expect(hand.containsTeamByNumber(2, 3), false);
      expect(hand.containsTeamByNumber(3, 2), false);

      expect(hand.containsTeamByNumber(1, 4), false);
      expect(hand.containsTeamByNumber(4, 1), false);

      expect(hand.containsTeamByNumber(2, 4), false);
      expect(hand.containsTeamByNumber(4, 2), false);
    });
  });
}
