//
//  ThreadManager.swift
//  Leet
//
//  Created by Larissa Perara on 3/29/21.
//  Copyright © 2021 Larissa Perara. All rights reserved.
//

import Foundation

// We are going to use this class to distrupte and create examples that are
// commom practicies for threading within swift




// MARK: - Thread Manager Class
class ThreadManager {
    
    private func loadJSONData(_ request: URLRequest?, completion: @escaping ((_ data: String?) -> Void)) {
        guard let request = request else {
            completion(nil)
            return
        }
        
        session.dataTask(with: request) { [weak self, completion, request] data, response, error in
            guard let strongSelf = self else {
                print("Lost self")
                completion(nil)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  error == nil,
                  let taskData = data else {
                print("Task Failed: response - \(String(describing: response)), error - \(String(describing: error))")
                completion(nil)
                return
            }
            do {
                let dataArray = try JSONDecoder().decode(DataSetContainer.self, from: taskData)
                
                // print("We have decoded a data array with count: \(dataArray.data.count)")
                
                strongSelf.dataSummary = IACODataSummary(query: request.description, list: dataArray.data)
                
                // let string = strongSelf.dataSummaryToString() - This will aggregate the IACO raw text into a string
                //print("String we are passing back to the front end: \(string)")
                
                completion(strongSelf.getFullData()) // Same thing here, these variables are not truly needed, but created for learning and exploration.
                
            } catch {
                print("Error: decoded json")
                completion(nil)
                return
            }
        }.resume()
    }
}
    
}
