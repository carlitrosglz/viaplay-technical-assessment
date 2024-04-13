//
//  EntitiesValues.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

struct Entities {
    struct Tables {
        static let VIAPLAY_SECTION = "ViaplaySection"
        static let VIAPLAY_SECTION_DETAIL = "ViaplaySectionDetail"
    }
    
    struct Columns {
        struct Generic {
            static let ID = "id"
        }
        
        struct ViaplaySection {
            static let TITLE = "title"
            static let URI = "uri"
        }
        
        struct ViaplaySectionDetail {
            static let TITLE = "title"
            static let DESCRIPTION = "desc"
        }
    }
}
