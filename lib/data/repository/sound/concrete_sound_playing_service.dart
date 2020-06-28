import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

import '../../../core/error/failure.dart';
import '../../../core/extension/dartz/dartz.dart';
import '../../../domain/repository/repository.dart';

class ConcreteSoundPlayingService implements SoundPlayingService {
  static const String _dingSoundFilePath = "assets/android/sound/ding.wav";
  int _dingSoundId;
  final Soundpool _soundPool;
  ConcreteSoundPlayingService(this._soundPool);
  @override
  Future<Either<Failure, void>> initialize(BuildContext context) async {
    Future<void> getAssets() async {
      final assetBundle = DefaultAssetBundle.of(context);
      final soundPath = await assetBundle.load(_dingSoundFilePath);
      _dingSoundId = await _soundPool.load(soundPath);
    }

    return _runAsTask(getAssets);
  }

  @override
  Future<Either<Failure, void>> playDing() async {
    Future<void> playDing() => _dingSoundId != null
        ? _soundPool.play(_dingSoundId)
        : Future(() => null);

    return _runAsTask(playDing);
  }

  static Future<Either<Failure, void>> _runAsTask(Function _func) async {
    return Task(() async {
      try {
        return await _func();
      } on PlatformException catch (e) {
        // no-op
      }
    }).attempt().mapLeftToFailure().run() as Future<Either<Failure, void>>;
  }
}
