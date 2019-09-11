//
//  String.swift
//  Bedrock
//
//  Created by Matt Quiros on 4/18/15.
//  Copyright (c) 2015 Matt Quiros. All rights reserved.
//

import Foundation

extension String {
	
	init(forTypeOf object: Any) {
		self.init(describing: type(of: object))
	}
	
  func hasCharactersFromSet(_ characterSet: CharacterSet) -> Bool {
    if let _ = self.rangeOfCharacter(from: characterSet) {
      return true
    }
    return false
  }
  
  func trim() -> String  {
    return self.trimmingCharacters(in: CharacterSet.whitespaces)
  }
  
}
