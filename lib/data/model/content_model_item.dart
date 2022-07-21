class ContentModelItem {
  final int id;
  final String content;
  final String contentForShare;
  final int favoriteState;

  ContentModelItem(
    this.id,
    this.content,
    this.contentForShare,
    this.favoriteState,
  );

  ContentModelItem.fromMap(dynamic obj)
      : id = obj['id'],
        content = obj['content'],
        contentForShare = obj['content_for_share'],
        favoriteState = obj['favorite_state'];
}
