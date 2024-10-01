//
//  HomeView.swift
//  Object Remover
//
//  Created by SABBIR HOSSAIN on 1/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var sliderValue: Double = 0.5
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Image("img")
                    .resizable()
                    .ignoresSafeArea()
                Spacer(minLength: 50)
                Slider(value: $sliderValue, in: 0...1)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                Spacer(minLength: 50)
                ButtonRowView()
                Spacer(minLength: 50)
            }
        }
        .ignoresSafeArea()
    }
    
}

struct ButtonRowView: View {
    var body: some View {
        HStack(spacing: 40) {
            ButtonView(imageName: "photo") {
                debugPrint("Tapped photo")
            }
            
            ButtonView(imageName: "arrowshape.turn.up.backward.fill") {
                debugPrint("Tapped photo")
            }
            
            ButtonView(imageName: "eye") {
                debugPrint("Tapped photo")
            }
            
            ButtonView(imageName: "square.and.arrow.down") {
                debugPrint("Tapped photo")
            }
        }
    }
}

struct ButtonView: View {
    @State var imageName = ""
    var onTapped: (()->Void)
    var body: some View {
        Button(action: {
            debugPrint("test")
            onTapped()
        }, label: {
            Image(systemName: imageName)
                .foregroundColor(.white)
        })
    }
}

#Preview {
    HomeView()
}
