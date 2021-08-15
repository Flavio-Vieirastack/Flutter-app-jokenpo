import 'package:flutter/material.dart';
import 'dart:math';

class game extends StatefulWidget {
  @override
  _gameState createState() => _gameState();
}

class _gameState extends State<game> {
  var _imagemPadrao = AssetImage('images/padrao.png');
  var _mensagem = 'Escolha uma opção';

  void _selecao(String escolhaDoUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numeros = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numeros];

    print('Usuario: ' + escolhaDoUsuario);
    print('app: ' + escolhaApp);

    //exibição da imagem escolhida pelo app
    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          this._imagemPadrao = AssetImage('images/pedra.png');
        });
        break;

      case 'papel':
        setState(() {
          this._imagemPadrao = AssetImage('images/papel.png');
        });
        break;

      case 'tesoura':
        setState(() {
          this._imagemPadrao = AssetImage('images/tesoura.png');
        });
        break;
    }

    if ((escolhaDoUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaDoUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaDoUsuario == 'papel' && escolhaApp == 'pedra')) 
        {
      setState(() {
        this._mensagem = 'Você ganhou :)';
      });
    } else if (

        (escolhaDoUsuario == 'tesoura' && escolhaApp == 'pedra') ||
        (escolhaDoUsuario == 'papel' && escolhaApp == 'tesoura') ||
        (escolhaDoUsuario == 'pedra' && escolhaApp == 'papel')

        ) {

      setState(() {
        this._mensagem = 'Você perdeu :(';
      });

    } else {
      setState(() {
        this._mensagem = 'Nos empatamos';
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //text
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do app',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          //Imagem
          Image(
            image: this._imagemPadrao,
          ),
          //row com 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //gesture detector
              GestureDetector(
                onTap: () => _selecao('papel'),
                child: Image.asset('images/papel.png', height: 95),
              ),
              GestureDetector(
                onTap: () => _selecao('pedra'),
                child: Image.asset('images/pedra.png', height: 95),
              ),
              GestureDetector(
                onTap: () => _selecao('tesoura'),
                child: Image.asset('images/tesoura.png', height: 95),
              ),
            ],
          )
        ],
      ),
    );
  }
}
