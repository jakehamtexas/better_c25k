import 'package:flutter/material.dart';

class NameAndId<TId> {
  final TId id;
  final String name;

  const NameAndId({
    @required this.id,
    @required this.name,
  });
}
