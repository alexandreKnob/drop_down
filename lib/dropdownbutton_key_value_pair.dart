import 'package:flutter/material.dart';

class KeyValuePairDropdown extends StatefulWidget {
  //Add key-value pair data here
  @override
  KeyValuePairDropdownState createState() {
    return new KeyValuePairDropdownState();
  }
}

class KeyValuePairDropdownState extends State<KeyValuePairDropdown> {

  List<UsuariosModelo> _datas = [
    UsuariosModelo(codigo: "1", nome: "Pedro", idade: 12),
    UsuariosModelo(codigo: "2", nome: "João", idade: 21),
    UsuariosModelo(codigo: "3", nome: "Vinícius", idade: 42),
    UsuariosModelo(codigo: "4", nome: "Alexandre", idade: 71),
    UsuariosModelo(codigo: "5", nome: "Ricardo", idade: 90),
  ];

  UsuariosModelo _selectedValue;
  String dropdownValue = 'One';



  @override
  void initState() {
    super.initState();
    _selectedValue = _datas[0];

    for (UsuariosModelo p in _datas) {
      print(p.nome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key value Pair - DropdownButton'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            DropdownButton<UsuariosModelo>(

              value:  _selectedValue,
              isExpanded: true,
              items: _datas.map((UsuariosModelo data) => DropdownMenuItem<UsuariosModelo>(
                        child: Text(data.nome),
                        value: data,
                      ))
                  .toList(),
              onChanged: (UsuariosModelo value) {
                setState(() => _selectedValue = value);
              },

            ),
            DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 25.0,
            ),

            Text(_selectedValue.codigo),
            Text(_selectedValue.idade.toString()),
          ],
        ),
      ),
    );
  }
}

//Create a Model class to hold key-value pair data
class UsuariosModelo {
  String codigo;
  String nome;
  int    idade;

  UsuariosModelo({this.codigo, this.nome, this.idade});
}
