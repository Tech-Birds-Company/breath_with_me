// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_image_url_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSecureImageUrlCollection on Isar {
  IsarCollection<SecureImageUrl> get secureImageUrls => this.collection();
}

const SecureImageUrlSchema = CollectionSchema(
  name: r'SecureImageUrl',
  id: -3547036475566727146,
  properties: {
    r'baseUrl': PropertySchema(
      id: 0,
      name: r'baseUrl',
      type: IsarType.string,
    ),
    r'secureUrl': PropertySchema(
      id: 1,
      name: r'secureUrl',
      type: IsarType.string,
    )
  },
  estimateSize: _secureImageUrlEstimateSize,
  serialize: _secureImageUrlSerialize,
  deserialize: _secureImageUrlDeserialize,
  deserializeProp: _secureImageUrlDeserializeProp,
  idName: r'id',
  indexes: {
    r'baseUrl': IndexSchema(
      id: -527970039296517416,
      name: r'baseUrl',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'baseUrl',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _secureImageUrlGetId,
  getLinks: _secureImageUrlGetLinks,
  attach: _secureImageUrlAttach,
  version: '3.1.0+1',
);

int _secureImageUrlEstimateSize(
  SecureImageUrl object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.baseUrl.length * 3;
  bytesCount += 3 + object.secureUrl.length * 3;
  return bytesCount;
}

void _secureImageUrlSerialize(
  SecureImageUrl object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.baseUrl);
  writer.writeString(offsets[1], object.secureUrl);
}

SecureImageUrl _secureImageUrlDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SecureImageUrl(
    baseUrl: reader.readString(offsets[0]),
    secureUrl: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _secureImageUrlDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _secureImageUrlGetId(SecureImageUrl object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _secureImageUrlGetLinks(SecureImageUrl object) {
  return [];
}

void _secureImageUrlAttach(
    IsarCollection<dynamic> col, Id id, SecureImageUrl object) {
  object.id = id;
}

extension SecureImageUrlByIndex on IsarCollection<SecureImageUrl> {
  Future<SecureImageUrl?> getByBaseUrl(String baseUrl) {
    return getByIndex(r'baseUrl', [baseUrl]);
  }

  SecureImageUrl? getByBaseUrlSync(String baseUrl) {
    return getByIndexSync(r'baseUrl', [baseUrl]);
  }

  Future<bool> deleteByBaseUrl(String baseUrl) {
    return deleteByIndex(r'baseUrl', [baseUrl]);
  }

  bool deleteByBaseUrlSync(String baseUrl) {
    return deleteByIndexSync(r'baseUrl', [baseUrl]);
  }

  Future<List<SecureImageUrl?>> getAllByBaseUrl(List<String> baseUrlValues) {
    final values = baseUrlValues.map((e) => [e]).toList();
    return getAllByIndex(r'baseUrl', values);
  }

  List<SecureImageUrl?> getAllByBaseUrlSync(List<String> baseUrlValues) {
    final values = baseUrlValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'baseUrl', values);
  }

  Future<int> deleteAllByBaseUrl(List<String> baseUrlValues) {
    final values = baseUrlValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'baseUrl', values);
  }

  int deleteAllByBaseUrlSync(List<String> baseUrlValues) {
    final values = baseUrlValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'baseUrl', values);
  }

  Future<Id> putByBaseUrl(SecureImageUrl object) {
    return putByIndex(r'baseUrl', object);
  }

  Id putByBaseUrlSync(SecureImageUrl object, {bool saveLinks = true}) {
    return putByIndexSync(r'baseUrl', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBaseUrl(List<SecureImageUrl> objects) {
    return putAllByIndex(r'baseUrl', objects);
  }

  List<Id> putAllByBaseUrlSync(List<SecureImageUrl> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'baseUrl', objects, saveLinks: saveLinks);
  }
}

extension SecureImageUrlQueryWhereSort
    on QueryBuilder<SecureImageUrl, SecureImageUrl, QWhere> {
  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SecureImageUrlQueryWhere
    on QueryBuilder<SecureImageUrl, SecureImageUrl, QWhereClause> {
  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterWhereClause>
      baseUrlEqualTo(String baseUrl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'baseUrl',
        value: [baseUrl],
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterWhereClause>
      baseUrlNotEqualTo(String baseUrl) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'baseUrl',
              lower: [],
              upper: [baseUrl],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'baseUrl',
              lower: [baseUrl],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'baseUrl',
              lower: [baseUrl],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'baseUrl',
              lower: [],
              upper: [baseUrl],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SecureImageUrlQueryFilter
    on QueryBuilder<SecureImageUrl, SecureImageUrl, QFilterCondition> {
  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      baseUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      baseUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      baseUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      baseUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      baseUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      baseUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      baseUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'baseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      baseUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'baseUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      baseUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      baseUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'baseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      secureUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      secureUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'secureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      secureUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'secureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      secureUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'secureUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      secureUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'secureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      secureUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'secureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      secureUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'secureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      secureUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'secureUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      secureUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secureUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterFilterCondition>
      secureUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'secureUrl',
        value: '',
      ));
    });
  }
}

extension SecureImageUrlQueryObject
    on QueryBuilder<SecureImageUrl, SecureImageUrl, QFilterCondition> {}

extension SecureImageUrlQueryLinks
    on QueryBuilder<SecureImageUrl, SecureImageUrl, QFilterCondition> {}

extension SecureImageUrlQuerySortBy
    on QueryBuilder<SecureImageUrl, SecureImageUrl, QSortBy> {
  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterSortBy> sortByBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.asc);
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterSortBy>
      sortByBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.desc);
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterSortBy> sortBySecureUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secureUrl', Sort.asc);
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterSortBy>
      sortBySecureUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secureUrl', Sort.desc);
    });
  }
}

extension SecureImageUrlQuerySortThenBy
    on QueryBuilder<SecureImageUrl, SecureImageUrl, QSortThenBy> {
  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterSortBy> thenByBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.asc);
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterSortBy>
      thenByBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseUrl', Sort.desc);
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterSortBy> thenBySecureUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secureUrl', Sort.asc);
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QAfterSortBy>
      thenBySecureUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secureUrl', Sort.desc);
    });
  }
}

extension SecureImageUrlQueryWhereDistinct
    on QueryBuilder<SecureImageUrl, SecureImageUrl, QDistinct> {
  QueryBuilder<SecureImageUrl, SecureImageUrl, QDistinct> distinctByBaseUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SecureImageUrl, SecureImageUrl, QDistinct> distinctBySecureUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secureUrl', caseSensitive: caseSensitive);
    });
  }
}

extension SecureImageUrlQueryProperty
    on QueryBuilder<SecureImageUrl, SecureImageUrl, QQueryProperty> {
  QueryBuilder<SecureImageUrl, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SecureImageUrl, String, QQueryOperations> baseUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseUrl');
    });
  }

  QueryBuilder<SecureImageUrl, String, QQueryOperations> secureUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secureUrl');
    });
  }
}
