//
//  BaeminViewController.swift
//  NewlyCoinedWord
//
//  Created by 장혜성 on 2023/07/23.
//

import UIKit

class BaeminViewController: UIViewController {
    
    @IBOutlet var imageCollection: [UIImageView]!
    @IBOutlet var containerCollection: [UIView]!
    @IBOutlet var topContainerView: UIView!
    @IBOutlet var bannerImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeStatusBarBgColor(bgColor: UIColor.systemGreen)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designTopView()
        designBannerImageView()
        
        for v in containerCollection {
            designContainerView(outlet: v)
        }
        
        for v in imageCollection {
            designImageView(outlet: v)
        }
    }
    
    func changeStatusBarBgColor(bgColor: UIColor?) {
        if #available(iOS 13.0, *) {
            //            let window = UIApplication.shared.windows.first
            //            let statusBarManager = window?.windowScene?.statusBarManager
            
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            let statusBarManager = window?.windowScene?.statusBarManager
            let statusBarView = UIView(frame: statusBarManager?.statusBarFrame ?? .zero)
            statusBarView.backgroundColor = bgColor
            window?.addSubview(statusBarView)
        } else {
            let statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
            statusBarView?.backgroundColor = bgColor
        }
    }
    
    func designTopView() {
        topContainerView.layer.backgroundColor = UIColor.systemGreen.cgColor
        topContainerView.clipsToBounds = true
        topContainerView.layer.cornerRadius = 20
        topContainerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func designContainerView(outlet v: UIView) {
        v.layer.cornerRadius = 8
        v.layer.borderColor = UIColor.lightGray.cgColor
        v.layer.borderWidth = 2
    }
    
    func designImageView(outlet v: UIImageView) {
        v.layer.cornerRadius = 8
    }
    
    func designBannerImageView() {
        bannerImageView.layer.cornerRadius = 8
        bannerImageView.image = UIImage(named: "banner01")
        bannerImageView.contentMode = .scaleAspectFill
    }
    
}
