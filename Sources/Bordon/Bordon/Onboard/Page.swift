//
//  Page.swift
//  Bordon
//
//  Created by Maxim Butin on 16.02.2022.
//

import UIKit

public struct Page: Equatable {
    
    let title: TextModel
    let description: TextModel
    let image: ImageViewModel
    let nextButton: ButtonModel
    let actionButton: ButtonModel
    
    public init(title: TextModel,
                description: TextModel,
                image: ImageViewModel,
                nextButton: ButtonModel,
                actionButton: ButtonModel) {
        self.title = title
        self.description = description
        self.image = image
        self.nextButton = nextButton
        self.actionButton = actionButton
    }
}
