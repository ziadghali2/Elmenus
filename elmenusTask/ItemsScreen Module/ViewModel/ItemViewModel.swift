//
//  ItemViewModel.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

class ItemViewModel {
    
    //MARK: - Attributes
    var name: String
    var photoURL: URL?
    var description: String
    
    //MARK: - init
    init(_ name: String,_ photoURL: String,_ description: String) {
        if let prettyName = name.components(separatedBy: "- ").last {
            self.name = prettyName
        } else {
            self.name = ""
        }
        do {
            self.photoURL = try photoURL.asURL()
        } catch {
            self.photoURL = nil
            print("photoURL parameter not as URL")
        }
        self.description = description
    }
}
