//
//  HomeVC.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 06/08/23.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let pokemon = ListPokemon(name: "", image: "", id: "")
    
    var pokemons: [ListPokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: PokemonListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PokemonListCell.self))
        self.tableView.dataSource = self
        self.title = "PokemonTCG"
        self.pokemons = [pokemon,pokemon,pokemon,pokemon]
        let rightBarButton = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(goToSearchPage))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func goToSearchPage() {
        let vc = SearchVC(nibName: String(describing: SearchVC.self), bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonListCell.self), for: indexPath) as! PokemonListCell
        cell.setView(data: pokemons[indexPath.row])
        return cell
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRowData = pokemons[indexPath.row]
        let vc = DetailVC(nibName: String(describing: DetailVC.self), bundle: nil)
        vc.data = selectedRowData
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
