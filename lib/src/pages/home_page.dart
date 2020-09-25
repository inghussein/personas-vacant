import 'package:flutter/material.dart';
import 'package:personas_vacant/src/bloc/personas_bloc.dart';
import 'package:personas_vacant/src/bloc/provider.dart';
import 'package:personas_vacant/src/models/persona_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
    
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  

  @override
  Widget build(BuildContext context) {

    final personasBloc = ProviderBloc.personasBloc(context);
    personasBloc.cargarPersonas();

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff536CF6),
        centerTitle: true,
        title: Text('Personas Vacant'),
      ),
          body: listaPersonas(personasBloc),
    );
  }

  Future<Null> actualizarListaPersonas() async
  {
    final personasBloc = ProviderBloc.personasBloc(context);

    personasBloc.refrescarPersonas();

 
  }

  Widget listaPersonas(PersonasBloc personasBloc) {    

    return SafeArea(
          child: StreamBuilder(
       stream: personasBloc.personasStream ,     
       builder: (BuildContext context, AsyncSnapshot<List<Persona>> snapshot){

         if ( snapshot.hasData ){

           List<Persona> personas = snapshot.data;  

           if(personas.length > 0){

             return ListView.builder(   
               physics: BouncingScrollPhysics(),                           
               itemCount: personas.length,
               itemBuilder: (context, i) => _lista(context, personas[i], i),                      

             );


           } else {        

              return Container(
                child: Center(
                  child: Text('No hay datos'),
                ),
              );
            
           }         

         } else{

              // utils.nuevoIndicadorCarga(context);
              return Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );

         }

         }
      ),
    );
    
  }

  Widget _lista(BuildContext context, Persona persona, int i){

    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      animationDuration: Duration(milliseconds: 500),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );


    return GestureDetector(
          onTap: (){

             Alert(
      context: context,
      style: alertStyle,      
      title: 'Detalle de ${persona.name}',      
      content: Align(
        alignment: Alignment.centerLeft,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.blue, size: 12,),
                Text('Id: ${persona.id}', 
                style: TextStyle(
                  fontSize: 16,                  
                ),),
              ],
            ),          
            Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.blue, size: 12,),
                Text('Name: ${persona.name}', 
                style: TextStyle(
                  fontSize: 16,                  
                ),),
              ],
            ),            
            Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.blue, size: 12,),
                Text('Username: ${persona.username}', 
                style: TextStyle(
                  fontSize: 16
                ),),
              ],
            ),            
            Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.blue, size: 12,),
                Text('Email: ${persona.email}', 
                style: TextStyle(
                  fontSize: 16
                ),),
              ],
            ),            
            Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.blue, size: 12,),
                Text('Address: ', 
                style: TextStyle(
                  fontSize: 16
                ),),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(Icons.stop, color: Colors.red, size: 12,),
                  Text('Street: ${persona.address.street}', 
                  style: TextStyle(
                    fontSize: 16
                  ),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(Icons.stop, color: Colors.red, size: 12,),
                  Text('Suite: ${persona.address.suite}', 
                  style: TextStyle(
                    fontSize: 16
                  ),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(Icons.stop, color: Colors.red, size: 12,),
                  Text('City: ${persona.address.city}', 
                  style: TextStyle(
                    fontSize: 16
                  ),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(Icons.stop, color: Colors.red, size: 12,),
                  Text('Zip Code: ${persona.address.zipcode}', 
                  style: TextStyle(
                    fontSize: 16
                  ),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(Icons.stop, color: Colors.red, size: 12,),
                  Text('Geo:', 
                  style: TextStyle(
                    fontSize: 16
                  ),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text('(Lat: ${persona.address.geo.lat}', 
                  style: TextStyle(
                    fontSize: 16
                  ),),
                  Text(' - '),
                  Text('Lng: ${persona.address.geo.lng})', 
              style: TextStyle(
                fontSize: 16
              ),),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 30),
            //   child: Text('Lng: ${persona.address.geo.lng}', 
            //   style: TextStyle(
            //     fontSize: 16
            //   ),),
            // ),
            Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.blue, size: 12,),
                Text('Phone: ${persona.phone}', 
                style: TextStyle(
                  fontSize: 16
                ),),
              ],
            ),
            Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.blue, size: 12,),
                Text('Website: ${persona.website}', 
                style: TextStyle(
                  fontSize: 16
                ),),
              ],
            ), 
            Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.blue, size: 12,),
                Text('Company: ', 
                style: TextStyle(
                  fontSize: 16
                ),),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Name: ${persona.company.name}', 
              style: TextStyle(
                fontSize: 16
              ),),
            ), 
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('CatchPhrase: ${persona.company.catchPhrase}', 
              style: TextStyle(
                fontSize: 16
              ),),
            ), 
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Bs: ${persona.company.bs}', 
              style: TextStyle(
                fontSize: 16
              ),),
            ), 
          ],),
      ),
      buttons: [
        DialogButton(
          color: Colors.blue,
          child: Text(
            "Aceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
                
          },
          child: Container(
            margin: EdgeInsets.only(right: 15, left: 15, bottom: 5, top: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(              
              boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: Offset(4,6),
          blurRadius: 10
          )
      ],
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        colors: (i == 0) ? <Color>[Color(0xff66A9F2),Color(0xff536CF6)] : 
        (i == 1 ) ? <Color>[Color(0xff6989F5),Color(0xff906EF5)] :
        (i == 2 ) ? <Color>[Color(0xff317183),Color(0xff46997D)] :
        (i == 3) ? <Color>[Color(0xff66A9F2),Color(0xff536CF6)] : 
        (i == 4 ) ? <Color>[Color(0xff6989F5),Color(0xff906EF5)] :
        (i == 5 ) ? <Color>[Color(0xff317183),Color(0xff46997D)] :
        (i == 6) ? <Color>[Color(0xff66A9F2),Color(0xff536CF6)] : 
        (i == 7 ) ? <Color>[Color(0xff6989F5),Color(0xff906EF5)] :
        (i == 8 ) ? <Color>[Color(0xff317183),Color(0xff46997D)] :
        <Color>[Color(0xff66A9F2),Color(0xff46997D)]
      )
            ),
            child: ListTile(              
              title: Text(persona.name, 
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
              ),
              subtitle: Text(persona.email,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12
              ),
              ),
              trailing: Text(persona.phone,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13
              ),
              ),
            ),
          )
          );




                  

  }
}