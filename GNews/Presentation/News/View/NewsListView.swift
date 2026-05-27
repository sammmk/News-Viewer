//
//  NewsListView.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/03.
//
import SwiftUI
///
// MARK: -------------------------
///
///
///
struct NewsListView: View {
    ///
    // MARK: ------------------------- Properties
    ///
    ///
    @StateObject var viewModel = NewsViewModel()
    ///
    // MARK: ------------------------- View
    ///
    ///
    ///
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failure(let error):
                ErrorView(error: error, handler: { Task { await viewModel.getArticles() } })
            case .success(let articles):
                NavigationView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(articles, id: \.id) { item in
                                NavigationLink(destination: WebView(newsItemUrl: URL(string: item.url)!)
                                    .navigationTitle(Text(item.title))
                                ) {
                                    GeometryReader { geo in
                                        Color.clear
                                        NewsItemView(article: item)
                                            .rotation3DEffect(
                                                Angle(degrees: (Double(geo.frame(in: .global).minX)) / -12),
                                                axis: (x: 0, y: 10, z: 0))
                                    }
                                    .frame(width: 265, height: 600)
                                }
                                .listRowSeparator(.hidden, edges: [.bottom])
                            }
                        }
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }
        .task { await viewModel.getArticles() }
    }
}
///
///
///
struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
