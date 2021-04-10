// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:hotel_reservation/Entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'DAO.dart';


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [UserHotel])
abstract class AppDatabase extends FloorDatabase {
  HotelDao get hotelDao;
}