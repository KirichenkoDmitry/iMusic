//
//  Library.swift
//  iMusic
//
//  Created by Дмитрий Кириченко on 27.12.2020.
//

import SwiftUI
import URLImage

struct Library: View {
    
    var tracks = UserDefaults.standard.savedTracks()
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        Button(action: {
                            print("12345")
                        }, label: {
                            Image(systemName: "play.fill")
                                .frame(width: abs(geometry.size.width / 2 - 10), height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 0.9921568627, green: 0.1764705882, blue: 0.3333333333, alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9531342387, green: 0.9490900636, blue: 0.9562709928, alpha: 1)))
                                .cornerRadius(10)
                        })
                        Button(action: {
                            print("54321")
                        }, label: {
                            Image(systemName: "arrow.2.circlepath")
                                .frame(width: abs(geometry.size.width / 2 - 10), height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 0.9921568627, green: 0.1764705882, blue: 0.3333333333, alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9531342387, green: 0.9490900636, blue: 0.9562709928, alpha: 1)))
                                .cornerRadius(10)
                        })
                    }
                }.padding().frame(height: 68)
                Divider().padding(.leading).padding(.trailing)

                List(tracks) { track in
                    LibraryCell(cell: track)
  
                }
            }
            .navigationBarTitle("Library")
        }
        
    }
}

struct LibraryCell: View {
    
    var cell: SearchViewModel.Cell
    
    var body: some View {
        HStack {
            URLImage(url: URL(string: cell.iconUrlString ?? "")!,
                     content: { image in
                        image
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(2)
                            .aspectRatio(contentMode: .fill)
                     })
            VStack(alignment: .leading) {
                Text("\(cell.trackName)")
                Text("\(cell.artistName)")
            }
        }
        
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}
