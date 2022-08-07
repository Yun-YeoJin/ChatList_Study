//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 윤여진 on 2022/08/05.
//

import UIKit

class ChatListViewController: UIViewController {
    
    var chatlist: [Chat] = Chat.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //sorted(by:)를 이용해서 역순으로 바꿔준다.
        chatlist = chatlist.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date
        })
        
    }
    
    
    
    
}

extension ChatListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let chat = chatlist[indexPath.item]
        cell.configure(chat)
        
        return cell
    }
    
}
extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
