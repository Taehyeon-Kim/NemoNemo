//
//  ViewController.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/14.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Variables
    var dailyMemo: Int = 0
    var weeklyMemo: Int = 0
    var totalMemo: Int = 0
    
    var contents: [String] = [
        "내용1",
        "내용2",
        "내용3",
        "내용4",
        "내용5",
        "내용6",
        "내용1",
        "내용2",
        "내용3",
        "내용4",
        "내용5",
        "내용6",
    ]
    
    
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

        dailyMemo = 2
        weeklyMemo = 35
        totalMemo = 237
        
        setupDefault()
        setupFonts()
        
        memoTableView.delegate = self
        memoTableView.dataSource = self
        memoTableView.register(UINib(nibName: "MemoTableViewCell", bundle: nil), forCellReuseIdentifier: "MemoTableViewCell")
    }

    
    // MARK: - Setup
    
    // 기본 UI 세팅
    func setupDefault() {
        
        dailyMemoCount.text = String(dailyMemo)
        weekMemoCount.text = String(weeklyMemo)
        totalMemoCount.text = String(totalMemo)
        memoTotalCount.text = "메모 \(self.totalMemo)개"
        
        /// nickname
        nickNameLabel.text = "내모내모"
       
        /// entitle
        entitleLabel.text = "@메모고수 '메모는 밥 먹듯이 하는거야\'"
        
//        memoListBackgroundView.layer.cornerRadius = 20
//        memoListBackgroundView.layer.masksToBounds = true
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
        
        memoTotalCount.font = UIFont.NEXONLv1GothicFontSize(weight: .Bold, size: 24)
        sortType.titleLabel?.font = UIFont.NEXONLv1GothicFontSize(weight: .Regular, size: 14)
    }
    
    func registerNib() {
        
    }

}

