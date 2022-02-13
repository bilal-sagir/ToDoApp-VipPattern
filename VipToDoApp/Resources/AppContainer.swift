//
//  AppContainer.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

let appContainer = AppContainer()

class AppContainer{
    let service: CoreDataServiceProtocol = CoreDataRepo()
    let service2: LocalNotificationServiceProtocol = LocalNotificationManager()
    let router = AppRouter()
}
