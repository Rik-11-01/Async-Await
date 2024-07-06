//
//  ContentView.swift
//  CryptoAsyncAwait
//
//  Created by Ritik Raman on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var ShowAlert = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    CoinRowView(coin: coin)
                }
            }
            .onReceive(viewModel.$error, perform: { error in
                if error != nil{
                    ShowAlert.toggle()
                }
            })
            .alert(isPresented: $ShowAlert, content: {
                Alert(title: Text("Error"),
                      message: Text(viewModel.error?.localizedDescription ?? "")
                )
            })
            .navigationTitle("Live Prices")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
