//
//  ViewController.swift
//  работа с сетью
//
//  Created by Иван Галиченко on 16.07.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
    }
    private func makeRequest() {
        var request = URLRequest(url: URL(string: "https://api.genderize.io/?name=scott")!)
        request.allHTTPHeaderFields = ["authToken": "nil"]
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data,responce, error in
            if let data = data, let Anyname = try? JSONDecoder().decode(Names.self, from: data) {
                print(Anyname.gender)
            }
        }
        task.resume()
    }
}

