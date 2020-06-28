import 'package:better_c25k/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class SoundPlayingService {
  Future<Either<Failure, void>> initialize(BuildContext context);
  Future<Either<Failure, void>> playDing();
}
