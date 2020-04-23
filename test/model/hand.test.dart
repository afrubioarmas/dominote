import 'package:dominote/model/hand.dart';
import 'package:dominote/model/player.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Hand Test', () {
    test('Instance with random hands', () {
      List<Player> players = List<Player>();
      players.add(Player("Andres", 1));
      players.add(Player("Oscar", 2));
      players.add(Player("Dani", 3));
      players.add(Player("Felo", 4));

      Hand hand = Hand.fromPlayersRandom(players, 100);
      expect(hand.matchesTeam1.length < 10, true);
      expect(hand.matchesTeam2.length < 10, true);
    });
  });
}
