// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:hotel_reservation/Entity.dart';

@dao
abstract class HotelDao {
  @Query('SELECT * FROM UserHotel')
  Future<List<UserHotel>> findAllData();


  @insert
  Future<void> insertUserHotel(UserHotel UserHotel);

  @update

  Future<void> updateUserHotel(UserHotel UserHotel);

  @delete
  Future<void> deleteUserHotel(UserHotel UserHotel);
}