//
//  SearchVC.swift
//  PokemonTCG
//
//  Created by Hario Budiharjo on 07/08/23.
//

import UIKit
import RxSwift

class SearchVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmenControl: UISegmentedControl!
    
    var index = 0
    var search = ""
    
    var pokemons: [ListPokemon] = []
    let viewModel = SearchViewModel()
    let disposeBag = DisposeBag()
    
    var page = 1
    
    var same = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: PokemonListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PokemonListCell.self))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.title = "Search"

        segmenControl.selectedSegmentIndex = 0
        segmenControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        
        self.setupObserver()
    }
    
    func setupObserver() {
        self.viewModel.listPokemon.compactMap { $0 }.subscribe { pokemonData in
            if self.same {
                self.pokemons.append(contentsOf: pokemonData.pokemons)
            } else {
                self.pokemons = pokemonData.pokemons
            }
            self.same = true
            self.tableView.reloadData()
        }.disposed(by: disposeBag)
        
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.index = 0
        case 1:
            self.index = 1
        case 2:
            self.index = 2
        default:
            self.index = 0
        }
        self.same = false
        self.viewModel.getListPokemon(page: page, search: search, option: index)
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.search = searchText
        self.same = false
        self.viewModel.getListPokemon(page: page, search: search, option: index)
     }
}


extension SearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonListCell.self), for: indexPath) as! PokemonListCell
        cell.setView(data: pokemons[indexPath.row])
        return cell
    }
}

extension SearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRowData = pokemons[indexPath.row]
        let vc = DetailVC(nibName: String(describing: DetailVC.self), bundle: nil)
        vc.data = selectedRowData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = pokemons.count - 1
        if indexPath.row == lastElement {
            page += 1
            self.viewModel.getListPokemon(page: page, search: search, option: index)
        }
    }
}
