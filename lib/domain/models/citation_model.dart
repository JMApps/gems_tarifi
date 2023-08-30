class CitationModel {
  final int id;
  final String citation;

  CitationModel({
    required this.id,
    required this.citation,
  });

  factory CitationModel.fromMap(Map<String, dynamic> map) {
    return CitationModel(
      id: map['id'] as int,
      citation: map['citation'] as String,
    );
  }
}
