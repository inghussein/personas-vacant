import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:personas_vacant/src/models/persona_model.dart';


class PersonasProvider{ 

  String _url = "https://jsonplaceholder.typicode.com/users/";

  List<Persona> _personas = new List();

  final _personasStreamController = StreamController<List<Persona>>.broadcast();

  Function(List<Persona>) get personasSink => _personasStreamController.sink.add;

  Stream<List<Persona>> get personasStream => _personasStreamController.stream;

  void disposeStreams()
  {
    _personasStreamController?.close();
  }



  Future<List<Persona>> _procesarRespuesta(String url) async {

    final resp = await http.get( url );

    if(resp.statusCode == 200){

    final decodeData = json.decode(resp.body);

    final personas = new Personas.fromJsonList(decodeData);
    
    return personas.items;

    } else 
    {

         return [];

    }
    
  }

  Future<List<Persona>> getPersonas() async {

    final resp = await _procesarRespuesta(_url);

    _personas.addAll(resp);
    personasSink( _personas );
       
    return resp;

  }

}