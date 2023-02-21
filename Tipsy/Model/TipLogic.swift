import Foundation

struct TipLogic{
    var tipLogic: Data?
    
    mutating func setData(bill:String,tips:String,split:String){
         let value = tips.components(separatedBy: "%")
         var tip = Float(value[0])!
         tip = tip / 100
         tipLogic = Data(billTotal: Float(bill)!, tipPercentage: tip, split: Int(split)!)
     }

    func calculate() -> Float{
        let value: Float? = (tipLogic?.billTotal ?? 0.0)! + ((tipLogic?.tipPercentage ?? 0.0) * (tipLogic?.billTotal ?? 0.0))
        let result: Float = Float((value ?? 0.0) / Float(tipLogic?.split ?? Int(0.0)))
        print(result)
        return result
    }


}
