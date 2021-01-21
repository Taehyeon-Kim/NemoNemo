//
//  ViewController.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/14.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {

    // MARK: - Variables
    var dailyMemo: Int = 0
    var weeklyMemo: Int = 0
    var totalMemo: Int = 0 {
        didSet {
            totalMemoCount.text = "\(totalMemo)"
            memoTotalCount.text = "메모 \(totalMemo)개"
        }
    }
    
    var realm: Realm?
    var items: Results<Memo>?
    var notificationToken: NotificationToken?
    var dummyMemoList: [Memo] = []
    
    
    // MARK: - IBOutlet
    
    /// top backgounrd view
    @IBOutlet weak var topBackgroundView: UIView!
    
    /// profile
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var entitleLabel: UILabel!
    
    /// progress bar
    @IBOutlet weak var progressBarStartPoint: UILabel!
    @IBOutlet weak var progressBarEndPoint: UILabel!
    
    /// count
    @IBOutlet weak var dailyMemoCount: UILabel!
    @IBOutlet weak var weekMemoCount: UILabel!
    @IBOutlet weak var totalMemoCount: UILabel!
    
    /// label
    @IBOutlet weak var dailyMemoTitleLabel: UILabel!
    @IBOutlet weak var weekMemoTitleLabel: UILabel!
    @IBOutlet weak var totalMemoTitleLabel: UILabel!
    
    /// Bottom
    @IBOutlet weak var memoTotalCount: UILabel!
    @IBOutlet weak var sortType: UIButton!
    @IBOutlet weak var memoListBackgroundView: UIView!
    @IBOutlet weak var memoTableView: UITableView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        loadDataFromRealm()
        setupDefault()
        setupFonts()
    }

    @IBAction func writeButtonClicked(_ sender: Any) {
        
        let writeVC = WriteViewController(nibName: "WriteViewController", bundle: nil)
        writeVC.modalPresentationStyle = .fullScreen
        self.present(writeVC, animated: true, completion: nil)
    }
    
    // MARK: - Setup
    func loadDataFromRealm() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        realm  = try? Realm()
        
        items = realm?.objects(Memo.self)

        notificationToken = items?.observe({ (change) in
//            print("change :", change)
            self.totalMemo = self.items?.count ?? -1
            self.memoTableView.reloadData()
        })
    }
    
    func setupTableView() {
        memoTableView.delegate = self
        memoTableView.dataSource = self
        memoTableView.register(UINib(nibName: "MemoTableViewCell", bundle: nil), forCellReuseIdentifier: "MemoTableViewCell")
    }

    
    // 기본 UI 세팅
    func setupDefault() {

        
        dailyMemoCount.text = String(dailyMemo)
        weekMemoCount.text = String(weeklyMemo)
        
        /// nickname
        nickNameLabel.text = "내모내모"
       
        /// entitle
        entitleLabel.text = "@메모고수 '메모는 밥 먹듯이 하는거야\'"

    }
    
    // 뷰 연결
    func setupFonts() {
        nickNameLabel.font = UIFont.NEXONLv1GothicFontSize(weight: .Bold, size: 32)
        entitleLabel.font = UIFont.NEXONLv1GothicFontSize(weight: .Regular, size: 14)
        
        /// progress bar
        progressBarStartPoint.font = UIFont.NEXONLv1GothicFontSize(weight: .Regular, size: 10)
        progressBarEndPoint.font = UIFont.NEXONLv1GothicFontSize(weight: .Regular, size: 10)
        
        dailyMemoCount.font = UIFont.NEXONLv1GothicFontSize(weight: .Bold, size: 24)
        weekMemoCount.font = UIFont.NEXONLv1GothicFontSize(weight: .Bold, size: 24)
        totalMemoCount.font = UIFont.NEXONLv1GothicFontSize(weight: .Bold, size: 24)
        
        dailyMemoTitleLabel.font = UIFont.NEXONLv1GothicFontSize(weight: .Light, size: 12)
        weekMemoTitleLabel.font = UIFont.NEXONLv1GothicFontSize(weight: .Light, size: 12)
        totalMemoTitleLabel.font = UIFont.NEXONLv1GothicFontSize(weight: .Light, size: 12)
        
        memoTotalCount.font = UIFont.NEXONLv1GothicFontSize(weight: .Bold, size: 22)
        sortType.titleLabel?.font = UIFont.NEXONLv1GothicFontSize(weight: .Regular, size: 14)
    }

}


