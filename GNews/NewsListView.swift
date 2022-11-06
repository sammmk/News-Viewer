//
//  NewsListView.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/03.
//
import SwiftUI
import Combine
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
    @StateObject var viewModel = NewsViewModel(service: NewsService())
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
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView {
                    List {
                        ForEach(articles, id: \.id) { item in
                            NavigationLink(destination: WebView(newsItemUrl: URL(string: item.url)!)
                                .navigationTitle(Text(item.title))
                            ) {
                                NewsItemView(article: item)
                            }
                        }
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }
        .onAppear(perform: viewModel.getArticles)
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
