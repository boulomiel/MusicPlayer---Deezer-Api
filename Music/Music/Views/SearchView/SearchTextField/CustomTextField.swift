//
//  CustomTextField.swift
//  Music
//
//  Created by Ruben Mimoun on 02/08/2021.
//

import Foundation
import SwiftUI

struct CustomTextField : UIViewRepresentable{
    
    
    @ObservedObject var textObserver : MusicViewModel
    let textField =  UITextField()
 
    
    func makeUIView(context: Context) -> UITextField {
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        // update
        uiView.textColor = .white
        uiView.font = UIFont(name: "HelveticaNeue-Medium", size: 17)
        uiView.tintColor = .white

    }
    
    func makeCoordinator() -> Coordinator {
        let coordinator =  Coordinator(observer: textObserver)
        return coordinator
    }
    
    typealias UIViewType = UITextField
    
    
    class Coordinator : NSObject, UITextFieldDelegate {
        var textObserver : MusicViewModel?
        
         init(observer : MusicViewModel ) {
            self.textObserver = observer
        }
        
        
        
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            guard let text = textField.text  else {return}
            textObserver?.searchData(query: text)
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 40
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
        }
        
    }
    
}
