//
//  PlaceholderImageView.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/06.
//
import SwiftUI
///
// MARK: ------------------------- PlaceholderImageView
///
///
///
struct PlaceholderImageView: View {
    ///
    // MARK: ------------------------- View
    ///
    ///
    ///
    var body: some View {
        Image(systemName: "photo.fill")
            .font(.system(size: 100))
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
            .cornerRadius(10)
    }
}
///
///
///
//struct PlaceholderImageView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        PlaceholderImageView()
//    }
//}
