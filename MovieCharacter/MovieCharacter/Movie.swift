//
//  Movie.swift
//  MovieCharacter
//
//  Created by Park Kangwook on 2022/05/13.
//

import Foundation
 
///이 앱의 전반적인 데이터를 관리할 Movie 타입 선언, 이 안에 상품 데이터 보관
final class Movie {
  var products: [Product]
  
  // MARK: Initialization
                          //Json 파일명 입력
  init(filename: String = "ProductData.json") {
    self.products = Bundle.main.decode(filename: filename, as: [Product].self)
  }
}
