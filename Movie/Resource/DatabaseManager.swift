//
//  DatabaseManager.swift
//  Movie
//
//  Created by Ngoduc on 7/7/20.
//  Copyright © 2020 com.techmaster.D. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

func getAllQuestion(completion: @escaping (Movies)->Void){
    
    let urlString  = "https://itunes.apple.com/search?term=adele&limit=10"
//    let url =  URL(string: urlString)!
//
//    let sessisonConfiguration = URLSessionConfiguration.ephemeral
//
//    let session = URLSession(configuration: sessisonConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
//    let dataTask = session.dataTask(with: url) { (data, response, error) in
//        guard let data = data else { return }
//        do {
//            let newData = try JSONDecoder().decode(Stack.self, from: data)
//
////            print(newData.items.count)
////            for item in newData.items {
////                let question = Question(title: item.title, tags: item.tags, answerCount: item.answer_count, score: item.score, link: item.link)
////                arrayQuestion.append(question)
////
////            }
//            completion(newData)
////            print(newData.has_more)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    dataTask.resume()
    
    AF.request("https://itunes.apple.com/search?term=adele&limit=10").response{ data in
               switch data.result {
               case .failure(let error):
                   print(error.localizedDescription)
               case .success(let result):
                   let data = Movies(JSON(result))
                   completion(data)
                   print(data.results)
                   for movie in data.results {
                       print(movie.previewURL)
                   }
                  
               }
           }
}
