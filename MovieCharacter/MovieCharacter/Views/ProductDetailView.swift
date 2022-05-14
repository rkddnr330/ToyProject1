//
//  ProductDetailView.swift
//  MovieCharacter
//
//  Created by Park Kangwook on 2022/05/13.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        VStack{
            productImage
            orderView
        }
        .edgesIgnoringSafeArea(.top)
    }
}
 
private extension ProductDetailView {
    var productImage: some View {
        ///이미지의 크기가 전부 다르기 때문에 화면에 나타내보이는 걸 동일하게 해주기 위해 GeometryReader로 감싸준다
        GeometryReader { geo in
            Image(product.ImageName)
                .resizable()
                .scaledToFill()
                ///사진을 띄울 때 기준을 중앙으로 맞춰준다
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
        }
    }
    

    var orderView: some View {
        GeometryReader {
            VStack(alignment: .leading) {
                productDescription //영화제목과 즐겨찾기 버튼 이미지 추가
                Spacer()
                priceInfo // 가격
                orderButton // 주문버튼
            }
            .frame(height: $0.size.height + 10)
            .padding(30)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: -5)
        }
    }
    
    var productDescription: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(product.name)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "heart") // 즐겨찾기 버튼
                    .font(.title2)
                    .foregroundColor(.lightRed)
                    .frame(width: 32, height: 32)
            }    ///splitText : 한 문장으로 길게 구성된 텍스트를 화면에 적장하게 나타내기위해 두 줄로 나누워 주는 기능. 밑에서 함수 선언해줘야 함
            Text(splitText(product.description)) //상품 설명
                .foregroundColor(.gray)
        }
    }
    ///splitText 함수
    func splitText(_ text: String) -> String {
        guard !text.isEmpty else { return text }
        let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
            ?? text[centerIdx...].firstIndex(of: " ")
            ?? text.index(before: text.endIndex)
        let afterSpaceIdx = text.index(after: centerSpaceIdx)
        let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
        return String(lhsString + "\n" + rhsString)
    }
    
    var priceInfo: some View {
        HStack {
            Text("￦") + Text("\(product.price)").font(.title).fontWeight(.medium)
            Spacer()
        }
        .foregroundColor(.black)
    }
    
    var orderButton: some View {
        Button(action: {
            // some action
        }) {
            Capsule()
                .fill(Color.lightRed)
                // 너비는 주어진 공간을 최대로 사용, 높이는 최소30, 최대 60으로 지정
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 60)
                .overlay(Text("주문하기")
                            .font(.system(size: 23)).fontWeight(.medium)
                            .foregroundColor(.white))
                
                .padding(.vertical, 10)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product.productList[0])
    }
}
