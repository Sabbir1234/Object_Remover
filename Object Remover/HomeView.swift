//
//  HomeView.swift
//  Object Remover
//
//  Created by SABBIR HOSSAIN on 1/10/24.
//

import SwiftUI

struct HomeView: View {
    @State private var sliderValue: Double = 0.5
    @State private var isImagePickerPresented: Bool = false
    @State private var selectedImage: UIImage? = nil
    var body: some View {
        ZStack {
            Color.black
            VStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                                            .resizable()
                                            .scaledToFit()
                                            .ignoresSafeArea()
                } else {
                    Image("img")
                        .resizable()
                        .ignoresSafeArea()
                }
                Spacer(minLength: 50)
                Slider(value: $sliderValue, in: 0...1)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .padding(.bottom, 20)
                ButtonRowView(isImagePickerPresented: $isImagePickerPresented)
                    .padding(.bottom, 60)
                //Spacer()
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $isImagePickerPresented, content: {
            ImagePicker(selectedImage: $selectedImage)
        })
    }
    
}

struct ButtonRowView: View {
    @Binding var isImagePickerPresented: Bool
    var body: some View {
        HStack(spacing: 40) {
            ButtonView(imageName: "photo") {
                debugPrint("Tapped photo")
                isImagePickerPresented = true
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
