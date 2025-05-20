import 'dart:io';
import 'package:sqlite3/sqlite3.dart';

void main() {
  final dbFile = 'alunos.db';
  final database = sqlite3.open(dbFile);

  // Create table if not exists
  database.execute('''
    CREATE TABLE IF NOT EXISTS TB_ALUNO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL CHECK(length(nome) <= 50)
    );
  ''');

  print('Bem-vindo ao gerenciador de alunos SQLite.');
  while (true) {
    print('\nEscolha uma opção:');
    print('1 - Inserir novo aluno');
    print('2 - Mostrar todos alunos');
    print('3 - Sair');
    stdout.write('Opção: ');
    final input = stdin.readLineSync();

    if (input == '1') {
      _inserirAluno(database);
    } else if (input == '2') {
      _mostrarAlunos(database);
    } else if (input == '3') {
      print('Saindo...');
      database.dispose();
      break;
    } else {
      print('Opção inválida. Tente novamente.');
    }
  }
}

void _inserirAluno(Database database) {
  stdout.write('Digite o nome do aluno (max 50 caracteres): ');
  final nome = stdin.readLineSync();

  if (nome == null || nome.trim().isEmpty) {
    print('Nome inválido. Tente novamente.');
    return;
  }

  if (nome.length > 50) {
    print('Nome muito longo. Limite de 50 caracteres.');
    return;
  }

  final stmt = database.prepare('INSERT INTO TB_ALUNO (nome) VALUES (?);');
  stmt.execute([nome.trim()]);
  stmt.dispose();

  print('Aluno "$nome" inserido com sucesso!');
}

void _mostrarAlunos(Database database) {
  final ResultSet resultSet = database.select('SELECT id, nome FROM TB_ALUNO ORDER BY id;');
  if (resultSet.isEmpty) {
    print('Nenhum aluno cadastrado.');
    return;
  }

  print('\nLista de alunos:');
  for (final row in resultSet) {
    print('ID: ${row['id']} - Nome: ${row['nome']}');
  }
}
