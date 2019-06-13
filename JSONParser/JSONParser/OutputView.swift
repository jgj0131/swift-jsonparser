//
//  OutputView.swift
//  JSONParser
//
//  Created by jang gukjin on 02/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

/*
[{"name":"aiden","age":27},[9,true],8,"hello,world"]
[[9,8],"hello,world",{"name":"aiden","age":27,"home":true}]
*/
import Foundation

struct OutputView {
    private func dictionaryToArray(dictionary: [String:Json]) -> [Json]{
        var convertedData: [Json] = []
        for (key, _) in dictionary{
            convertedData.append(dictionary[key]!)
        }
        return convertedData
    }
    
    /// 값을 받아와서 출력하는 함수
    func printElements(jsonParser: JsonParser, dataMent:String) {
        var countMent: String = ""
        var jsonData: [Json] = []
        var jsonTexts: [String] = []
        if dataMent == "배열" {
            countMent = "\(jsonParser.arrayJsonData.count)"
            jsonData = jsonParser.arrayJsonData
            jsonTexts = jsonParser.printArrayJson(jsonData: jsonData)
        } else if dataMent == "객체" {
            countMent = "\(jsonParser.dictionaryJsonData.count)"
            jsonData = dictionaryToArray(dictionary: jsonParser.dictionaryJsonData)
        }
        print("총 \(countMent)개의 \(dataMent) 데이터 중에 ", terminator: "")
        let mentByTypes = MentOfCounts.makeMent(jsonData: jsonData)
        print("\(mentByTypes)가 포함되어 있습니다.")
        printJson(of: jsonTexts)
    }
    
    // Json 데이터를 한줄씩 출력하도록 변환된 배열을 출력하는 함수
    private func printJson(of printJson: [String]) {
        for index in 0..<printJson.count {
            if index == printJson.startIndex, printJson[index + 1] == "{" {
            print(printJson[index], terminator:"")
            } else if index == printJson.startIndex || index == printJson.endIndex-1 {
                print(printJson[index])
            } else if index-1 == printJson.startIndex, printJson[index] == "{" {
                print(printJson[index])
            } else {
                print(" "+printJson[index])
            }
        }
    }
}
