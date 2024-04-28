import SwiftUI

// Define a structure for jokes
struct Joke {
    var question: String
    var answer: String
    var imageName: String?  // Optional image name for jokes that use images
    var punchlineImageName: String?
}

// Main content view with tab navigation
struct ContentView: View {
    var body: some View {
        TabView {
            JokeCategoryView(category: "Good", jokes: [
                Joke(question: "What do you call cheese that isn't yours?", answer: "Nacho cheese!"),
                Joke(question: "Why couldn't the bicycle stand up by itself?", answer: "It was two-tired!")
            ])
            .tabItem {
                Label("Good", systemImage: "star.fill")
            }
            
            JokeCategoryView(category: "Pun", jokes: [
                Joke(question: "How do you organize a space party?", answer: "You planet!"),
                Joke(question: "What do you call a fake noodle?", answer: "An impasta!")
            ])
            .tabItem {
                Label("Pun", systemImage: "puzzlepiece.fill")
            }
            
            JokeCategoryView(category: "Dad", jokes: [
                Joke(question: "Did you hear about the restaurant on the moon?", answer: "Great food, no atmosphere!"),
                Joke(question: "Why did the scarecrow win an award?", answer: "Because he was outstanding in his field!")
            ])
            .tabItem {
                Label("Dad", systemImage: "person.fill")
            }
        }
    }
}

//// View for displaying jokes by category
//struct JokeCategoryView: View {
//    var category: String
//    var jokes: [Joke]
//    @State private var showPunchline = false
//    @State private var currentJokeIndex = 0
//    
//    var body: some View {
//        VStack {
//            Spacer()
//            if let imageName = jokes[currentJokeIndex].imageName, showPunchline {
//                Image(imageName)
//                    .resizable()
//                    .scaledToFit()
//                    .padding()
//            } else {
//                Text(showPunchline ? jokes[currentJokeIndex].answer : jokes[currentJokeIndex].question)
//                    .padding()
//            }
//            Spacer()
//            Button("Next") {
//                if showPunchline {
//                    // Move to the next joke
//                    currentJokeIndex = (currentJokeIndex + 1) % jokes.count
//                    showPunchline = false
//                } else {
//                    // Show the punchline
//                    showPunchline = true
//                }
//            }
//            .padding()
//            .buttonStyle(.bordered)
//            .cornerRadius(8)
//            .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 50)
//        }
//        .navigationTitle(category)
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}

struct JokeCategoryView: View {
    var category: String
    var jokes: [Joke]
    @State private var showPunchline = false
    @State private var currentJokeIndex = 0

    var body: some View {
        VStack {
            Spacer()
            Group {
                if showPunchline, let imageName = jokes[currentJokeIndex].imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text(showPunchline ? jokes[currentJokeIndex].answer : jokes[currentJokeIndex].question)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            Spacer()
            Button(action: {
                withAnimation {
                    if showPunchline {
                        // Move to the next joke
                        currentJokeIndex = (currentJokeIndex + 1) % jokes.count
                        showPunchline = false
                    } else {
                        // Show the punchline
                        showPunchline = true
                    }
                }
            }) {
                Text("Next")
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .padding(.trailing, 20)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .navigationBarTitle(Text(category), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}
//@main
//struct iKidApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
