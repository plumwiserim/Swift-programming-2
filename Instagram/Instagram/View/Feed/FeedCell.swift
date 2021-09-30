//
//  FeedCell.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/09/30.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("user").resizable().scaledToFill().frame(width: 36, height: 36).clipped().cornerRadius(18)
                Text("DY").font(.system(size:14, weight:.semibold))
            }
            Image("postimage").resizable().scaledToFill().frame(maxHeight: 440).clipped().cornerRadius(18)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
