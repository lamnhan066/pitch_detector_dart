import 'package:pitch_detector_dart/algorithm/yin.dart';
import "package:test/test.dart";

import '../test_util.dart';

void main() {
  group("Given a 2 seconds sine audio input of 440hz at 44.1Khz", () {
    final List<double> audioBuffer = TestUtil.audioSampleSine();
    test("should return 440Hz when using the Yin algorithm", () async {
      Yin yin = new Yin(44100, 1024);

      final result = await yin.getPitch(audioBuffer);

      expect(result.pitch, closeTo(440.0, 0.1));
    });
  });
}
