// ignore_for_file: non_constant_identifier_names, file_names

import 'package:eventos_uesb/utils/repository/DbConnection.dart';

class Querys {
  ddl() async {
    var conn = await DbConnection().connection();
    await conn.connect();
    await conn.execute("""
      CREATE SCHEMA IF NOT EXISTS `eventos_uesb`;
      USE `eventos_uesb`;
      CREATE TABLE IF NOT EXISTS `eventos_uesb`.`usuarios` (
        `idusuarios` INT NOT NULL AUTO_INCREMENT,
        `cpf` VARCHAR(11) NOT NULL,
        `nome` VARCHAR(60) NOT NULL,
        `senha` VARCHAR(30) NOT NULL,
        PRIMARY KEY (`idusuarios`),
        UNIQUE INDEX `idusuarios_UNIQUE` (`idusuarios` ASC) VISIBLE,
        UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
      ENGINE = InnoDB;
      """);
  }

  createNewUser(nome, CPF, senha) async {
    var conn = await DbConnection().connection();
    await conn.connect();
    var stmt = await conn.prepare(
      "INSERT INTO usuarios (nome, CPF, senha) VALUES (?, ?, ?)",
    );
    await stmt.execute([nome, CPF, senha]);
  }

  searchUser(CPF, senha) async {
    var conn = await DbConnection().connection();
    await conn.connect();
    return await conn.execute(
        'select cpf, senha from usuarios where cpf = :cpf and senha = :senha',
        {'cpf': CPF, 'senha': senha});
  }
}
