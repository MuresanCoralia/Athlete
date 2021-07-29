//
//  AthleteFormViewController.swift
//  AthleteFormViewController
//
//  Created by Wolfpack Digital on 29.07.2021.
//

import UIKit

class AthleteFormViewController: UIViewController
{

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var leagueTextField: UITextField!
    
    @IBOutlet weak var teamTextField: UITextField!
    
    
    var athlete: Athlete?
    
    init?(coder: NSCoder, athlete: Athlete?)
    {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        updateView()
    }
    
    func updateView()
    {
        if athlete != nil
        {
            if athlete is Athlete
            {
                nameTextField.text = athlete?.name
                let ageToString = String(athlete!.age)
                ageTextField.text = ageToString
                leagueTextField.text = athlete?.league
                teamTextField.text = athlete?.team
            }
        }
    }
 

    @IBAction func saveButtonPressed(_ sender: Any)
    {
        guard let name = nameTextField.text,
            let ageString = ageTextField.text,
            let age = Int(ageString),
            let league = leagueTextField.text,
            let team = teamTextField.text else {return}
        
            athlete = Athlete(name: name, age: age, league: league,
            team: team)
    

        //self.navigationController?.popToRootViewController(animated: true)
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
    

}
