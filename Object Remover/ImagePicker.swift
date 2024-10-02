//
//  ImagePicker.swift
//  Object Remover
//
//  Created by SABBIR HOSSAIN on 2/10/24.
//

import SwiftUI
import UIKit

// Step 1: Wrapper for UIImagePickerController
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    // Step 2: Create a Coordinator to manage the picker
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let parent: ImagePicker
    
    init(_ parent: ImagePicker) {
        self.parent = parent
    }
    
    // When the user picks an image, update the state and dismiss the picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            parent.selectedImage = image
        }
        parent.presentationMode.wrappedValue.dismiss()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.presentationMode.wrappedValue.dismiss()
    }
}
