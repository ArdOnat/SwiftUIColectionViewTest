import SwiftUI

protocol CardContent {
    var imageName: String { get }
    var title: String { get }
    var description: String { get }
}

struct CardView: View {

    typealias Content = CardContent

    let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(content.imageName)
                .fitToAspectRatio(3/2) // https://gist.github.com/karigrooms/fdf435274f4403abd57b1ed533dcea53
                .clipShape(RoundedRectangle(cornerRadius: 4))

            Text(content.title)
                .font(.headline)

            Text(content.description)
                .font(.body)
                .lineLimit(1)

            Spacer()
        }
    }
}
