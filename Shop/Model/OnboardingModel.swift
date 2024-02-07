//
//  OnboardingModel.swift
//  Shop
//
//  Created by Maxwell on 06/02/2024.
//

import Foundation
import SwiftUI

struct OnboardingModel: Identifiable {
    let id: UUID
    let title: String
    let description: String
    let tag: String
    let color: Color
}

var onboardItems : [OnboardingModel] = [
    OnboardingModel(id: UUID(), title: "\(Constants.introTitle1)",description: "\(Constants.introText1)", tag: "\(Constants.introtag1)", color: Constants.appColors.appPrimary),
    OnboardingModel(id: UUID(), title: "\(Constants.introTitle2)",description: "\(Constants.introText2)", tag: "\(Constants.introtag2)", color: Constants.appColors.appBlack),
    OnboardingModel(id: UUID(), title: "\(Constants.introTitle3)",description: "\(Constants.introText3)", tag: "\(Constants.introtag3)", color: Constants.appColors.appSecondary)
    
]
