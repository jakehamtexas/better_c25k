import 'package:better_c25k/domain/repository/repository.dart';

class PlayDing {
  final SoundPlayingService soundPlayingService;
  PlayDing(this.soundPlayingService);
  Future<void> call() async {
    await soundPlayingService.playDing();
  }
}
