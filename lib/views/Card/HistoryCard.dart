


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Repository/HistoryRepository.dart';
import '../../model/Historico.dart';
import '../evaluationPage/evaluation_page.dart';

class HistoryCard extends StatefulWidget {
  History history;
  

  HistoryCard({Key? key,required this.history}) : super(key: key);

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  List<String> selecionadas =[];

  @override
   mostrarDetalhes(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EvaluationPage(),
      settings: RouteSettings(
      arguments: {
      "name": widget.history.name,
      "segment": widget.history.segment
      }
      )
      )
      );
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Card (
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.white,
          width: 5,
          
          ),
        borderRadius: BorderRadius.circular(15.0)
      ),
        
        color: const Color.fromRGBO(240, 125, 54, 1.0),
      
      
      margin: const EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
        onTap: () => mostrarDetalhes(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left:20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children:[
                        ListTile(
                          title:
                          Text(widget.history.name, 
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                    
                          ),
                            ),
                        
                        subtitle: Text("Segmento: ${widget.history.segment}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                        ),
                        ),
                        //selected: selecionadas.contains(widget.history.name),
                        selectedTileColor:  const Color.fromRGBO(0, 0, 0, 0).withOpacity(0.2),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                          ),
                          onLongPress: (){
                            setState(() {

                                (selecionadas.contains(widget.history.name))
                                    ? selecionadas.remove(widget.history.name)
                                    : selecionadas.add(widget.history.name);
                            });
                            },
                        )
                    ]
                    ),
                    
                    
                )
                
                ),
                PopupMenuButton(
                  color:  Colors.white,
                  icon: const Icon(Icons.more_vert,color:  Colors.white,),
                  itemBuilder: (context) =>[
                    PopupMenuItem(child: ListTile(
                      title: const Text("remover do Histórico"),
                      onTap: (){
                        Navigator.pop(context);
                        Provider.of<HistoryRepository>(context,listen: false).remove(widget.history);
                      }
                      )
                      )
                  ]
                  )
            ]),
          )
      )
    );
  }
}