//
//  UserCell.swift
//  Instagram
//
//  Created by Sangkon Han on 2021/10/25.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("user")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("MJ").font(.system(size: 14, weight: .semibold))
                Text("Michael Jordan").font(.system(size: 14))
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
