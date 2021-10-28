//
//  UserCell.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/10/28.
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
                Text("do0_nct").font(.system(size: 14, weight: .semibold))
                Text("Doyoung").font(.system(size: 14))
                
            }
            // 공간을 확보
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
