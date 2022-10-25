//
//  LineParserProtocol.swift
//  Minicron
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

protocol LineParserProtocol {
    
    func parse(line: String) -> MinicronEntry?
    
}
