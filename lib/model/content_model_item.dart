class ContentModelItem {
  int? id;
  String? content;
  String? contentForShare;
  String? tag;
  int? favorite;

  ContentModelItem(
      this.id, this.content, this.contentForShare, this.tag, this.favorite);

  ContentModelItem.fromMap(dynamic obj) {
    this.id = obj['_id'];
    this.content = obj['content'];
    this.contentForShare = obj['content_for_share'];
    this.tag = obj['tag'];
    this.favorite = obj['favorite'];
  }
}
