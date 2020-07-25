import 'package:common/common.dart';
import 'package:jaguar_validate/jaguar_validate.dart';

List positionStringValidator(String value) {
  return validateValue(value, [
    isNotNull(),
    matchesRegExp(Position.positionStringRegExp, err: 'invalid position')
  ]);
}

List buildingTypeValidator(int value) {
  return validateValue(value, [
    isNotNull(),
    isPositive(),
    (value) {
      if (value == null) return null;
      if (BuildingSpec.byType(value) == null) {
        return ['building type does not exist'];
      }
      return null;
    }
  ]);
}

List buildingIdValidator(int value) {
  return validateValue(value, [
    isNotNull(),
    isPositive(),
  ]);
}

List recruitmentIdValidator(int value) {
  return validateValue(value, [
    isNotNull(),
    isPositive(),
  ]);
}

List buildingLevelValidator(int value) {
  return validateValue(value, [isNotNull(), isPositive(), isLessThan(20)]);
}

List towerTypeValidator(int value) {
  return validateValue(value, [
    isNotNull(),
    isPositive(),
    (value) {
      if (value == null) return null;
      if (TowerSpec.byType(value) == null) {
        return ['unknown tower type'];
      }
      return null;
    }
  ]);
}

List warriorTypeValidator(int value) {
  return validateValue(value, [
    isNotNull(),
    isPositive(),
    (value) {
      if (value == null) return null;
      if (WarriorSpec.byType(value, throws: false) == null) {
        return ['unknown warrior type'];
      }
      return null;
    }
  ]);
}

Position parsePosition(String stringValue, ObjectErrors errs,
    {String key = 'query.position'}) {
  final vErrs = positionStringValidator(stringValue);
  if (vErrs != null) {
    errs[key] = vErrs;
    return null;
  }

  return Position.fromString(stringValue);
}

int parseCityId(String stringValue, ObjectErrors errs,
    {String key = 'query.cityId'}) {
  if (stringValue == null) {
    errs[key] = ['is mandatory'];
    return null;
  }
  int cityId = int.tryParse(stringValue);
  if (cityId == null) {
    errs[key] = ['is not a valid integer'];
    return null;
  }

  final vErrs = validateValue(cityId, [isPositive()]);
  if (vErrs != null) {
    errs[key] = vErrs;
    return null;
  }

  return cityId;
}

int parseCityVersion(String stringValue, ObjectErrors errs,
    {String key = 'query.version'}) {
  if (stringValue == null) {
    return null;
  }
  int version = int.tryParse(stringValue);
  if (version == null) {
    errs[key] = ['is not a valid integer'];
    return null;
  }

  final vErrs = validateValue(version, [isPositive()]);
  if (vErrs != null) {
    errs[key] = vErrs;
    return null;
  }

  return version;
}

BuildingSpec parseBuildingType(String stringValue, ObjectErrors errs,
    {String key = 'query.buildingType'}) {
  if (stringValue == null) {
    errs[key] = ['is mandatory'];
    return null;
  }
  int buildingType = int.tryParse(stringValue);
  if (buildingType == null) {
    errs[key] = ['is not a valid integer'];
    return null;
  }
  final vErrs = buildingTypeValidator(buildingType);
  if (vErrs != null) {
    errs[key] = vErrs;
    return null;
  }

  return BuildingSpec.byType(buildingType);
}

int parseBuildingId(String stringValue, ObjectErrors errs,
    {String key = 'url.buildingId'}) {
  if (stringValue == null) {
    errs[key] = ['is mandatory'];
    return null;
  }
  int buildingId = int.tryParse(stringValue);
  if (buildingId == null) {
    errs[key] = ['is not a valid integer'];
    return null;
  }
  final vErrs = buildingIdValidator(buildingId);
  if (vErrs != null) {
    errs[key] = vErrs;
    return null;
  }

  return buildingId;
}

int parseBuildingLevel(String stringValue, ObjectErrors errs,
    {String key = 'url.buildingLevel'}) {
  if (stringValue == null) {
    errs[key] = ['is mandatory'];
    return null;
  }
  int buildingLevel = int.tryParse(stringValue);
  if (buildingLevel == null) {
    errs[key] = ['is not a valid integer'];
    return null;
  }
  final vErrs = buildingLevelValidator(buildingLevel);
  if (vErrs != null) {
    errs[key] = vErrs;
    return null;
  }

  return buildingLevel;
}

TowerSpec parseTowerType(String stringValue, ObjectErrors errs,
    {String key = 'query.towerType'}) {
  if (stringValue == null) {
    errs[key] = ['is mandatory'];
    return null;
  }
  int towerType = int.tryParse(stringValue);
  if (towerType == null) {
    errs[key] = ['is not a valid integer'];
    return null;
  }
  final vErrs = towerTypeValidator(towerType);
  if (vErrs != null) {
    errs[key] = vErrs;
    return null;
  }

  return TowerSpec.byType(towerType);
}

int parseRecruitmentId(String stringValue, ObjectErrors errs,
    {String key = 'url.recruitmentId'}) {
  if (stringValue == null) {
    errs[key] = ['is mandatory'];
    return null;
  }
  int recruitmentId = int.tryParse(stringValue);
  if (recruitmentId == null) {
    errs[key] = ['is not a valid integer'];
    return null;
  }
  final vErrs = recruitmentIdValidator(recruitmentId);
  if (vErrs != null) {
    errs[key] = vErrs;
    return null;
  }

  return recruitmentId;
}

WarriorSpec parseWarriorType(String stringValue, ObjectErrors errs,
    {String key = 'query.warriorType'}) {
  if (stringValue == null) {
    errs[key] = ['is mandatory'];
    return null;
  }
  int towerType = int.tryParse(stringValue);
  if (towerType == null) {
    errs[key] = ['is not a valid integer'];
    return null;
  }
  final vErrs = warriorTypeValidator(towerType);
  if (vErrs != null) {
    errs[key] = vErrs;
    return null;
  }

  return WarriorSpec.byType(towerType);
}

int parseWarriorCount(String stringValue, ObjectErrors errs,
    {String key = 'query.count'}) {
  if (stringValue == null) {
    errs[key] = ['is mandatory'];
    return null;
  }
  int count = int.tryParse(stringValue);
  if (count == null) {
    errs[key] = ['is not a valid integer'];
    return null;
  }

  final vErrs = validateValue(count, [
    isNotNull(),
    isPositive(),
  ]);
  if(vErrs != null) {
    errs[key] = vErrs;
    return null;
  }

  return count;
}
