import 'package:floor/floor.dart';

@entity
class UserHotel {
  @primaryKey
  final int id;
  final String name;
  final int selectedDate ;
  final int numberOfPerson ;
  final int numberOfDays ;
  final int price ;




  UserHotel( this.id,
    this.name,
     this.numberOfPerson,
    this.selectedDate,
  this.numberOfDays,
  this.price,
    );
}
