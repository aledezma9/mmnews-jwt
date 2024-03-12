// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllTranscriptionsPaginatedStruct extends BaseStruct {
  AllTranscriptionsPaginatedStruct({
    int? total,
    int? page,
    int? size,
    int? pages,
    List<ItemsStruct>? items,
  })  : _total = total,
        _page = page,
        _size = size,
        _pages = pages,
        _items = items;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;
  void incrementTotal(int amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  // "page" field.
  int? _page;
  int get page => _page ?? 0;
  set page(int? val) => _page = val;
  void incrementPage(int amount) => _page = page + amount;
  bool hasPage() => _page != null;

  // "size" field.
  int? _size;
  int get size => _size ?? 0;
  set size(int? val) => _size = val;
  void incrementSize(int amount) => _size = size + amount;
  bool hasSize() => _size != null;

  // "pages" field.
  int? _pages;
  int get pages => _pages ?? 0;
  set pages(int? val) => _pages = val;
  void incrementPages(int amount) => _pages = pages + amount;
  bool hasPages() => _pages != null;

  // "items" field.
  List<ItemsStruct>? _items;
  List<ItemsStruct> get items => _items ?? const [];
  set items(List<ItemsStruct>? val) => _items = val;
  void updateItems(Function(List<ItemsStruct>) updateFn) =>
      updateFn(_items ??= []);
  bool hasItems() => _items != null;

  static AllTranscriptionsPaginatedStruct fromMap(Map<String, dynamic> data) =>
      AllTranscriptionsPaginatedStruct(
        total: castToType<int>(data['total']),
        page: castToType<int>(data['page']),
        size: castToType<int>(data['size']),
        pages: castToType<int>(data['pages']),
        items: getStructList(
          data['items'],
          ItemsStruct.fromMap,
        ),
      );

  static AllTranscriptionsPaginatedStruct? maybeFromMap(dynamic data) => data
          is Map
      ? AllTranscriptionsPaginatedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'total': _total,
        'page': _page,
        'size': _size,
        'pages': _pages,
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
        'page': serializeParam(
          _page,
          ParamType.int,
        ),
        'size': serializeParam(
          _size,
          ParamType.int,
        ),
        'pages': serializeParam(
          _pages,
          ParamType.int,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static AllTranscriptionsPaginatedStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AllTranscriptionsPaginatedStruct(
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
        page: deserializeParam(
          data['page'],
          ParamType.int,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.int,
          false,
        ),
        pages: deserializeParam(
          data['pages'],
          ParamType.int,
          false,
        ),
        items: deserializeStructParam<ItemsStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AllTranscriptionsPaginatedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AllTranscriptionsPaginatedStruct &&
        total == other.total &&
        page == other.page &&
        size == other.size &&
        pages == other.pages &&
        listEquality.equals(items, other.items);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([total, page, size, pages, items]);
}

AllTranscriptionsPaginatedStruct createAllTranscriptionsPaginatedStruct({
  int? total,
  int? page,
  int? size,
  int? pages,
}) =>
    AllTranscriptionsPaginatedStruct(
      total: total,
      page: page,
      size: size,
      pages: pages,
    );
