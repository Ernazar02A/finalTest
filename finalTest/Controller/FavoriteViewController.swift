//
//  FavoriteViewController.swift
//  finalTest
//
//  Created by MacBook Pro on 6/5/23.
//

import UIKit

class FavoriteViewController: UIViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.text = "По техническим причинам\n пока это страница не готово"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        view.backgroundColor = .orange
    }

}
