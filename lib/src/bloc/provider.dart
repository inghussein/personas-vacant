


import 'package:flutter/material.dart';
import 'package:personas_vacant/src/bloc/personas_bloc.dart';

class ProviderBloc extends InheritedWidget {

  final _personasBloc = new PersonasBloc();  



  static ProviderBloc _instancia;

  factory ProviderBloc({ Key key, Widget child }){

    if( _instancia == null )
    {

      _instancia = new ProviderBloc._internal(key: key, child: child);

    }

    return _instancia;

  }


  ProviderBloc._internal({ Key key, Widget child })
     : super(key: key, child: child );  
  

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PersonasBloc personasBloc ( BuildContext context )  {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>()._personasBloc);
  }  




  
      

}