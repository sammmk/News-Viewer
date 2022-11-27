//
//  WebView.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/06.
//
import SafariServices
import SwiftUI
///
// MARK: -------------------------
///
///
///
struct WebView: UIViewControllerRepresentable {
    ///
    // MARK: -------------------------  Properties
    ///
    ///
    let newsItemUrl: URL
    ///
    //  MARK: -------------------------  Methods
    ///
    ///
    ///
    func makeUIViewController
    (
        context: UIViewControllerRepresentableContext<WebView>
    ) -> SFSafariViewController
    {
        return SFSafariViewController(url: newsItemUrl)
    }
    ///
    ///
    ///
    func updateUIViewController
    (
        _ uiViewController: SFSafariViewController,
        context: UIViewControllerRepresentableContext<WebView>
    )
    {
        
    }
}
