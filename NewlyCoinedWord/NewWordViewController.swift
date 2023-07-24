//
//  NewWordViewController.swift
//  NewlyCoinedWord
//
//  Created by 장혜성 on 2023/07/20.
//

import UIKit

class NewWordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchContainerView: UIView!
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet var resultLabel: UILabel!
    
    let labelDictionary = [
        "쫌쫌따리": "아주 조금씩 적고 하찮은 양을 모으는 모습",
        "억텐": "억지 텐션",
        "스불재": "스스로 불러온 재앙",
        "좋댓구알": "좋아요,댓글,구독,알림설정",
        "점메추": "점심메뉴추천"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchTextField.delegate = self
        searchTextField.returnKeyType = .search
        
        designSearchContainer()
        designSearchButton()
        designSearchTextField()
        designResultLabel()
    
        
        for i in 0...buttonCollection.count - 1 {
//            designTopLabel(outlet: topLabelCollection[i])
            buttonCollection[i].setTitle(Array(labelDictionary)[i].key, for: .normal)
            designTopButton(outlet: buttonCollection[i])
            
        }
        
    }
    
    @IBAction func topButtonClicked(_ sender: UIButton) {
        searchAction(searchText: sender.titleLabel?.text)
    }
    
    @IBAction func tabGestureTabbed(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        searchAction(searchText: searchTextField.text)
    }
    
    // TextField Delegate 룰 사용해서 Return 버튼 동작
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
//        searchAction()
//       return true
//    }
    
    @IBAction func textfieldReturnClicked(_ sender: UITextField) {
        searchAction(searchText: sender.text)
    }
    
    func searchAction(searchText: String?) {
        if searchText == nil {
            return
        }
        
        for word in labelDictionary {
            if word.key == searchText {
                resultLabel.text = word.value
                break
            } else {
                resultLabel.text = "검색결과가 없습니다"
            }
        }
        searchTextField.text = nil
        view.endEditing(true)
    }
    
    func designSearchContainer() {
        searchContainerView.layer.borderWidth = 3
        searchContainerView.layer.borderColor = UIColor.black.cgColor
        searchContainerView.backgroundColor = .white
    }
    
    func designSearchButton() {
        searchButton.backgroundColor = .black
        var config = UIButton.Configuration.filled()        // apple system button
        config.title = ""
        config.image = UIImage(systemName: "magnifyingglass")
//        config.cornerStyle = .dynamic
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .black
        config.imagePadding = 8
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        
        searchButton.configuration = config
    }
    
    func designSearchTextField() {
        searchTextField.placeholder = "검색어"
        searchTextField.borderStyle = .none
    }
    
    func designTopButton(outlet btn: UIButton) {
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.black, for: .highlighted)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.titleLabel?.textAlignment = .center
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.clipsToBounds = true
        
        //      btn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
        
        var config = UIButton.Configuration.filled()
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        config.baseBackgroundColor = .white
        btn.configuration = config
    }

    func designResultLabel() {
        resultLabel.text = "검색해주세요"
        resultLabel.font = .systemFont(ofSize: 18)
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 3
        resultLabel.textColor = .black
    }
}
