//
//  ContentView.swift
//  healthbook
//
//  Created by Matthieu Oliviers on 08/Oct/2021.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var VaccinePickerView: UIPickerView!
    @IBOutlet weak var VaccineDateDatePicker: UIDatePicker!
    @IBOutlet weak var VaccineLabel: UILabel!
     
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Do any additional setup after loading the view, typically from a nib
    }

   
    @IBAction func AddVaccineAction(_ sender: Any) {
    
    
    // Code when vaccine Added
        
        // check editing ended
        view.endEditing(true)

        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let StrDateVaccine = dateFormatter.string(from: VaccineDateDatePicker.date)
        
        // Check that the user add text for vaccine
        if VaccinePickerView.text != nil {
            let NameVaccine = VaccinePickerView.text!

//            VaccineLabel.text = "Vos vaccins: \(NameVaccine) "
            VaccineLabel.text = "Vos vaccins: \(NameVaccine) le \(StrDateVaccine) "

        }
   
   
    }

 
}

//import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
