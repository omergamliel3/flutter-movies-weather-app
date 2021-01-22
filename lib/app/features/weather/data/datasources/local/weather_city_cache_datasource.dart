import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prospera_exercise/app/features/weather/data/models/weather_model.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

// Weather city local data source to
// store user previous search weather data

class WeatherCityCacheDatasource {
  // Name constants
  final _kDbFileName = 'sembast.db';
  final _storeName = 'weather_store';

  // Sembast database object
  Database _database;

  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are objects converted to Map
  StoreRef<int, Map<String, dynamic>> _weatherStore;

  // initialize database
  Future<bool> initDb() async {
    try {
      // Get a platform-specific directory where persistent app data can be stored
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocumentDir.path, _kDbFileName);
      _database = await databaseFactoryIo.openDatabase(dbPath);
      _weatherStore = intMapStoreFactory.store(_storeName);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// delete database
  Future<bool> deleteDb() async {
    try {
      // Get a platform-specific directory where persistent app data can be stored
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocumentDir.path, _kDbFileName);
      await databaseFactoryIo.deleteDatabase(dbPath);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// delete all records
  Future<bool> deleteAllRecords() async {
    try {
      await _weatherStore.delete(_database);
      return true;
    } catch (e) {
      return false;
    }
  }

  // save weather model in database
  Future<bool> insertCityWeather(WeatherModel weather) async {
    try {
      await _weatherStore.add(_database, weather.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  // get city weather model from the database
  // return null if can not find record
  Future<WeatherModel> getCityCacheWeather(String city) async {
    try {
      final recordSnapshot = await _weatherStore.findFirst(_database,
          finder: Finder(filter: Filter.equals('name', city)));
      if (recordSnapshot == null) return null;
      return WeatherModel.fromJsonCache(recordSnapshot.value);
    } catch (e) {
      print(e);
      return null;
    }
  }

  // return all stored weather models
  Future<List<WeatherModel>> getAllCityCacheWeather() async {
    try {
      final recordSnapshots = await _weatherStore.find(_database);
      return recordSnapshots
          .map((snapshot) => WeatherModel.fromJsonCache(snapshot.value))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
