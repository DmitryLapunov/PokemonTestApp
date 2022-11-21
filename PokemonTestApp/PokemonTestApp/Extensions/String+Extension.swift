//
//  String+Extension.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation

extension String {
    
    /// Method to format raw String network output into a readable String
    
    func formatNetworkOutput() -> String {
        guard self.contains("-") else { return self.capitalized }
        let formattedString = self.components(separatedBy: "-").map({ $0.capitalized }).joined(separator: " ")
        return formattedString
    }
}
