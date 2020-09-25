

import 'package:personas_vacant/src/models/persona_model.dart';
import 'package:personas_vacant/src/providers/persona_provider.dart';
import 'package:rxdart/rxdart.dart';

class PersonasBloc {

  final _personasController = new BehaviorSubject<List<Persona>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _personasProvider = new PersonasProvider();


  Stream<List<Persona>> get personasStream => _personasController.stream;
  Stream<bool> get cargandoStream => _cargandoController.stream;


  void cargarPersonas() async {

    final personas = await _personasProvider.getPersonas();
    _personasController.sink.add( personas );

  }

  Future<void> refrescarPersonas() async {

      cargarPersonas();

  }
  

  dispose() {

    _personasController?.close();
    _cargandoController?.close();

  }

}