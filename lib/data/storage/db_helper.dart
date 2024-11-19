import 'package:knavator_assignment/data/enitity/post/post.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const String DB_NAME = 'posts.db';
  static const String TABLE_NAME = 'posts';

  static const String COLUMN_ID = 'id';
  static const String COLUMN_TITLE = 'title';
  static const String COLUMN_TIMER_DURATION = 'timerDuration';
  static const String COLUMN_IS_READ = 'isRead';
  static const String COLUMN_REMAINING_TIME = 'remainingTime';

  static final DBHelper instance = DBHelper._privateConstructor();
  static Database? _database;

  DBHelper._privateConstructor();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DB_NAME);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $TABLE_NAME (
        $COLUMN_ID TEXT PRIMARY KEY,
        $COLUMN_TITLE TEXT,
        $COLUMN_TIMER_DURATION INTEGER,
        $COLUMN_IS_READ INTEGER,
        $COLUMN_REMAINING_TIME INTEGER
      )
    ''');
  }

  Future<void> insertPost(Post post) async {
    final db = await database;
    await db.insert(
      TABLE_NAME,
      post.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Post>> getPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

    return List.generate(maps.length, (i) {
      return Post.fromJson(maps[i]);
    });
  }

  Future<void> clearTable() async {
    final db = await database;
    await db.delete(TABLE_NAME);
  }
}
