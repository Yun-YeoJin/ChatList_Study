//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by 윤여진 on 2022/08/05.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumnailImageView.layer.cornerRadius = 20
    }
    
    func configure(_ chat: Chat) {
        thumnailImageView.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateString(dataString: chat.date)
    }
    
    func formattedDateString(dataString: String) -> String {
        
        //String -> Date -> String 과정
        //2022-04-01 -> 4/1
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        //String -> Date
        if let date = formatter.date(from: dataString) {
            formatter.dateFormat = "MMM d일"
            return formatter.string(from: date)
        } else {
            return ""
        }
        
    }
    
  
}
