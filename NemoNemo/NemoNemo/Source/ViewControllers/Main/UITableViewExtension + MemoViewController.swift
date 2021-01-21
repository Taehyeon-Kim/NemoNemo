//
//  UITableViewExtension + MemoViewController.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/15.
//

import UIKit

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? -1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = memoTableView.dequeueReusableCell(withIdentifier: "MemoTableViewCell", for: indexPath) as? MemoTableViewCell else {
            return UITableViewCell()
        }
                
        dummyMemoList = Array(items!)
        cell.setData(dummyMemoList[indexPath.row])
        
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    
    // 오른쪽 스와이프
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제", handler: { (ac:UIContextualAction, UIView, success: (Bool) -> Void) in

            try! self.realm?.write {
                self.realm?.delete(self.dummyMemoList[indexPath.row])
            }
            
        })
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
