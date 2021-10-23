class ContentModelItem {
  int? id;
  String? content;
  String? contentForShare;
  String? tag;
  String? allTag;
  int? favoriteState;

  ContentModelItem(
      this.id, this.content, this.contentForShare, this.tag, this.allTag, this.favoriteState);

  ContentModelItem.fromMap(dynamic obj) {
    this.id = obj['_id'];
    this.content = obj['content'];
    this.contentForShare = obj['content_for_share'];
    this.tag = obj['tag'];
    this.allTag = obj['all_tag'];
    this.favoriteState = obj['favorite_state'];
  }
}
