//
//  ElmenusRealmService.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import RealmSwift


class ElmenusDataBaseWorker {
    
    static let shared = ElmenusDataBaseWorker()
    
    private func creatRealm() throws -> Realm? {
        guard let defaultUrl = Realm.Configuration.defaultConfiguration.fileURL else {return nil}
        let config = Realm.Configuration(
            fileURL: defaultUrl.deletingLastPathComponent().appendingPathComponent("Elmenus.realm"),
            deleteRealmIfMigrationNeeded: true,
            objectTypes: [TagEntity.self, ItemEntity.self]
        )
        
        return try Realm(configuration: config)
    }
    
    func saveEntities(_ itemEntities: [ItemEntity]) {
            do {
                let realm = try creatRealm()
                try realm?.safeWrite {
                    realm?.add(itemEntities, update: .modified)
                }
            } catch {
                print("ElmenusDataBaseService.saveEntities can't save Items")
            }
    }
    
    func saveEntities(_ tagEntities: [TagEntity]) {
            do {
                let realm = try creatRealm()
                try realm?.safeWrite {
                    realm?.add(tagEntities, update: .modified)
                }
            } catch {
                print("ElmenusDataBaseService.saveEntities can't save Tags")
            }
    }
    
    func loadItems() -> [Item] {
        do {
            let realm = try creatRealm()
            guard let entites = realm?.objects(ItemEntity.self) else { return [] }
            return entites.map{$0.object}
        } catch {
            print("ElmenusDataBaseService.saveEntities can't save Tags")
            return []
        }
    }
    
    func loadTags() -> [Tag] {
        do {
            let realm = try creatRealm()
            guard let entites = realm?.objects(TagEntity.self) else { return [] }
            return entites.map{$0.object}
        } catch {
            print("ElmenusDataBaseService.saveEntities can't save Tags")
            return []
        }
    }
    
}
