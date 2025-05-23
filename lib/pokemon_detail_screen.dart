import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen(
      {Key? key,
      this.pokemonDetail,
      required this.color,
      required this.heroTag})
      : super(key: key);

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  String getImageUrl(String number) {
    // Remove leading zeros and file extension if present
    number = number.replaceAll(RegExp(r'^0+'), '').replaceAll('.png', '');
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$number.png";
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 45,
            left: 18,
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
            ),
          ),
          Positioned(
            top: 95,
              left: 30,
              child: Text(widget.pokemonDetail['name'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
          ),
          Positioned(
            top: 145,
               left: 30,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                  child: Text(widget.pokemonDetail['type'].join(', '),
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                  color: Colors.black26
                ),
              ),
          ),
          Positioned(
              top: height * 0.20,
              right: -30,
              child: Image.asset(
                'images/pokeball.png',
                height: 200,
                fit: BoxFit.fitHeight,
              ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text("Name",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text(widget.pokemonDetail['name'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text("Height",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text(widget.pokemonDetail['height'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text("Weight",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text(widget.pokemonDetail['weight'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text("Spawn Time",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text(widget.pokemonDetail['spawn_time'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text("Weakness",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            child: Text(widget.pokemonDetail['weaknesses'].join(', '),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text("Pre Form",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),),
                          ),
                          widget.pokemonDetail['prev_evolution'] != null?
                          SizedBox(
                            height: 20,
                            width: width * 0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.pokemonDetail['prev_evolution'].length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(widget.pokemonDetail['prev_evolution'][index]['name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ):
                          Text("First Form",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            width: width * 0.3,
                            child: Text("Evolution",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),),
                          ),
                          widget.pokemonDetail['next_evolution'] != null?
                          SizedBox(
                            height: 20,
                            width: width * 0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.pokemonDetail['next_evolution'].length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(widget.pokemonDetail['next_evolution'][index]['name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                                },
                            ),
                          ):
                          Text("Max Evolution",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.15,
              left: (width/2)-90,
              child: CachedNetworkImage(
                imageUrl: getImageUrl(widget.pokemonDetail['num']),
                height: 280,
                fit: BoxFit.fitHeight,
          ))
        ],
      ),
    );
  }
}
