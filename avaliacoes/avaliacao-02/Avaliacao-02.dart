import 'dart:convert';

// Classe Dependente
class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() => {
        'nome': _nome,
      };
}

// Classe Funcionario
class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() => {
        'nome': _nome,
        'dependentes': _dependentes.map((d) => d.toJson()).toList(),
      };
}

// Classe EquipeProjeto
class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() => {
        'nomeProjeto': _nomeProjeto,
        'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
      };
}

void main() {
  // 1. Criar varios objetos Dependentes
  var dep1 = Dependente("Carlos");
  var dep2 = Dependente("Ana");
  var dep3 = Dependente("João");
  var dep4 = Dependente("Maria");

  // 2. Criar varios objetos Funcionario
  var func1 = Funcionario("José", [dep1, dep2]);
  var func2 = Funcionario("Fernanda", [dep3]);
  var func3 = Funcionario("Lucas", [dep4]);

  // 4. Criar uma lista de Funcionarios
  List<Funcionario> funcionarios = [func1, func2, func3];

  // 5. Criar um objeto EquipeProjeto
  var equipe = EquipeProjeto("Avaliacao-02", funcionarios);

  // 6. Printar no formato JSON o objeto EquipeProjeto
  // String json = jsonEncode(equipe.toJson());
  print(JsonEncoder.withIndent('  ').convert(equipe.toJson()));

}
