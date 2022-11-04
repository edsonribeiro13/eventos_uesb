// ignore_for_file: file_names

import 'package:mysql_client/mysql_client.dart';

class DbConnection {
  connection() async {
    return await MySQLConnection.createConnection(
      host: '10.0.2.2',
      port: 3306,
      userName: 'root',
      password: 'admin',
      databaseName: 'eventos_uesb',
    );
  }
}
