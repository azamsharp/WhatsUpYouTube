//
//  String+Extensions.swift
//  WhatsUp
//
//  Created by Mohammad Azam on 3/13/23.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
