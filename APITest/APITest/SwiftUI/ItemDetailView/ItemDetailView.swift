//
//  ItemDetailView.swift
//  APITest
//
//  Created by yawmoo_ext on 09/11/22.
//

import UIKit
import SwiftUI
import Combine

struct ItemDetailView: View {
    var item: Item?
    var body: some View {
        NavigationView {
            if let imageURLString = item?.primaryImage, let url = URL(string: imageURLString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
            }
        }.navigationTitle(item?.title ?? "An Item")
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        var result = ItemDetailView()
        result.item = ItemDetailView_Previews.item
        return result
    }
    
    private static let item = Item(objectID: 1, isHighlight: false, accessionNumber: nil, accessionYear: nil, isPublicDomain: false, primaryImage: "https://images.metmuseum.org/CRDImages/as/original/DP251139.jpg", primaryImageSmall: nil, additionalImages: nil, constituents: nil, department: nil, objectName: nil, title: "An Item", culture: nil, period: nil, dynasty: nil, reign: nil, portfolio: nil, artistRole: nil, artistPrefix: nil, artistDisplayName: nil, artistDisplayBio: nil, artistSuffix: nil, artistAlphaSort: nil, artistNationality: nil, artistBeginDate: nil, artistEndDate: nil, artistGender: nil, artistWikidata_URL: nil, artistULAN_URL: nil, objectDate: nil, objectBeginDate: nil, objectEndDate: nil, medium: nil, dimensions: nil, measurements: nil, creditLine: nil, geographyType: nil, city: nil, state: nil, county: nil, country: nil, region: nil, subregion: nil, locale: nil, locus: nil, excavation: nil, river: nil, classification: nil, rightsAndReproduction: nil, linkResource: nil, metadataDate: nil, repository: nil, objectURL: nil, tags: nil, objectWikidata_URL: nil, isTimelineWork: nil, GalleryNumber: nil)
}
