//
//  NewsItemView.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/03.
//
import SwiftUI
import URLImage
///
/// In this News Item view, we used `URLImage` is a SwiftUI view
/// that displays an image downloaded from provided URL.
/// [Git repository](https://github.com/dmytro-anokhin/url-image)
/// Use the above link to install this package as a SPM package
///
struct NewsItemView: View {
    ///
    // MARK: ------------------------- Properties
    ///
    ///
    ///
    let article: Article
    ///
    // MARK: ------------------------- View
    ///
    ///
    ///
    var body: some View {
        ///
        HStack {
            if let imageUrl = article.urlToImage,
               let url = URL(string: imageUrl) {
                /// Image for the news item
                /// If there is no image in the provided url,
                /// show the `PlaceholderImageView()`
                URLImage(url) {
                    EmptyView()
                } inProgress: { progress in
                    ProgressView()
                        .frame(width: 100, height: 100)
                } failure: { error, retry in
                    PlaceholderImageView()
                } content: { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
                .environment(
                    \.urlImageOptions,
                     URLImageOptions(fetchPolicy: .returnStoreElseLoad(downloadDelay: 0.25),
                                     loadOptions: [.loadOnAppear, .cancelOnDisappear],
                                     maxPixelSize: CGSize(width: 600.0, height: 600.0)))
            }
            else {
                PlaceholderImageView()
            }
            ///
            VStack(alignment: .leading, spacing: 4) {
                /// Title of the News article
                Text(article.title)
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                /// Source of the News article
                Text(article.source.name)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}
///
///
///
struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
