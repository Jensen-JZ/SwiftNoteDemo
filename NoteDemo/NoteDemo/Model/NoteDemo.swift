//
//  NoteDemo.swift
//  NoteDemo
//
//  Created by Jensen Jon on 2021/11/17.
//

//import Foundation
//
//struct NoteDemo {
//    struct noteContent: Codable {
//        var noteTitle: String
//        var endTime: String
//        var content: String
//    }
//
//    func encodeJson(data: [String: String]) -> Data {
//        try! JSONEncoder().encode(data)
//    }
//
//    func saveData(data: Data, fileName: String) {
//        let fileManager = FileManager.default
//        let filePath:String = NSHomeDirectory() + "/Documents/" + fileName
//        let exist = fileManager.fileExists(atPath: filePath)
//        if !exist {
//            let createSuccess = fileManager.createFile(atPath: filePath, contents: data, attributes: nil)
//            print("文件创建结果：\(createSuccess)")
//        } else {
//            print("文件已存在！")
//        }
//        print("文件路径：\(filePath)")
//    }
//
//    func readData() -> noteContent? {
//        let fileManager = FileManager.default
//        let filePath:String = NSHomeDirectory() + "/Documents/NoteContent.json"
//        let exist = fileManager.fileExists(atPath: filePath)
//        if exist {
//            let readHandler = try! FileHandle(forReadingFrom: URL(string: filePath)!)
//            let data = readHandler.readDataToEndOfFile()
//            return decodeJson(data: data)
//        } else {
//            print("不存在该文件!")
//            return nil
//        }
//    }
//
//    func decodeJson(data: Data) -> noteContent {
//        try! JSONDecoder().decode(noteContent.self, from: data)
//    }
//
//}
