//
//  TWSTextFieldView.swift
//  TWS
//
//  Created by Brian Tamsing on 3/29/21.
//

import SwiftUI

///
/// SwiftUI wrapper for a (UIKit) UITextField.
///
/// Motivation: to obtain access to the responder chain (no native way in SwiftUI for this rn) for improved usability on the Quote screen.
///
struct TWSTextFieldRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    let placeholder             : String
    let keyboardType            : UIKeyboardType?
    let autoCapitalizationType  : UITextAutocapitalizationType?
    static var tag              : Int = 0
    
    @Binding var text           : String
    
    
    // MARK: - UIViewRepresentable Methods
    
    func makeUIView(context: Context) -> TWSTextField {
        TWSTextFieldRepresentable.tag += 1
        
        return TWSTextField(placeholder: placeholder,
                          keyboardType: keyboardType,
                          autoCapitalizationType: autoCapitalizationType,
                          tag: TWSTextFieldRepresentable.tag,
                          delegate: context.coordinator)
    }
    
    func updateUIView(_ uiView: TWSTextField, context: Context) {
        uiView.text = self.text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(textField: self)
    }
    
    
    // MARK: - Methods
    
    func updateBinding(with text: String) {
        DispatchQueue.main.async {
            self.text = text
        }
    }
    
    
    // MARK: - Coordinator
    
    final class Coordinator: NSObject, UITextFieldDelegate {
        private let textField: TWSTextFieldRepresentable?
        
        init(textField: TWSTextFieldRepresentable) {
            self.textField = textField
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // return from the current field and then find/jump to the next one
            textField.resignFirstResponder()
            
            let nextTag = textField.tag + 1
            var superview = textField.superview
            
            while superview != nil {
                if let nextField = superview?.viewWithTag(nextTag) {
                    nextField.becomeFirstResponder()
                    break
                } else { superview = superview?.superview }
            }
            
            return true
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text,
               let textRange = Range(range, in: text) {
                let newText = text.replacingCharacters(in: textRange, with: string)
                self.textField?.updateBinding(with: newText) // this will result in a UI update so it must be dispatched to the main thread
            }
            return true
        }
    }
}
