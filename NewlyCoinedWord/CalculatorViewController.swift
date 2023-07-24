//
//  CalculatorViewController.swift
//  NewlyCoinedWord
//
//  Created by 장혜성 on 2023/07/20.
//

import UIKit

class CalculatorViewController: UIViewController {

    // 기념일 계산기
    @IBOutlet var ddayImg1: UIImageView!
    @IBOutlet var shadowView1: UIView!
    @IBOutlet var ddayLabel1: UILabel!
    @IBOutlet var titleLabel1: UILabel!
    
    @IBOutlet var ddayImg2: UIImageView!
    @IBOutlet var shadowView2: UIView!
    @IBOutlet var ddayLabel2: UILabel!
    @IBOutlet var titleLabel2: UILabel!
    
    @IBOutlet var ddayImg3: UIImageView!
    @IBOutlet var shadowView3: UIView!
    @IBOutlet var ddayLabel3: UILabel!
    @IBOutlet var titleLabel3: UILabel!
    
    @IBOutlet var ddayImg4: UIImageView!
    @IBOutlet var shadowView4: UIView!
    @IBOutlet var ddayLabel4: UILabel!
    @IBOutlet var titleLabel4: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    let format = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        designImageView(outlet: ddayImg1)
        designImageView(outlet: ddayImg2)
        designImageView(outlet: ddayImg3)
        designImageView(outlet: ddayImg4)
        
        setShadowView(outlet: shadowView1)
        setShadowView(outlet: shadowView2)
        setShadowView(outlet: shadowView3)
        setShadowView(outlet: shadowView4)
        
        designDdayLabel(outlet: ddayLabel1, calculateDay: 10)
        designDdayLabel(outlet: ddayLabel2, calculateDay: 20)
        designDdayLabel(outlet: ddayLabel3, calculateDay: -10)
        designDdayLabel(outlet: ddayLabel4, calculateDay: -20)
        
        designTitleLabel(outlet: titleLabel1)
        designTitleLabel(outlet: titleLabel2)
        designTitleLabel(outlet: titleLabel3)
        designTitleLabel(outlet: titleLabel4)
        
        setDateData(date: Date())
        
        setImageView(outlet: ddayImg1, image: "cake")
        setImageView(outlet: ddayImg2, image: "doughnut")
        setImageView(outlet: ddayImg3, image: "icecream")
        setImageView(outlet: ddayImg4, image: "macaroon")
        
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        // 애가 바뀌었을 때 하단 이미지뷰안의 디데이가 변경되어야 함
        setDateData(date: sender.date)
    }
    
    func setDateData(date: Date) {
        let resultPlus10 = Calendar.current.date(byAdding:.day , value:10, to: date)
        let resultPlus20 = Calendar.current.date(byAdding:.day , value:20, to: date)
        let resultMinus10 = Calendar.current.date(byAdding:.day , value:-10, to: date)
        let resultMinus20 = Calendar.current.date(byAdding:.day , value:-20, to: date)
        
        // DateFormatter
        format.dateFormat = "yyyy년 MM월 dd일"
        titleLabel1.text = format.string(from: resultPlus10!)
        titleLabel2.text = format.string(from: resultPlus20!)
        titleLabel3.text = format.string(from: resultMinus10!)
        titleLabel4.text = format.string(from: resultMinus20!)
    }
    
    func setDatePicker() {
        datePicker.tintColor = .brown
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    func designImageView(outlet v:UIImageView) {
        v.contentMode = .scaleToFill
        v.layer.cornerRadius = 20
        v.backgroundColor = .blue
    }
    
    func designDdayLabel(outlet label: UILabel, calculateDay: Int) {
        label.font = .italicSystemFont(ofSize: 12)
        label.textColor = .darkGray
        label.textAlignment = .left
        if calculateDay > 0 {
            label.text = "D +\(calculateDay)"
        } else {
            label.text = "D \(calculateDay)"
        }
    }
    
    func designTitleLabel(outlet label: UILabel) {
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .purple
        label.textAlignment = .center
    }
    
    func setShadowView(outlet v: UIView) {
        v.layer.cornerRadius = 20
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = .zero
        v.layer.shadowRadius = 10
        v.layer.shadowOpacity = 0.5
        v.clipsToBounds = false
    }
    
    func setImageView(
        outlet v: UIImageView,
        image: String
    ) {
        v.image = UIImage(named: image)
    }
    
}
