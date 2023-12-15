import 'dart:convert';
import 'package:flutter_pharmacies_2023/models/pharmacie.dart';
import 'package:http/http.dart' as http;

class PharmacieService {
  final String baseUrl = 'http://localhost:3000/pharmacies';

  Future<List<Pharmacie>> chargerPharmacies() async {
    try {
      final reponse = await http.get(Uri.parse(baseUrl));

      if (reponse.statusCode == 200) {
        final List<dynamic> donnees = json.decode(reponse.body);
        return donnees.map((json) => Pharmacie.fromJson(json)).toList();
      } else {
        throw Exception('Échec du chargement des pharmacies');
      }
    } catch (e) {
      throw Exception('Une erreur s\'est produite: $e');
    }
  }
// Ajouter les méthodes creerPharmacie et supprimerPharmacie
  /* Future<Pharmacie> creerPharmacie(Pharmacie pharmacie) async {
    
  }*/

  Future<void> supprimerPharmacie(String id) async {}
}
