import SwiftUI
import UIKit

class CollectionViewExample: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "Light")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.text = "Find spaces that suit your style"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(imageLiteralResourceName: "sigkas")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseIdentifier)
        setupView()
    }

    private func setupView() {
        view.addSubview(logo)
        view.addSubview(label)
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 32),
            label.heightAnchor.constraint(equalToConstant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            collectionView.heightAnchor.constraint(equalToConstant: 320)
        ])
    }

    struct Item: MyCollectionViewCell.Content {
        var id: String
        var imageName: String
        var title: String
        var description: String
    }

    let items: [Item] = [
        Item(id: UUID().uuidString, imageName: "sigkas", title: "Condo with awesome views of downtown", description: "$117 avg/night"),
        Item(id: UUID().uuidString, imageName: "houses", title: "Oceanfront 3 BR/3 BA", description: "$400 avg/night"),
        Item(id: UUID().uuidString, imageName: "studios", title: "Art Studio", description: "$65 avg/night"),
        Item(id: UUID().uuidString, imageName: "villas", title: "Luxury 4 BR/3 BA Villa", description: "$109 avg/night"),
        Item(id: UUID().uuidString, imageName: "cabins", title: "Cabin in the Pike", description: "$200 avg/night"),
        Item(id: UUID().uuidString, imageName: "bungalows", title: "Cottage on Ocean Bluff", description: "$159 avg/night"),
        Item(id: UUID().uuidString, imageName: "resorts", title: "Terranea Oceanside King Casita", description: "$351 avg/night"),
        Item(id: UUID().uuidString, imageName: "chalets", title: "Romantic Mountain Chalet", description: "$104 avg/night"),
        Item(id: UUID().uuidString, imageName: "farmhouses", title: "Cozy Farmhouse on 10 Acres", description: "$199 avg/night")
    ]
}

extension CollectionViewExample: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdentifier, for: indexPath) as? MyCollectionViewCell else {
            fatalError("Could not dequeue cell")
        }

        let item = items[indexPath.row]
        cell.configure(with: item, parent: self)
        return cell
    }
}

extension CollectionViewExample: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 320)
    }
}
