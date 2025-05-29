//import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

main() async {
  // Configura as credenciais SMTP do Gmail
  final smtpServer = gmail('gabriel.tito09@aluno.ifce.edu.br', 'lifi sbbv gkgx nhtd ');

  // Cria uma mensagem de e-mail
  final message = Message()
    ..from = Address('gabriel.tito09@aluno.ifce.edu.br', 'João Gabriel Tito')
    ..recipients.add('taveira@ifce.edu.br')
    ..subject = 'Prova Prática-01'
    ..text = '';

  try {
    // Envia o e-mail usando o servidor SMTP do Gmail
    final sendReport = await send(message, smtpServer);

    // Exibe o resultado do envio do e-mail
    print('E-mail enviado: ${sendReport}');
  } on MailerException catch (e) {
    // Exibe informações sobre erros de envio de e-mail
    print('Erro ao enviar e-mail: ${e.toString()}');
  }
}