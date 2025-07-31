import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

Future<void> enviarEmail(String conteudoJson) async {
  final smtpServer = gmail('gabriel.tito09@aluno.ifce.edu.br', 'lifi sbbv gkgx nhtd');

  final message = Message()
    ..from = Address('gabriel.tito09@aluno.ifce.edu.br', 'João Gabriel Tito')
    ..recipients.add('clara.ribeiro09@aluno.ifce.edu.br')
    ..subject = 'Prova Prática - 01'
    ..text = 'Segue abaixo o JSON do pedido:\n\n$conteudoJson';

  try {
    final sendReport = await send(message, smtpServer);
    print('E-mail enviado com sucesso: $sendReport');
  } on MailerException catch (e) {
    print('Erro ao enviar e-mail: ${e.toString()}');
  }
}
