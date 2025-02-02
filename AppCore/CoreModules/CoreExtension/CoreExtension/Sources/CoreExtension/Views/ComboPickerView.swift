//
//  ComboPickerView.swift
//  
//
//  Created by Ozcan Akkoca on 27.01.2024.
//

import UIKit

public class ComboPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    private var textField: UITextField!
    private var pickerView: UIPickerView!
    private var data: [String] = []

    public var didSelectItem: ((Int, String) -> Void)?
    public var selectedIndex: Int?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.masksToBounds = true
        // UIPickerView oluşturulması ve ayarlanması
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self

        // UITextField oluşturulması ve ayarlanması
        textField = UITextField()
        textField.font = .systemFont(ofSize: 12)
        textField.inputView = pickerView
        textField.delegate = self // TextField'ın delegesini belirtiyoruz
        
        textField.tintColor = UIColor.clear
        addSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(5)
        }

        dismissPickerView()
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = data[row]
        didSelectItem?(row, data[row])
        selectedIndex = row
    }

    public func setData(_ newData: [String], selectedFirst: Bool = true, _selectedIndex: Int? = nil) {
        data = newData
        pickerView.reloadAllComponents()
        if let firstValue = data.first, selectedFirst {
            selectedIndex = .zero
            textField.text = firstValue
        } else if let _selectedIndex = _selectedIndex {
            selectedIndex = _selectedIndex
            textField.text = newData[_selectedIndex]
        }
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if selectedIndex == nil, data.count > 0 {
            textField.text = data[0]
            selectedIndex = 0
        }
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Kapat", style: .plain, target: self, action: #selector(self.done))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func done() {
       endEditing(true)
    }
    
    
}


public class CustomTextField: UIView, UITextFieldDelegate {
     open var textField: UITextField!
   

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        layer.masksToBounds = true
        // UIPickerView oluşturulması ve ayarlanması

        // UITextField oluşturulması ve ayarlanması
        textField = UITextField()
        textField.delegate = self // TextField'ın delegesini belirtiyoruz
        textField.font = .systemFont(ofSize: 12)

        textField.tintColor = UIColor.clear
        addSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(5)
        }

        dismissPickerView()
    }


    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Kapat", style: .plain, target: self, action: #selector(self.done))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func done() {
       endEditing(true)
    }
    
    public func getText()->String {
        return textField.text ?? ""
    }
}
