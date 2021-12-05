/// free_count : 71527
/// discussion_count : 71527
/// auction_count : 0
/// sold_count : 0

class EntityCount {
  EntityCount({
      int? freeCount, 
      int? discussionCount, 
      int? auctionCount, 
      int? soldCount,}){
    _freeCount = freeCount;
    _discussionCount = discussionCount;
    _auctionCount = auctionCount;
    _soldCount = soldCount;
}

  EntityCount.fromJson(dynamic json) {
    _freeCount = json['free_count'];
    _discussionCount = json['discussion_count'];
    _auctionCount = json['auction_count'];
    _soldCount = json['sold_count'];
  }
  int? _freeCount;
  int? _discussionCount;
  int? _auctionCount;
  int? _soldCount;

  int? get freeCount => _freeCount;
  int? get discussionCount => _discussionCount;
  int? get auctionCount => _auctionCount;
  int? get soldCount => _soldCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['free_count'] = _freeCount;
    map['discussion_count'] = _discussionCount;
    map['auction_count'] = _auctionCount;
    map['sold_count'] = _soldCount;
    return map;
  }

}