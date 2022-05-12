//
//  ColorExtension.swift
//  MovieCharacter
//
//  Created by Park Kangwook on 2022/05/12.
//

///ColorExtension,swift 이 파일은 무엇인가?
///SwiftUI에서 색깔을 지칭하는 HEX 코드를 그냥 사용할 수 없다. -> swift에게 인식시키기 위해 가공시켜줘야한다는 말!
///값을 추출해 변환하는 기능, 즉 HEX 코드를 입력받아 swift가 알아먹는 Color 타입을 만들어내는  파일이다.
import SwiftUI
 
extension Color {
    ///이 앱에서 자주 쓰이는 색을 따로 추가해줬다.
    static let lightRed = Color(hex: "c64756")
    static let DarkGreen = Color(hex: "00587a")
    static let deepgray = Color(hex: "6e6e6e")
    static let primartShadow = Color.primary.opacity(0.5)
    static let background = Color(UIColor.systemGray6)
}
 
extension Color {
    
    //헥스(HEX) 코드 활용
    init(hex: String) {
        let scanner = Scanner(string: hex) // 문자열 파서 역할을 하는 클래스
        _ = scanner.scanString("#") // scanString은 iOS 13부터 지원.
        
        var rgb: UInt64 = 0
        //문자열을 Int64 타입으로 변환해 rgb 변수에 저장. 변환할 수 없다면 0을 반환함
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0   // 좌측 문자열 2개 추출
        let g = Double((rgb >> 8) & 0xFF) / 255.0    // 중간 문자열 2개 추출
        let b = Double((rgb >> 0) & 0xFF) / 255.0    // 우측 문자열 2개 추출
        self.init(red: r, green: g, blue: b)
        
    }
 }
