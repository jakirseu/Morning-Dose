import SwiftUI
struct ContentView: View {
    
    @State var newQuote: [Quote] = []
    @State private var isFetchingData = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack {
                if isFetchingData {
                    ProgressView("Fetching data...")
                } else {
                    QuoteCard(newQuote: newQuote)
                }
                
                Button("Get A New Quote") {
                    isFetchingData = true
                    Task{
                        do {
                            newQuote =  try await  Networking.loadData()
                        } catch {
                            print("Error", error)
                        }
                        isFetchingData = false
                    }
                    
                }
                .padding()
                .background(.gray)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .cornerRadius(5.0)
                .foregroundColor(.white)
                
                .task {
                    do {
                        newQuote =  try await  Networking.loadData()
                        
                    } catch {
                        print("Error", error)
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
