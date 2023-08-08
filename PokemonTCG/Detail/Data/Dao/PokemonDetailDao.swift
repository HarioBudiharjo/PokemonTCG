//
//  PokemonDetailDao.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 08/08/23.
//

import Foundation

// MARK: - PokemonDetailDAO
struct PokemonDetailDAO: Codable {
    var data: DataClass?
    
    // MARK: - DataClass
    struct DataClass: Codable {
        var id, name, supertype: String?
        var subtypes: [String]?
        var hp: String?
        var types: [String]?
        var evolvesFrom: String?
        var abilities: [Ability]?
        var attacks: [Attack]?
        var weaknesses: [Weakness]?
        var retreatCost: [String]?
        var convertedRetreatCost: Int?
        var dataSet: Set?
        var number, artist, rarity: String?
        var nationalPokedexNumbers: [Int]?
        var legalities: Legalities?
        var images: DataImages?
        var tcgplayer: Tcgplayer?
        var cardmarket: Cardmarket?

        enum CodingKeys: String, CodingKey {
            case id, name, supertype, subtypes, hp, types, evolvesFrom, abilities, attacks, weaknesses, retreatCost, convertedRetreatCost
            case dataSet = "set"
            case number, artist, rarity, nationalPokedexNumbers, legalities, images, tcgplayer, cardmarket
        }
    }

    // MARK: - Ability
    struct Ability: Codable {
        var name, text, type: String?
    }

    // MARK: - Attack
    struct Attack: Codable {
        var name: String?
        var cost: [String]?
        var convertedEnergyCost: Int?
        var damage, text: String?
    }

    // MARK: - Cardmarket
    struct Cardmarket: Codable {
        var url: String?
        var updatedAt: String?
        var prices: [String: Double]?
    }

    // MARK: - Set
    struct Set: Codable {
        var id, name, series: String?
        var printedTotal, total: Int?
        var legalities: Legalities?
        var ptcgoCode, releaseDate, updatedAt: String?
        var images: SetImages?
    }

    // MARK: - SetImages
    struct SetImages: Codable {
        var symbol, logo: String?
    }

    // MARK: - Legalities
    struct Legalities: Codable {
        var unlimited: String?
    }

    // MARK: - DataImages
    struct DataImages: Codable {
        var small, large: String?
    }

    // MARK: - Tcgplayer
    struct Tcgplayer: Codable {
        var url: String?
        var updatedAt: String?
        var prices: Prices?
    }

    // MARK: - Prices
    struct Prices: Codable {
        var holofoil, reverseHolofoil: Holofoil?
    }

    // MARK: - Holofoil
    struct Holofoil: Codable {
        var low, mid, high, market: Double?
        var directLow: Double?
    }

    // MARK: - Weakness
    struct Weakness: Codable {
        var type, value: String?
    }

}

extension PokemonDetailDAO {
    func mapToDetail() -> PokemonDetail {
        return PokemonDetail(id: self.data?.id ?? "", name: self.data?.name ?? "", abilities: self.data?.abilities?.first?.text ?? "", attack: self.data?.attacks?.first?.text ?? "", image: self.data?.images?.small ?? "")
    }
}
