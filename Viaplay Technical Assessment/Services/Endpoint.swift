//
//  Endpoint.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

struct Endpoint: Equatable {
    let path: String
    let method: String


    private init(path: String,
                 method: String = "GET") {
        self.path = path
        self.method = method
    }
    
    static let sectionList = Endpoint(path: "/ios-se")

//    static let mangaList = Endpoint(path: "/list/mangas", paginated: true)
//    static let bestMangaList = Endpoint(path: "/list/bestMangas", paginated: true)
//    static let customSearch = Endpoint(path: "/search/manga", method: "POST", paginated: true)
//    static let searchById = Endpoint(path: "/search/manga")
//    static let authorsList = Endpoint(path: "/list/authors")
//    static let genresList = Endpoint(path: "/list/genres")
//    static let themesList = Endpoint(path: "/list/themes")
//    static let demographicsList = Endpoint(path: "/list/demographics")
//    static let registerUser = Endpoint(path: "/users", method: "POST", needsAppToken: true)
//    static let loginUser = Endpoint(path: "/users/login", method: "POST")
//    static let tokenRenew = Endpoint(path: "/users/renew", method: "POST", needsUserToken: true)
//    static let fetchItems = Endpoint(path: "/collection/manga", needsUserToken: true)
//    static let insertItem = Endpoint(path: "/collection/manga", method: "POST", needsUserToken: true)
//    static let removeItem = Endpoint(path: "/collection/manga", method: "DELETE", needsUserToken: true)
}
