//
//  AddingText.swift
//  pieceOfSwiftUI
//
//  Created by Kangmin on 3/22/24.
//

import SwiftUI

struct AddingText: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) // 문자열을 출력하는 View
//            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/) // 폰트 제어 Modifier
//            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/) // 폰트 두께감 제어 Modifier
            .font(.system(size: 40, weight: .semibold)) // 폰트를 직관적으로 제어하는 Modifier
//            .underline() // 밑줄 제어 Modifier
            .underline(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, color: Color.blue) // 밑줄 Modifier에 설정 값 부여
//            .strikethrough() // 취소선 Modifier
            .strikethrough(true, pattern: .dashDotDot, color: Color.red) // 취소선 Modifier 설정 값 부여
            .baselineOffset(10) // Text 기준선 제어 Modifier
            .kerning(10) // 자간 제어 Modifier
    }
}

#Preview {
    AddingText()
}
