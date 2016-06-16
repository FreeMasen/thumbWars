class WizardThumb {
var level: Int { get } 
  var health: Int { get } 
  var baseAttack: Int { get } 
  var physicalDefence: Int { get } 
  var magicResistance: Int { get } 
  var items: [ItemType] { get } 
  var weapons: [WeaponType] { get } 
  var armor: [ArmorType] { get } 
  func attack(with weapon: WeaponType) -> Attack {
    
  }
  func defend(against: Attack) {
    
  }

}
