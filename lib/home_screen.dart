import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokeApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  String getImageUrl(String number) {
    // Remove leading zeros and file extension if present
    number = number.replaceAll(RegExp(r'^0+'), '').replaceAll('.png', '');
    var url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$number.png";
    print('Generated URL for Pokemon $number: $url');
    return url;
  }
  List? pokedex;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: -10,
          right: -40,
          child: Image.asset(
            'images/pokeball.png',
            width: 200,
            fit: BoxFit.fitWidth,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading pokeball.png: $error');
              return const SizedBox(width: 200);
            },
          ),
        ),
        Positioned(
          top: 100,
          left: 20,
          child: Text(
            "Pokedex",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Positioned(
          top: 150,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              if (pokedex?.isNotEmpty ?? false)
                Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.4,
                        ),
                        itemCount: pokedex?.length ?? 0,
                        itemBuilder: (context, index) {
                          var type = pokedex?[index]['type'][0] ?? '';
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: type == 'Grass'
                                        ? Colors.green
                                        : type == 'Fire'
                                            ? Colors.red
                                            : type == 'Water'
                                                ? Colors.blue
                                                : type == 'Electric'
                                                    ? Colors.yellow
                                                    : type == 'Rock'
                                                        ? Colors.blueGrey
                                                        : type == 'Ground'
                                                            ? Colors.brown
                                                            : type == 'Psychic'
                                                                ? Colors.indigo
                                                                : type ==
                                                                        'Fighting'
                                                                    ? Colors
                                                                        .orange
                                                                    : type ==
                                                                            'Bug'
                                                                        ? Colors
                                                                            .lightGreen
                                                                        : type ==
                                                                                'Ghost'
                                                                            ? Colors.deepPurple
                                                                            : type == 'Normal'
                                                                                ? Colors.black26
                                                                                : type == 'Fairy'
                                                                                    ? Colors.pinkAccent
                                                                                    : type == 'Poison'
                                                                                        ? Colors.purpleAccent
                                                                                        : type == 'Ice'
                                                                                            ? Colors.lightBlueAccent
                                                                                            : type == 'Dragon'
                                                                                                ? Colors.redAccent
                                                                                                : Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    )),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: -10,
                                      right: -10,
                                      child: Image.asset(
                                        'images/pokeball.png',
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 10,
                                      child: Text(
                                        pokedex?[index]['name'] ?? 'Unknown',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 45,
                                      left: 20,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                            top: 4,
                                            bottom: 4,
                                          ),
                                          child: Text(
                                            type.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.black26,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 4,
                                        right: 5,
                                        child: CachedNetworkImage(
                                          imageUrl: getImageUrl(pokedex?[index]['num'] ?? '1'),
                                          height: height * 0.20, // Making image height 18% of screen height
                                          fit: BoxFit.contain,
                                          errorWidget: (context, url, error) {
                                            print('Error loading Pokemon image: $error');
                                            return const Icon(Icons.catching_pokemon);
                                          },
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PokemonDetailScreen(
                                            pokemonDetail: pokedex?[index],
                                            color: type == 'Grass'
                                                ? Colors.green
                                                : type == 'Fire'
                                                    ? Colors.red
                                                    : type == 'Water'
                                                        ? Colors.blue
                                                        : type == 'Electric'
                                                            ? Colors.yellow
                                                            : type == 'Rock'
                                                                ? Colors
                                                                    .blueGrey
                                                                : type ==
                                                                        'Ground'
                                                                    ? Colors
                                                                        .brown
                                                                    : type ==
                                                                            'Psychic'
                                                                        ? Colors
                                                                            .indigo
                                                                        : type ==
                                                                                'Fighting'
                                                                            ? Colors.orange
                                                                            : type == 'Bug'
                                                                                ? Colors.lightGreen
                                                                                : type == 'Ghost'
                                                                                    ? Colors.deepPurple
                                                                                    : type == 'Normal'
                                                                                        ? Colors.black26
                                                                                        : type == 'Fairy'
                                                                                            ? Colors.pinkAccent
                                                                                            : type == 'Poison'
                                                                                                ? Colors.purpleAccent
                                                                                                : type == 'Ice'
                                                                                                    ? Colors.lightBlueAccent
                                                                                                    : type == 'Dragon'
                                                                                                        ? Colors.redAccent
                                                                                                        : Colors.black,
                                            heroTag: index,
                                          )));
                            },
                          );
                        }))
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ],
    ));
  }

  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        print(decodedJsonData);
        pokedex = decodedJsonData['pokemon'];
        // Update image URLs to use PokeAPI
        if (pokedex != null) {
          for (var pokemon in pokedex!) {
            pokemon['img'] = getImageUrl(pokemon['num']);
          }
        }
        if (pokedex != null && pokedex!.isNotEmpty) {
          print('First Pokemon data: ${pokedex![0]}');
        }
        setState(() {});
      }
    });
  }
}
