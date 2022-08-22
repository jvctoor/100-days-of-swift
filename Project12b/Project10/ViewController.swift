//
//  ViewController.swift
//  Project10
//
//  Created by João Victor on 11/08/22.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="Name to faces"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(addNewPerson))
        
        if let savedPeople = UserDefaults.standard.object(forKey: "people") as? Data {
            do {
                people = try JSONDecoder().decode([Person].self, from: savedPeople)
                
            } catch {
                print("Failed to load people")
            }
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else {
            fatalError("Unable to dequeue PersonCell.")
        }
        
        let person = people[indexPath.item]
        cell.name.text = person.name
        
        let path = getDocumentDirectory().appendingPathComponent(person.image)
        cell.imgView.image = UIImage(contentsOfFile: path.path)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        let ac = UIAlertController(title: "Rename person", message: nil, preferredStyle: .alert)
        
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self, weak ac] _ in
            guard let newName = ac?.textFields?[0].text else { return }
            person.name = newName
            self?.save()
            self?.collectionView.reloadData()
        }))
        
        ac.addAction((UIAlertAction(title: "Cancel", style: .cancel)))
        present(ac, animated: true)
                
    }
    
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let person = Person(name: "Unknown", image: "imageName")
        people.append(person)
        save()
        collectionView.reloadData()
        dismiss(animated: true)
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func save() {
        if let savedData = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(savedData, forKey: "people")
        } else {
            print("Failed to save people")
        }
    }
    
}

