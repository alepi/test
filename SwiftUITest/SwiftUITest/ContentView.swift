//
//  ContentView.swift
//  SwiftUITest
//
//  Created by yawmoo_ext on 09/11/22.
//

import SwiftUI

struct Items {
    static let sections = ["One", "Two", "Three"]
    
    static let items = [
        "One":[1,2,3],
        "Two":[1,2,3],
        "Three":[1,2,3],
    ]
}

extension Int : Identifiable {
    public var id: Int {
        self
    }
    public typealias ID = Int
}

extension String : Identifiable {
    public var id: String {
        self
    }
    public typealias ID = String
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Items.sections) {section in
                    Section(header: Text(section)) {
                        
                        if let items = Items.items[section] {
                            ForEach(items) { item in
                                let s = String(item)
                                NavigationLink(destination: DetailView()) {
                                    ItemRow(item: s).padding()
                                }
                            }
                        }
                    }
                }
            }.navigationTitle("Items").listStyle(.insetGrouped)
        }.navigationViewStyle(.stack) // to avoid constraint errors, this is an iOS bug I think
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Item())
    }
}
