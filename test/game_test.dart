import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sayi_ogrenme/oyun_sayi_ogrenme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sayiOgrenmeConfig.title.length, 33);
    expect(sayiOgrenmeConfig.tagline.length, 33);
    for (final s in sayiOgrenmeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(sayiOgrenmeConfig.gameId, sayiOgrenmeId);
    expect(sayiOgrenmeRules.gameId, sayiOgrenmeId);
    expect(sayiOgrenmeConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sayiOgrenmeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sayiOgrenmeId, optionalMechanics: sayiOgrenmeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(sayiOgrenmeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
