import 'package:floor/floor.dart';
import 'package:my_clean_app/features/posts/data/data_sources/local/DAO/post_DAO.dart';
import 'package:my_clean_app/features/posts/data/models/post.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';


@Database(version: 1, entities: [PostModel])
abstract class AppDatabase extends FloorDatabase{
  PostDao get postDAO;
}