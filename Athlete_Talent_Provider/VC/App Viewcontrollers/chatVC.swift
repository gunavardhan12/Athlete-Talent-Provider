import UIKit
import MessageKit
import InputBarAccessoryView

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class chatVC: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    var currentSender1: any MessageKit.SenderType = Sender(senderId: "self", displayName: "me")
    
    
    
    let otherUser = Sender(senderId: "other", displayName: "Testing Admin")
    
    var messages = [MessageType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInputBar()
        navigationController?.navigationBar.backgroundColor = .black
        self.messagesCollectionView.backgroundColor = .black
        
        messages.append(Message(sender: currentSender1, messageId: "1", sentDate: Date().addingTimeInterval(-866400), kind: .text("helo")))
        messages.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-866200), kind: .text("Hi!!")))
        messages.append(Message(sender: currentSender1, messageId: "3", sentDate: Date().addingTimeInterval(-816400), kind: .text("where are you right now?")))
        messages.append(Message(sender: otherUser, messageId: "3", sentDate: Date().addingTimeInterval(-766400), kind: .text("at home! why?.......what about you? are you coming here?")))
        messages.append(Message(sender: currentSender1, messageId: "4", sentDate: Date().addingTimeInterval(-666400), kind: .text("same, no i asked randomly")))
        messages.append(Message(sender: otherUser, messageId: "5", sentDate: Date().addingTimeInterval(-626400), kind: .text("okay okay")))
        messages.append(Message(sender: otherUser, messageId: "6", sentDate: Date().addingTimeInterval(-625400), kind: .text("now whats plan for tomorrow")))
        messages.append(Message(sender: currentSender1, messageId: "7", sentDate: Date().addingTimeInterval(-566400), kind: .text("nothing special")))
        messages.append(Message(sender: currentSender1, messageId: "8", sentDate: Date().addingTimeInterval(-466400), kind: .text("will see tomorrow..!")))
        messages.append(Message(sender: currentSender1, messageId: "1", sentDate: Date().addingTimeInterval(-866400), kind: .text("helo")))
        messages.append(Message(sender: otherUser, messageId: "2", sentDate: Date().addingTimeInterval(-866200), kind: .text("Hi!!")))
        messages.append(Message(sender: currentSender1, messageId: "3", sentDate: Date().addingTimeInterval(-816400), kind: .text("where are you right now?")))
        messages.append(Message(sender: otherUser, messageId: "3", sentDate: Date().addingTimeInterval(-766400), kind: .text("at home! why?.......what about you? are you coming here?")))
        messages.append(Message(sender: currentSender1, messageId: "4", sentDate: Date().addingTimeInterval(-666400), kind: .text("same, no i asked randomly")))
        messages.append(Message(sender: otherUser, messageId: "5", sentDate: Date().addingTimeInterval(-626400), kind: .text("okay okay")))
        messages.append(Message(sender: otherUser, messageId: "6", sentDate: Date().addingTimeInterval(-625400), kind: .text("now whats plan for tomorrow")))
        messages.append(Message(sender: currentSender1, messageId: "7", sentDate: Date().addingTimeInterval(-566400), kind: .text("nothing special")))
        messages.append(Message(sender: currentSender1, messageId: "8", sentDate: Date().addingTimeInterval(-466400), kind: .text("will see tomorrow..!")))
        
        // Register cell classes
        messagesCollectionView.register(MessageCollectionViewCell.self, forCellWithReuseIdentifier: "MessageCell")
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        // Reload the collection view
        messagesCollectionView.reloadData()

    }
    
    // MARK: - MessagesDataSource
    func currentSender() -> SenderType {
        return currentSender1
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        if message.sender.senderId == currentSender1.senderId {
            
            return .lightGray
        } else {
            return .darkGray
        }
    }
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return .black
    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.isHidden = true // Hide the avatar view
    }
    func setupInputBar() {
        let plusButton = InputBarButtonItem()
        plusButton.image = UIImage(systemName: "plus")
        plusButton.setSize(CGSize(width: 36, height: 36), animated: false)
        plusButton.onTouchUpInside { _ in
            print("Plus button tapped")
        }

        messageInputBar.setLeftStackViewWidthConstant(to: 50, animated: false)
        messageInputBar.setStackViewItems([plusButton], forStack: .left, animated: false)
        messageInputBar.inputTextView.placeholder = "Type a message..."
        messageInputBar.tintColor = .systemRed
        messageInputBar.inputTextView.backgroundColor = .black
        messageInputBar.backgroundView.backgroundColor = .black
    }
}
