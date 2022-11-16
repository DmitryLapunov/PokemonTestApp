//
//  PokemonListViewController+CollectionView.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

// MARK: - UICollectionViewDelegateFlowLayout methods

extension PokemonListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: controllerView.frame.width - 32, height: 45)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset - height
        if distanceFromBottom < height {
            presenter?.loadPokemonData()
        }
    }
}

// MARK: - UICollectionViewDataSource methods

extension PokemonListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCell.reuseIdentifier, for: indexPath)
        let pokemonCell = cell as? PokemonListCell
        pokemonCell?.setupCell(pokemons[indexPath.row])
        return pokemonCell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonId = pokemons[indexPath.row].id
        presenter?.loadPokemonDetails(pokemonId: pokemonId)
    }
}
