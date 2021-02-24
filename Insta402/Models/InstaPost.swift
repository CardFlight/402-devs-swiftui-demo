//
//  InstaPost.swift
//  Insta402
//
//  Created by Will Taylor on 2/9/21.
//

import Foundation
import SwiftUI

struct InstaPost: Hashable {
    let userName: String
    let date: String
    let locationName: String
    let profileImage: UIImage
    let images: [UIImage]
    let caption: String
}
