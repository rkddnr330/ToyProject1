//
//  ProductRowView.swift
//  MovieCharacter
//
//  Created by Park Kangwook on 2022/05/12.
//

import SwiftUI

struct ProductRowView: View {
    
    var body: some View {
        HStack {
            productImage
            productDescription
        }
        .frame(height: 150)
        ///Color.primary : 다크모드, 라이트모드에 맞게 알아서 색상 설정
        .background(Color.primary.colorInvert())
        ///꼭짓점 둥글게
        .cornerRadius(10)
        ///shadow의 color도 Color.primary로 줬음 + .opacity : 투명도
        .shadow(color: Color.primary.opacity(0.3), radius: 1, x: 2, y: 2)
        .padding(.vertical, 10)
    }
}

private extension ProductRowView {
    var productImage: some View {
        Image("Sosuke")
            .resizable()
        /// .aspectRatio(contentMode: .fit)이랑 동등함
            .scaledToFit()
        ///속한 프레임을 넘어가면 자르는듯? 정확히 뭔지 몰겠
            .clipped()
            .frame(width: 150)
    }
    
    var productDescription: some View {
    //        HStack{
            VStack(alignment: .leading){
                HStack{
                    Text("소스케")
                        .font(.headline)
                        .fontWeight(.medium)
                    Spacer()
                    Text("벼랑 위의 포뇨")
                    ///.footnote : caption보다 살~짝 더 큼
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                Text("5살 남자 아이. 본작품의 주인공. 벼랑 위에 있는 2~3층 정도 되는 주택에서 엄마와 함께 살고 있다.")
                    .padding(.vertical)
                    .font(.body)
                ///foregroundColor가 .secondary다. 아주 직관적인 색 이름
                    .foregroundColor(.secondary)
                ///.lineLimit(2) : 2줄만 표시하겠다
                    .lineLimit(2)

                footerView
            }
    }
    
    var footerView: some View {
        HStack{
            ///굉장히 재밌는 TEXT표시. 각각 다른 font & +로 합쳐줌
            Text("$ ").font(.footnote) + Text("300").font(.headline)
            Spacer()
            Image(systemName: "heart")
                .foregroundColor(.red)
            Image(systemName: "cart")
                .foregroundColor(.red)
        }
    }
}



struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView()
    }
}
