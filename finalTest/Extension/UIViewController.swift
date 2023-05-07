//
//  UIViewController.swift
//  finalTest
//
//  Created by MacBook Pro on 7/5/23.
//

import UIKit


extension UIViewController {
    
    func createCustomNavigationBar() {
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9499530196, green: 0.9499530196, blue: 0.9499530196, alpha: 1)
    }
    func createCustomTitleView(contactName: String,contactDescription: String, contactImage: String) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)
        
        let imageBack = UIImageView()
        imageBack.image = UIImage(named: contactImage)
        imageBack.frame = CGRect(x: 5, y: 0, width: 40, height: 40)
        view.addSubview(imageBack)
        
        return view
    }
    
    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        button.tintColor = #colorLiteral(red: 0.3321716189, green: 0.3321716189, blue: 0.3321716189, alpha: 1)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}
