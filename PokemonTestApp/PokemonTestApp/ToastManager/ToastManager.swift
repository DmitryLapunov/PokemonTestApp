//
//  ToastManager.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 8.11.22.
//

import Foundation
import SwiftEntryKit

protocol ToastManagerProtocol: AnyObject {
    func displayToast(toastMessage: String)
}

class ToastManager: ToastManagerProtocol {
    func displayToast(toastMessage: String) {
        let customToast = CustomToast()
        customToast.setupCustomToast(toastMessage: toastMessage)
        var attributes = EKAttributes()
        attributes.windowLevel = .normal
        attributes.precedence = .override(priority: .max, dropEnqueuedEntries: true)
        attributes.displayDuration = 5
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.positionConstraints.verticalOffset = 40
        SwiftEntryKit.display(entry: customToast, using: attributes)
    }
}
