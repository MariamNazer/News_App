import 'package:collection/collection.dart';

import 'source.dart';

class SourceResspond {
  final String? status;
  final List<Source>? sources;

  const SourceResspond({this.status, this.sources});

  factory SourceResspond.fromJson(Map<String, dynamic> json) {
    return SourceResspond(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

}
