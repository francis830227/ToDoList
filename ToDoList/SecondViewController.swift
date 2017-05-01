
import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func changeText(_ sender: UITextField) {
        if myTextField.text == ""{
            addButton.setTitle("Back", for: UIControlState())
            addButton.setTitle("Back", for: .selected)
        }else{
            addButton.setTitle("Add", for: UIControlState())
            addButton.setTitle("Add", for: .selected)
        }
    }
    
    @IBAction func addTasks(_ sender: UIButton) {
        if myTextField.text != ""{
            //存檔
            tasks.append(myTextField.text!)
            UserDefaults.standard.set(tasks, forKey: "tasks")
        }
        myTextField.text = ""
        myTextField.resignFirstResponder()
        self.tabBarController?.selectedIndex = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        myTextField.becomeFirstResponder()
        addButton.setTitle("Back", for: UIControlState())
        addButton.setTitle("Back", for: .selected)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if myTextField.text != ""{
            //存檔
            tasks.append(myTextField.text!)
            UserDefaults.standard.set(tasks, forKey: "tasks")
            myTextField.text = ""
            myTextField.resignFirstResponder()
            self.tabBarController?.selectedIndex = 0
        }
        
        
        return true
    }
}

