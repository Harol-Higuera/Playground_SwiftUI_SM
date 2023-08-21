import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: EmptyView()) {
                    Text("Counter Demo")
                }
                NavigationLink(destination: EmptyView()) {
                    Text("Favourite primes")
                }
            }
            .navigationTitle("State Management")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


