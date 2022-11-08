//
//  Item.swift
//  APITest
//
//  Created by yawmoo_ext on 08/11/22.
//

import Foundation

// notice: here I have not messed around with naming of variables, as it would take me too much time.
// also, all variables are optional as I have no time for testing which is and which isn't by trying all the possible data that can arrive

struct Constituent : Decodable {
    let constituentID: Int?
    let role: String?
    let name: String?
    let constituentULAN_URL: String?
    let constituentWikidata_URL: String?
    let gender: String?
}

struct ElementMeasurement : Decodable {
    let Height: Double?
    let Width: Double?
}

struct Measurement : Decodable {
    let elementName: String?
    let elementDescription: String??
    let elementMeasurements: ElementMeasurement?
}

struct Tag : Decodable {
    let term: String?
    let AAT_URL: String?
    let Wikidata_URL: String?
}


struct Item : Decodable {
    let objectID: Int?
    let isHighlight: Bool?
    let accessionNumber: String?
    let accessionYear: String?
    let isPublicDomain: Bool?
    let primaryImage: String?
    let primaryImageSmall: String?
    let additionalImages: [String]?
    let constituents: [Constituent]?
    let department: String?
    let objectName: String?
    let title: String?
    let culture: String?
    let period: String?
    let dynasty: String?
    let reign: String?
    let portfolio: String?
    let artistRole: String?
    let artistPrefix: String?
    let artistDisplayName: String?
    let artistDisplayBio: String?
    let artistSuffix: String?
    let artistAlphaSort: String?
    let artistNationality: String?
    let artistBeginDate: String?
    let artistEndDate: String?
    let artistGender: String?
    let artistWikidata_URL: String?
    let artistULAN_URL: String?
    let objectDate: String?
    let objectBeginDate: Int?
    let objectEndDate: Int?
    let medium: String?
    let dimensions: String?
    let measurements: [Measurement]?
    let creditLine: String?
    let geographyType: String?
    let city: String?
    let state: String?
    let county: String?
    let country: String?
    let region: String?
    let subregion: String?
    let locale: String?
    let locus: String?
    let excavation: String?
    let river: String?
    let classification: String?
    let rightsAndReproduction: String?
    let linkResource: String?
    let metadataDate: String?
    let repository: String?
    let objectURL: String?
    let tags: [Tag]?
    let objectWikidata_URL: String?
    let isTimelineWork: Bool?
    let GalleryNumber: String?

    static func from(data: Data) -> Item? {
        return try? JSONDecoder().decode(Item.self, from: data)
    }

}
