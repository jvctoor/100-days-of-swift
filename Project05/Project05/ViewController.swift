//
//  ViewController.swift
//  Project05
//
//  Created by João Victor on 03/08/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var useWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Word Scramble"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return useWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = useWords[indexPath.row]
        return cell
    }
    
    func startGame() {
        title = allWords.randomElement()
        useWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
}

