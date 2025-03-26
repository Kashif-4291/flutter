import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "users.db");

    print("Database Path: $path"); // Debugging: Check if the database path is correct

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        print("Creating users table..."); // Debugging
        await db.execute('''
          CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE,
            password TEXT
          )
        ''');

        print("Creating grades table..."); // Debugging
        await db.execute('''
          CREATE TABLE IF NOT EXISTS grades (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            subject TEXT,
            marks INTEGER,
            credit_hours INTEGER,
            grade TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(String username, String password) async {
    final db = await database;
    try {
      await db.insert(
        'users',
        {'username': username, 'password': password},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Inserted: $username, $password"); // Debugging
    } catch (e) {
      print("Error inserting user: $e"); // Debugging
    }
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    List<Map<String, dynamic>> users = await db.query('users');
    print("Users retrieved: $users"); // Debugging
    return users;
  }

  Future<void> insertGrade(String subject, int marks, int creditHours, String grade) async {
    final db = await database;
    try {
      await db.insert(
        'grades',
        {'subject': subject, 'marks': marks, 'credit_hours': creditHours, 'grade': grade},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Inserted Grade: $subject, Marks: $marks, Credit Hours: $creditHours, Grade: $grade"); // Debugging
    } catch (e) {
      print("Error inserting grade: $e"); // Debugging
    }
  }

  Future<List<Map<String, dynamic>>> getGrades() async {
    final db = await database;
    List<Map<String, dynamic>> grades = await db.query('grades');
    print("Grades retrieved: $grades"); // Debugging
    return grades;
  }
}
