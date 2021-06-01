import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbUtil{

  static Future<sql.Database> database()  async{
    //Precisa esperar esse processamento ser realizado
    //Armazenado o caminho do banco de dados a ser criado
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      //o caminho é o dbPath e nome do arquivo do banco será pets.db
      path.join(dbPath, 'pipoca.db'),
      onCreate: (db, version){
        _createDb(db);
      },
      version: 1
    );
  } 

  static void _createDb(sql.Database db){
    db.execute("""
    CREATE TABLE pets(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome VARCHAR(50),
      descricao VARCHAR(50),
      idade INT,
      raca VARCHAR(50),
      tamanho VARCHAR(20),
      imagemUrl TEXT)
    """);    
  }

  static Future<void> insertData(String table, Map<String, Object> dados) async {

    final db = await database();
    //print(await db.insert(table,dados,conflictAlgorithm: sql.ConflictAlgorithm.replace));  
    await db.insert(table,dados,conflictAlgorithm: sql.ConflictAlgorithm.replace);  
  }

  static Future<List<Map<String,dynamic>>> getData(String table) async{
    final db = await database();
    return db.query(table);
  }




}