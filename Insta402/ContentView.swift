//
//  ContentView.swift
//  Insta402
//
//  Created by Will Taylor on 2/23/21.
//

import SwiftUI

struct ContentView: View {
    
    let posts = [
        InstaPost(
            userName: "@local_genius",
            date: "February 10, 2021",
            locationName: "New York, New York",
            profileImage: UIImage(named: "einstein")!,
            images: [UIImage(named: "NY")!, UIImage(named: "NY2")!, UIImage(named: "NY3")!],
            caption: "Hello from the Big 🍎"
        ),
        InstaPost(
            userName: "@mr_ceo",
            date: "January 31, 2021",
            locationName: "Cupertino, CA",
            profileImage: UIImage(named: "cook")!,
            images: [UIImage(named: "apple_office")!],
            caption: "Just another day at the office!"
        ),
        InstaPost(
            userName: "@that_402_dev",
            date: "January 20, 2021",
            locationName: "Lincoln, NE",
            profileImage: UIImage(named: "profilePicture")!,
            images: [UIImage(named: "sunflower")!],
            caption: "Sunflower Sunsets 🌅"
        )
    ]
    
    var body: some View {
        ScrollView {
            ForEach(posts, id: \.self) { post in
                PostView(post: post)
                Divider()
            }
        }
    }
}

struct PostView: View {
    
    let post: InstaPost
    
    var body: some View {
        VStack {
            // Top Bar
            HStack {
                Image(uiImage: post.profileImage)
                    .resizable()
                    .frame(maxWidth: 50, maxHeight: 50)
                    .mask(Circle())
                    .shadow(radius: 16)
                VStack(alignment: .leading) {
                    Text(post.userName)
                        .bold()
                        .font(.callout)
                    Text(post.locationName)
                        .font(.caption2)
                }
                
                Spacer()
                
                Button(action: {print("Show options")}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            
            if post.images.count != 1 {
                TabView {
                    ForEach(post.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
            } else {
                Image(uiImage: post.images.first!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            
            
            // Button Row
            HStack {
                Button(action: {print("Like")}) {
                    Image(systemName: "heart")
                        .foregroundColor(Color(UIColor.label))
                }
                Button(action: {print("Comment")}) {
                    Image(systemName: "bubble.left")
                        .foregroundColor(Color(UIColor.label))
                }
                Button(action: {print("Share")}) {
                    Image(systemName: "paperplane")
                        .foregroundColor(Color(UIColor.label))
                }
                
                Spacer()
                
                Button(action: {print("Share")}) {
                    Image(systemName: "bookmark")
                        .foregroundColor(Color(UIColor.label))
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(post.userName)
                        .font(.caption)
                        .bold()
                    Text(post.caption)
                        .font(.caption)
                    Spacer()
                }
                
                Text(post.date)
                    .font(.caption2)
                    .foregroundColor(Color(UIColor.secondaryLabel))
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
