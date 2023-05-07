//
//  MainTabBarController.swift
//  finalTest
//
//  Created by MacBook Pro on 6/5/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        let nav = UINavigationController(rootViewController: ViewController())
        viewControllers = [
            generateVC(viewController: nav,
                       title: "Home",
                       image: UIImage(systemName: "house.fill")),
            generateVC(viewController: FavoriteViewController(),
                       title: "Favorite",
                       image: UIImage(systemName: "heart.fill")),
            generateVC(viewController: CartViewController(),
                       title: "Cart",
                       image: UIImage(systemName: "cart.fill")),
            generateVC(viewController: OrdersViewController(),
                       title: "My orders",
                       image: UIImage(systemName: "list.clipboard"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 35
        let positionOnY: CGFloat = 8
        
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: 20
        )
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 6
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainBlack.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }

}
