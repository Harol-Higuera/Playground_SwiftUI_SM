import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView()) {
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


private func ordinal(_ n: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter.string(for: n) ?? ""
}

struct CounterView: View {
    @State var count: Int = 0
    var body: some View {
        // self.$count // Binding<Int>
        VStack {
            HStack {
                Button(action: {
                    self.count -= 1
                }) {
                    Text("-")
                }
                Text("\(self.count)")
                Button(action: {
                    self.count += 1
                }) {
                    Text("+")
                }
            }
            Button(action: {
            }) {
                Text("Is this prime?")
            }
            Button(action: {}) {
                Text("What is the \(ordinal(self.count)) prime?")
            }
        }.font(.title)
            .navigationTitle("Counter Demo")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


