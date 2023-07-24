//
//  DateViewController.swift
//  NewlyCoinedWord
//
//  Created by 장혜성 on 2023/07/20.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet var label1: UILabel!
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        setLabel()
        setImageView()
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
        
        // +100일 뒤
        let result = Calendar.current.date(byAdding:.day , value:100, to: sender.date)
        
        // DateFormatter
        // 1. 시간대 변경 가능
        // 2. 원하는 포맷으로 변경 가능
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        let value = format.string(from: sender.date)
        print(value)
//        label1.text = value
        
        label1.text = format.string(from: result!)
    }
    
    func setDatePicker() {
        datePicker.tintColor = .yellow
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    func setLabel() {
        label1.textColor = .white
        label1.textAlignment = .center
        label1.layer.cornerRadius = 30
        label1.backgroundColor = .black
        label1.clipsToBounds = true  // label 의 cornerRadius 를 먹이려면 필요
    }
    
    func setImageView() {
        imageView1.backgroundColor = .green
        imageView1.layer.cornerRadius = 20
        
        // 그림자 적용시키기
        imageView1.layer.shadowColor = UIColor.black.cgColor
        imageView1.layer.shadowOffset = CGSize(width: 0, height: 0)    // 그림자 방향. .zero
        imageView1.layer.shadowRadius = 10          // 그림자 퍼짐의 정도
        imageView1.layer.shadowOpacity = 0.5        // 그림자 불투명도
        imageView1.clipsToBounds = false
    }
    
}
