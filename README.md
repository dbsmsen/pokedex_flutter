# Pokedex Flutter App

A beautiful and interactive Pokedex application built with Flutter, featuring a modern UI and comprehensive Pokemon information.

## Features

### Home Screen
- Grid layout displaying all Pokemon with their images
- Color-coded cards based on Pokemon type (e.g., green for Grass, red for Fire)
- Decorative Pokeball background design
- Smooth scrolling with responsive grid layout
- Error handling for image loading with fallback Pokemon icon
- Pokemon name and type display on each card

### Detail Screen
- Detailed view of individual Pokemon with large sprite image
- Color theme matching Pokemon's primary type
- Comprehensive Pokemon information including:
  - Name and Type
  - Height and Weight
  - Type effectiveness and weaknesses
  - Evolution chain information
  - Previous and next evolution details
- Decorative Pokeball background effect
- Smooth animations and transitions

### Technical Features
- Efficient image caching using CachedNetworkImage
- High-quality Pokemon sprites from PokeAPI
- Responsive design that adapts to different screen sizes
- Error handling and loading states
- Clean and maintainable code structure

## Data Source
- Pokemon data from PokemonGO-Pokedex JSON API
- High-quality Pokemon artwork from PokeAPI

## Dependencies
- `cached_network_image`: For efficient image loading and caching
- `http`: For API requests
- `flutter/material.dart`: For Material Design widgets
- `flutter/cupertino.dart`: For iOS-style widgets

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

## Requirements
- Flutter SDK
- Dart SDK
- Internet connection for loading Pokemon data and images

## Credits
- Pokemon data: [PokemonGO-Pokedex](https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json)
- Pokemon artwork: [PokeAPI](https://github.com/PokeAPI/sprites)
