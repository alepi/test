//
//  DetailView.swift
//  SwiftUITest
//
//  Created by yawmoo_ext on 09/11/22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var item: Item
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Rectangle()
                .foregroundColor(.green).cornerRadius(10)
            Text(item.name)
                .padding(100)
                .background(.white)
                .font(.caption)
                .cornerRadius(5)
                .offset(x: -5, y: -5)
            Button("Set Item") {
                item.name = "pippo"
                item.price = 50.0
            }
            .font(.headline).background(.blue)
            .foregroundColor(.yellow)
            .cornerRadius(5)
            .offset(x: -15, y: -15)
        }
        .navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline)
            .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView()
                .environmentObject(Item())
        }
    }
}
