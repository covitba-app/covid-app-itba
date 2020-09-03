import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewInteraction extends StatefulWidget {
  // pointer to a function.
  final Function addNewInt;

  NewInteraction(this.addNewInt);
  @override
  _NewInteractionState createState() => _NewInteractionState();
}

class _NewInteractionState extends State<NewInteraction> {
  final _titleController = TextEditingController();
  final _riskController = TextEditingController();
  DateTime _selectedDate;

  // #region Comentario
  //Esta funcion se encarga de validar que se haya encontrado un texto y guarda el mismo
  //en las variables dadas, ademas se verifica si las mismas cumplen las condiciones
  //requeridas, si no las cumple se sale de la funcion con return, si las cumple se
  //llama a addNewInt con los valores ingresados por el usuario
  // #endregion
  void _submitData() {
    if (_riskController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredRisk = double.parse(_riskController.text);

    //little validation
    if (enteredTitle.isEmpty ||
        enteredRisk <= 0 ||
        enteredRisk > 100 ||
        _selectedDate == null) {
      return;
    }

    // widget give you access to the function addNewInt wich is in statefullwidget.
    widget.addNewInt(
      _titleController.text,
      double.parse(_riskController.text),
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    //allow you to select a date
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        //if the user selected cancel
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          //aqui con padding lo que se busca es tener en consideracion el tamaño del
          //panel que aparece en la app para el teclado.
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Risk (%)'),
                controller: _riskController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                //height para darle espacio respecto de los text inputs.
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Day: '
                              '${DateFormat('dd-MMM-yyyy').format(_selectedDate)}'),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Add Interaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
