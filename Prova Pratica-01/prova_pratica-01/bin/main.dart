import 'dart:convert';
import 'package:prova_pratica_01/modelo.dart';
import 'dart_gmail_sender.dart'; // Importa o script de envio

void main() async {
  final cliente = Cliente(codigo: 1, nome: 'João da Silva', tipoCliente: 1);
  final vendedor = Vendedor(codigo: 1, nome: 'Tito vendedor da Silva', comissao: 5.0);
  final veiculo = Veiculo(codigo: 101, descricao: 'BMW', valor: 35000.0);

  final itens = [
    ItemPedido(sequencial: 1, descricao: 'Porta', quantidade: 1, valor: 1500.0),
    ItemPedido(sequencial: 2, descricao: 'Pneu', quantidade: 4, valor: 300.0),
  ];

  final pedido = PedidoVenda(
    codigo: 'PV001',
    data: DateTime.now(),
    valorPedido: 0,
    cliente: cliente,
    vendedor: vendedor,
    veiculo: veiculo,
    items: itens,
  );

  final json = const JsonEncoder.withIndent('  ').convert(pedido.toJson());

  print(json);

  // Envia por e-mail
  await enviarEmail(json);
}
