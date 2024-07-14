//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Simon Ng on 10/7/2023.
//

import SwiftUI

struct ContentView: View {
    
    var articles = [Article(headerImageName: "cafedeadend",
                             title:"The comprehensive Guide to the State",
                             author:"Cliff", rating: 5,
                             description: "gjriehgpirepgre hiorhegoiherog rghiegriigpoegriegre gregregergregg"),
                    Article(headerImageName: "homei",
                                title:"The comprehensive Guide to the State",
                                author:"Cliff", rating: 5,
                                description: "gjriehgpirepgre hiorhegoiherog rghiegriigpoegriegre gregregergregg"),
                    Article(headerImageName: "teakha",
                                title:"The comprehensive Guide to the State",
                                author:"Cliff", rating: 5,
                                description: "gjriehgpirepgre hiorhegoiherog rghiegriigpoegriegre gregregergregg")
    ]
    
    var body: some View {
        List(articles) { article in
            ForEach(articles.indices, id: \.self) { index in
                FullImageRow(article: self.articles[index])
            }
            
            .listRowSeparator(.hidden)
        }
//        .background {
//            Image("homei")
//                .resizable()
//                .scaledToFill()
//                .clipped()
//                .ignoresSafeArea()
//        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ContentView()
}

struct Article: Identifiable {
    var id = UUID()
    var headerImageName: String
    var title: String
    var author: String
    var rating: Int
    var description: String
}

struct FullImageRow: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading,spacing: 6) {
            Image(article.headerImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(5)
            
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(.black)
            Text("BY \(article.author)")
                .foregroundStyle(.gray)
            HStack {
                ForEach(1...(article.rating), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }
            Text("\(article.description)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}


