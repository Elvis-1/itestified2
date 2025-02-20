// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// final secureStorage = FlutterSecureStorage();

// // User Model
// class User {
//   final int? id;
//   final String name;
//   final String email;
//   final double balance;

//   User({this.id, required this.name, required this.email, this.balance = 0.0});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'balance': balance,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       id: map['id'],
//       name: map['name'],
//       email: map['email'],
//       balance: map['balance'],
//     );
//   }
// }

// // Transaction Model
// class TransactionModel {
//   final int? id;
//   final int userId;
//   final double amount;
//   final String type;
//   final String timestamp;

//   TransactionModel({
//     this.id,
//     required this.userId,
//     required this.amount,
//     required this.type,
//     required this.timestamp,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'userId': userId,
//       'amount': amount,
//       'type': type,
//       'timestamp': timestamp,
//     };
//   }

//   factory TransactionModel.fromMap(Map<String, dynamic> map) {
//     return TransactionModel(
//       id: map['id'],
//       userId: map['userId'],
//       amount: map['amount'],
//       type: map['type'],
//       timestamp: map['timestamp'],
//     );
//   }
// }

// // Database Helper Class
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;
//   DatabaseHelper._internal();

//   Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDB();
//     return _database!;
//   }

//   Future<Database> initDB() async {
//     try {
//       String path = join(await getDatabasesPath(), 'fintech.db');
//       return await openDatabase(
//         path,
//         version: 1,
//         onCreate: (db, version) async {
//           await db.execute('''
//             CREATE TABLE users (
//               id INTEGER PRIMARY KEY AUTOINCREMENT,
//               name TEXT,
//               email TEXT UNIQUE,
//               balance REAL
//             )
//           ''');

//           await db.execute('''
//             CREATE TABLE transactions (
//               id INTEGER PRIMARY KEY AUTOINCREMENT,
//               userId INTEGER,
//               amount REAL,
//               type TEXT,
//               timestamp TEXT,
//               FOREIGN KEY(userId) REFERENCES users(id)
//             )
//           ''');
//         },
//       );
//     } catch (e) {
//       print('Error initializing DB: $e');
//       rethrow;
//     }
//   }

//   // User Operations
//   Future<void> insertUser(User user) async {
//     try {
//       final db = await database;
//       await secureStorage.write(key: 'email_${user.email}', value: user.email);
//       await db.insert('users', user.toMap());
//     } catch (e) {
//       print('Error inserting user: $e');
//     }
//   }

//   Future<User?> getUserByEmail(String email) async {
//     try {
//       final db = await database;
//       final List<Map<String, dynamic>> maps = await db.query(
//         'users',
//         where: 'email = ?',
//         whereArgs: [email],
//       );
//       if (maps.isNotEmpty) {
//         return User.fromMap(maps.first);
//       }
//       return null;
//     } catch (e) {
//       print('Error retrieving user: $e');
//       return null;
//     }
//   }

//   // Transaction Operations
//   Future<void> insertTransaction(TransactionModel txn) async {
//     try {
//       final db = await database;
//       await db.insert('transactions', txn.toMap());
//     } catch (e) {
//       print('Error inserting transaction: $e');
//     }
//   }

//   Future<List<TransactionModel>> getUserTransactions(int userId) async {
//     try {
//       final db = await database;
//       final List<Map<String, dynamic>> maps = await db.query(
//         'transactions',
//         where: 'userId = ?',
//         whereArgs: [userId],
//       );

//       return List.generate(maps.length, (i) {
//         return TransactionModel.fromMap(maps[i]);
//       });
//     } catch (e) {
//       print('Error retrieving transactions: $e');
//       return [];
//     }
//   }

//   // Update User Balance with Transaction Safety
//   Future<void> updateUserBalance(int userId, double newBalance) async {
//     final db = await database;
//     try {
//       await db.transaction((txn) async {
//         await txn.update(
//           'users',
//           {'balance': newBalance},
//           where: 'id = ?',
//           whereArgs: [userId],
//         );
//       });
//     } catch (e) {
//       print('Error updating balance: $e');
//     }
//   }
// }
