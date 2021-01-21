//
//  WriteViewController.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/20.
//

import UIKit
import RealmSwift

class WriteViewController: UIViewController {

    
    //MARK: - IBOutlet
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var groupColorButton: RoundedUIButton!
    @IBOutlet weak var keywordTextField: UITextField!
    
    
    //MARK: - Variables
    var textViewClearedOnInitialEdit: Bool = false
    var keywordTextFieldClearedOnInitialEdit: Bool = false
    
    var realm: Realm?
    var realmMemoItems: Results<Memo>?
    var memoList: [Memo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        setupUI()
        setupFont()
        setupDefault()
    }
    
 
    //MARK: - IBAction
    @IBAction func closeButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func groupColorButtonClicked(_ sender: Any) {
        
        print("color button clicked")
    }
    
    @IBAction func writeButtonClicked(_ sender: Any) {
        
        print("write button clicked")
        
        try! realm?.write {
            realm?.add(inputData(database: Memo()))
        }
        
        self.dismiss(animated: true, completion: nil)
}
    
    //MARK: - Setup Function
    func setupUI() {
        
        // 텍스트뷰 상하좌우 패딩 조정
        textView.textContainerInset = UIEdgeInsets(top: 24,left: 24,bottom: 24,right: 24)
        
        // 텍스트뷰 줄간격
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let attributes = [NSAttributedString.Key.paragraphStyle : style]
        textView.attributedText = NSAttributedString(string: textView.text, attributes: attributes)
        
        // group color button border
        groupColorButton.layer.borderWidth = 2
        groupColorButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupFont() {
        navTitle.font = UIFont.NEXONLv1GothicFontSize(weight: .Bold, size: 24)
        completeButton.titleLabel?.font = UIFont.NEXONLv1GothicFontSize(weight: .Regular, size: 18)
        textView.font = UIFont.NEXONLv1GothicFontSize(weight: .Regular, size: 18)
        keywordTextField.font = UIFont.NEXONLv1GothicFontSize(weight: .Regular, size: 18)
        
        textView.textColor = .lightGray
        completeButton.tintColor = .darkGray
        keywordTextField.textColor = .lightGray
    }
    
    func setupDefault() {
        textView.delegate = self
        keywordTextField.delegate = self
        
        // realm setup
        realm = try? Realm()
        realmMemoItems = realm?.objects(Memo.self)
    }
    
    func inputData(database: Memo) -> Memo {
        if let content = textView.text {
            database.content = content
        }
        
        if let keyword = keywordTextField.text {
            database.keyword = keyword
        }
        
        return database
    }

}

extension WriteViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        // 처음 편집을 시작할때만 clear
        if !self.textViewClearedOnInitialEdit {
            
            self.textView.text = ""
            self.textViewClearedOnInitialEdit = true
        }
    }
}

extension WriteViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if !self.keywordTextFieldClearedOnInitialEdit {
            
            self.keywordTextField.text = ""
            self.keywordTextFieldClearedOnInitialEdit = true
        }
        
    }
}
