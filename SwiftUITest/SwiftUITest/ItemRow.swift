//
//  ItemRow.swift
//  SwiftUITest
//
//  Created by yawmoo_ext on 09/11/22.
//

import SwiftUI

struct ItemRow: View {
    let item: String
    var body: some View {
        HStack {
            Image(systemName: "globe").frame(width: 30, height: 30).scaledToFit().clipShape(Circle()).overlay(Circle().stroke(.gray, lineWidth: 1)).background(.pink)
            Spacer()
            Text(item).font(.title)
        }.padding().background(.yellow)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: "hi")
    }
}

