//
//  TWSTextField.swift
//  TWS
//
//  Created by Brian Tamsing on 3/29/21.
//

import UIKit

class TWSTextField: UITextField {
    
    // MARK: - Init
    
    init(placeholder: String,
         keyboardType: UIKeyboardType?,
         autoCapitalizationType: UITextAutocapitalizationType?,
         tag: Int,
         delegate: UITextFieldDelegate
    ){
        super.init(frame: .zero)
        
        self.placeholder                = placeholder
        if let keyboardType             = keyboardType { self.keyboardType = keyboardType }
        if let autoCapitalizationType   = autoCapitalizationType { self.autocapitalizationType = autoCapitalizationType }
        self.tag                        = tag
        
        self.delegate                   = delegate
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    func configure() {
        textColor                   = .label
        tintColor                   = UIColor.twsBlue
        
        font                        = UIFont.preferredFont(forTextStyle: .title3)
        backgroundColor             = .systemBackground
        
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        
        autocorrectionType          = .no
        returnKeyType               = .next
        
        translatesAutoresizingMaskIntoConstraints = false
        
        configureAccessoryView()
    }
    
    func configureAccessoryView() {
        let toolbar                 = UIToolbar()
        
        let middleSpace             = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let previousButton          = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(getPreviousTextField))
        previousButton.tintColor    = UIColor.twsBlue
        
        let doneButton              = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(hideKeyboard))
        doneButton.tintColor        = UIColor.twsBlue
        
        toolbar.items               = [previousButton, middleSpace, doneButton]
        toolbar.sizeToFit()
        
        inputAccessoryView          = toolbar
    }
    
    @objc func hideKeyboard() {
        resignFirstResponder()
    }
}

extension TWSTextField {
    @objc func getPreviousTextField() {
        resignFirstResponder()
        
        var superview = self.superview
        while superview != nil {
            if let otherField = superview?.viewWithTag(self.tag - 1) {
                otherField.becomeFirstResponder()
                break
            } else { superview = superview?.superview }
        }
    }
}
