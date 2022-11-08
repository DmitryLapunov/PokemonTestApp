//
//  PokemonListViewController+CollectionView.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

extension PokemonListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: controllerView.frame.width - 32, height: 45)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !isShimmerRequested {
            let height = scrollView.frame.size.height
            let contentYoffset = scrollView.contentOffset.y
            let distanceFromBottom = scrollView.contentSize.height - contentYoffset - 100
            if distanceFromBottom < height {
                presenter.loadPokemonData()
            }
        }
    }
}

extension PokemonListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isShimmerRequested ? 20 : pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isShimmerRequested {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListShimmerCell.reuseIdentifier, for: indexPath)
            let shimmerCell = cell as? PokemonListShimmerCell
            shimmerCell?.setupShimmerAnimation()
            return shimmerCell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCell.reuseIdentifier, for: indexPath)
            let pokemonCell = cell as? PokemonListCell
            pokemonCell?.setupCell(pokemons[indexPath.row])
            return pokemonCell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isShimmerRequested {
            let pokemonDetailsBuilder = PokemonDetailsBuilder()
            let pokemonDetailsViewController = pokemonDetailsBuilder.build(pokemonId: pokemons[indexPath.row].id)
            navigationController?.pushViewController(pokemonDetailsViewController, animated: true)
        }
    }
}
