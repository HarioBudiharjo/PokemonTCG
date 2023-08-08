//
//  PokemonDao.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 07/08/23.
//

import Foundation

// MARK: - PokemonDAO
struct PokemonDAO: Codable {
    var data: [Datum]?
    var page, pageSize, count, totalCount: Int?
    
    
    // MARK: - Datum
    struct Datum: Codable {
        var id, name, supertype: String?
        var subtypes: [String]?
        var level, hp: String?
        var types: [String]?
        var evolvesFrom: String?
        var abilities: [Ability]?
        var attacks: [Attack]?
        var weaknesses, resistances: [Resistance]?
        var retreatCost: [String]?
        var convertedRetreatCost: Int?
        var datumSet: Set?
        var number, artist, rarity, flavorText: String?
        var nationalPokedexNumbers: [Int]?
        var legalities: Legalities?
        var images: DatumImages?
        var tcgplayer: Tcgplayer?
        var cardmarket: Cardmarket?

        enum CodingKeys: String, CodingKey {
            case id, name, supertype, subtypes, level, hp, types, evolvesFrom, abilities, attacks, weaknesses, resistances, retreatCost, convertedRetreatCost
            case datumSet = "set"
            case number, artist, rarity, flavorText, nationalPokedexNumbers, legalities, images, tcgplayer, cardmarket
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

    // MARK: - DatumImages
    struct DatumImages: Codable {
        var small, large: String?
    }

    // MARK: - Resistance
    struct Resistance: Codable {
        var type, value: String?
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

}

extension PokemonDAO {
    func mapToListPokemon() -> [ListPokemon] {
        var datas: [ListPokemon] = []
        self.data?.forEach({ data in
            let model = ListPokemon(id: data.id ?? "", name: data.name ?? "", image: data.images?.small)
            datas.append(model)
        })
        
        return datas
    }
    
    func mapToPage() -> PageModel {
        return PageModel(page: self.page ?? 0, pageSize: self.pageSize ?? 0, count: self.count ?? 0, totalCount: self.totalCount ?? 0)
    }
}
