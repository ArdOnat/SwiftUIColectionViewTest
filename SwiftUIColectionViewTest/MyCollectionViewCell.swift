import SwiftUI
import UIKit

class MyCollectionViewCell: SwiftUICollectionViewCell<CardView> {

    static var reuseIdentifier = "MyCollectionViewCell"

    typealias Content = CardView.Content

    func configure(with content: Content, parent: UIViewController) {
        embed(in: parent, withView: CardView(content: content))
        host?.view.frame = self.contentView.bounds
    }
}
