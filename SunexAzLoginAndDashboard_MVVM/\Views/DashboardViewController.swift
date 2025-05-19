//
//  DashboardViewController.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 18.05.25.
//
import UIKit

class DashboardViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var CurrentMonthExpenses: UILabel!
    @IBOutlet weak var CurrentMonthExpensesView: UIProgressView!
    @IBOutlet weak var MonthlLlimit: UILabel!
    @IBOutlet weak var collectionviewfirst: UICollectionView!
    @IBOutlet weak var collectionviewSecond: UICollectionView!
    
    var token: String? = ""
    var viewModel = DashboardViewModel()
    
    var firstCollectionList: [GroupFirstCollectionViewCell.Item] = [
        .init(image: "Vector (Stroke) 1", title: "Xaricdəki ünvanlarım"),
        .init(image: "Bike R", title: "Kuryer xidməti"),
        .init(image: "File R", title: "Bəyənnamələrim"),
        .init(image: "Calculator R", title: "Kalkulyator"),
        .init(image: "Tarifs", title: "Tariflər"),
        .init(image: "Settings", title: "Tənzimləmələr")
    ]
    
    var secondCollectionList: [SecondCollectionViewCell.Item] = [
                .init(image: "image1"),
                .init(image: "image2"),
                .init(image: "image3")
    ]
    var adapterFirst: FirstCollectionViewAdapter!
    var adapterSecond: SecondCollectionViewAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        adapterFirst = FirstCollectionViewAdapter(items: firstCollectionList)
        adapterSecond = SecondCollectionViewAdapter(newsItems: secondCollectionList)
        setupCollections()
        bindViewModel()
        
        if let token = token {
            viewModel.fetchDashboardData(token: token)
        } else {
            print("Token mövcud deyil.")
        }
    }
    
    private func bindViewModel() {
        viewModel.onDataFetched = { [weak self] in
            guard let self = self else { return }
            
            self.userName.text  = self.viewModel.fullName
            self.CurrentMonthExpenses.text    = self.viewModel.currentExpense
            self.MonthlLlimit.text            = self.viewModel.monthlyLimit
            self.CurrentMonthExpensesView.progress = self.viewModel.expenseProgress
            
            
            self.adapterSecond.newsItems = self.secondCollectionList
            self.collectionviewSecond.reloadData()
            
        }
        viewModel.onError = { error in
            print("Xəta baş verdi: \(error)")
        }
    }
    
    private func setupCollections() {
        collectionviewfirst.dataSource = adapterFirst
        
        collectionviewSecond.dataSource = adapterSecond
        
        collectionviewfirst.register(GroupFirstCollectionViewCell.nib, forCellWithReuseIdentifier: GroupFirstCollectionViewCell.identifier)
        collectionviewSecond.register(SecondCollectionViewCell.nib, forCellWithReuseIdentifier: SecondCollectionViewCell.identifier)
        
        if let layout = collectionviewfirst.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = (collectionviewfirst.frame.width / 2) - 10
            layout.itemSize = CGSize(width: width, height: 32)
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = 10
        }
        
        if let layout = collectionviewSecond.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: collectionviewSecond.frame.width / 3, height: 140)
            layout.minimumLineSpacing = 50
            layout.minimumInteritemSpacing = 10
        }
        
        collectionviewfirst.showsVerticalScrollIndicator = false
        collectionviewSecond.showsVerticalScrollIndicator = false
    }
}
