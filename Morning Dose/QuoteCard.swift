import SwiftUI

struct QuoteCard: View {
    var newQuote: [Quote]
    var body: some View {
       
        
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .opacity(0.8)
            
            VStack {
                Text(newQuote.first?.quote   ??  "Loading new quote!" )
                    .padding(40)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                Text(newQuote.first?.author   ??  "Author Name" )
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            
        }
        
        .frame(width: 350, height: 300)
    }
}

//#Preview {
//    QuoteCard()
//}
