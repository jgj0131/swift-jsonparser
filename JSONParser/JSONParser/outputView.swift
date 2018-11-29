//
//  OutputView.swift
//  JSONParser
//
//  Created by 김장수 on 30/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    // JSONParser에서 전달받은 데이터 세트를 출력
    func printParsedContents(by data: JSONFormat) {
        let total = data.typeTotal(), dataType = data.typeName()                // 전달받은 데이터의 총 수와 데이터명
        let eachData = data.countsEachData()                                    // 전달받은 데이터 각각의 수
        let ment = makeSentence(with: eachData)                                 // 각 데이터의 수를 가지고 출력문 생성
        let indent = makeIndent(with: eachData, data)                                 // 데이터 타입과 출력을 위한 인덴트 생성
        let contents = data.drawContents(with: indent)                          // 각 데이터와 인덴트를 가지고 출력문 생성
        
        print("총 \(total)개의 \(dataType) 데이터 중에 \(ment)가 포함되어 있습니다.")
        print(contents)
    }
    
    // JSON 데이터를 가지고 문장을 조합하는 메소드
    private func makeSentence(with count: (int: Int, bool: Int, string: Int, array: Int, object: Int)) -> String {
        var result = [String]()
        
        if count.int > 0 { result.append("숫자 \(count.int)개") }
        if count.bool > 0 { result.append("부울 \(count.bool)개") }
        if count.string > 0 { result.append("문자열 \(count.string)개") }
        if count.array > 0 { result.append("배열 \(count.array)개") }
        if count.object > 0 { result.append("객체 \(count.object)개") }
        
        return result.joined(separator: ", ")
    }
    
    private func makeIndent(with count: (int: Int, bool: Int, string: Int, array: Int, object: Int), _ type: JSONFormat) -> Int {
        if type is ObjectJSONData && count.object > 0 { return 1 }
        if type is ArrayJSONData && (count.array > 0 || count.object > 0) { return 1 }
        return 0
    }
}
