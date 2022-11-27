//
//  ErrorView.swift
//  GNews
//
//  Created by Mohan Kurera on 2022/11/06.
//
import SwiftUI
///
// MARK: ------------------------- ErrorView
///
///
///
struct ErrorView: View {
    ///
    // MARK: ------------------------- Properties
    ///
    ///
    typealias ErrorViewActionHandler = () -> Void
    let error: Error
    let handler: ErrorViewActionHandler
    ///
    // MARK: ------------------------- Life cycle
    ///
    ///
    ///
    internal init(
        error: Error,
        handler: @escaping ErrorView.ErrorViewActionHandler)
    {
        self.error = error
        self.handler = handler
    }
    ///
    // MARK: ------------------------- View
    ///
    ///
    ///
    var body: some View {
        ///
        VStack {
            /// Image for error view
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            /// Text
            Text("Ohhh Nooo")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .multilineTextAlignment(.center)
            /// Error message
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            /// Retry button
            Button(action: {
                handler()
            }, label: {
                Text("Retry")
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy))
            .cornerRadius(10)
        }
    }
}
///
///
///
//struct ErrorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorView(error: APIError.decodingError) {}
//            .previewLayout(.sizeThatFits)
//    }
//}
