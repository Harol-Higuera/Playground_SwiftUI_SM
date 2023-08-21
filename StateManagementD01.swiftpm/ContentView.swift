import SwiftUI

struct ContentView: View {
    @ObservedObject var appState: AppState
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(appState: self.appState)) {
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

/**
 A Global State that could be read and changed from any part of the application.
 
 ObservableObject -> A type of object with a publisher that emits before the object has changed
 @Published -> A type alias for the Combine framework’s type that allow us to subscribe to changes on the state
 */
class AppState: ObservableObject {
    @Published var count = 0
}

/**
 ObservedObject -> A property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes.
 */
struct CounterView: View {
    @ObservedObject var appState: AppState
    var body: some View {
        // self.$count // Binding<Int>
        VStack {
            HStack {
                Button(action: {
                    self.appState.count -= 1
                }) {
                    Text("-")
                }
                Text("\(self.appState.count)")
                Button(action: {
                    self.appState.count += 1
                }) {
                    Text("+")
                }
            }
            Button(action: {
            }) {
                Text("Is this prime?")
            }
            Button(action: {}) {
                Text("What is the \(ordinal(self.appState.count)) prime?")
            }
        }.font(.title)
            .navigationTitle("Counter Demo")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appState: AppState())
    }
}


