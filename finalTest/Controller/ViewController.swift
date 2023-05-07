//
//  ViewController.swift
//  finalTest
//
//  Created by MacBook Pro on 6/5/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Mehrab"
        label.textColor = #colorLiteral(red: 0.5843137255, green: 0.5843137255, blue: 0.5843137255, alpha: 1)
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome Back !"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32)
        return label
    }()
    
    private let bellButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bell"), for: .normal)
        return button
    }()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.searchBarStyle = .minimal
        return search
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filter"), for: .normal)
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 130, height: 55)
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    let cellID = "cell"
    
    private let foodTable: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.separatorStyle = .none
        return table
    }()
    
    private var arrTypeFood: [String] = []
    
    private var foods: [Food] = []
    
    private var filteredFoods: [Food] = []
    
    private var isFiltered: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViews()
        addConstrains()
        extensionUpdate()
        dataUpdate()
    }
    
    private func extensionUpdate() {
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        foodTable.dataSource = self
        foodTable.delegate = self
        foodTable.register(CustomTableViewCell.self, forCellReuseIdentifier: cellID)
        searchBar.delegate = self
    }
    
    private func addViews() {
        view.addSubview(helloLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(bellButton)
        view.addSubview(searchBar)
        view.addSubview(filterButton)
        view.addSubview(collectionView)
        view.addSubview(collectionView)
        view.addSubview(foodTable)
    }
    
    private func dataUpdate() {
        arrTypeFood = ["all","Pizza","Fast Food","Vegan","Burger","Doner","Salat"]
        foods = [Food(imageSmoll: "mushroomsSmoll",
                      imageFull: "mushrooms",
                      nameFood: "Pizza with\nMushrooms",
                      time: "14-20 minutes",
                      price: "12"),
                 Food(imageSmoll: "pepperoniSmoll",
                      imageFull: "pepperoni",
                      nameFood: "Pepperoni\nCheese Pizza",
                      time: "18-25 minutes",
                      price: "14"),
                 Food(imageSmoll: "mushroomsSmoll",
                      imageFull: "mushrooms",
                      nameFood: "Cheese\nPizza",
                      time: "15-22 minutes",
                      price: "15"),
                 Food(imageSmoll: "pepperoniSmoll",
                      imageFull: "pepperoni",
                      nameFood: "Double\nChiсken Pizza",
                      time: "15-22 minutes",
                      price: "10")]
    }
    
    private func addConstrains() {
        //top Elemenst
        helloLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(54)
            make.leading.equalToSuperview().offset(24)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(24)
        }
        
        bellButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(54)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        //searchBar
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(filterButton.snp.leading).offset(-25)
        }
        
        filterButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(bellButton.snp.bottom).offset(37)
        }
        
        //collectionView
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(foodTable.snp.top)
        }
        //tableView
        foodTable.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
    }
}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrTypeFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CustomCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.setData(text: arrTypeFood[indexPath.row])
        if indexPath.row == 1 {
            cell.a()
        }
        return cell
    }
}


//MARK: - UITableViewDataSource && UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltered ? filteredFoods.count : foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomTableViewCell
        cell.setData(food: isFiltered ? filteredFoods[indexPath.row] : foods[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.food = isFiltered ? filteredFoods[indexPath.row] : foods[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltered = false
        } else {
            isFiltered = true
            
            filteredFoods = foods.filter { $0.nameFood.contains(searchText) }
        }
        
        foodTable.reloadData()
    }
}
