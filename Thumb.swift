class Thumb {
	var level: Int 
	var health: Int {
		return (20 + (level * 10)) + healthBonus
	}
	var baseAttack: Int {
		return (level + boostValue) 
	}
	var physicalDefence: Int {
		return (10 + level) + defenceBonus
	}
	var magicResistance: Int {
		return (10 + level) + resistanceBonus
	}
	var ownedHelmets = [HelmetType]()
	var equippedHelmet: HelmetType?
	var ownedRings = [RingType]()
	var equippedRings: RingType?
	var equippedBoosts = [BoostType]()
	
	//TOTO, turn into computed properties based on
	//all items warn
	private var attackBonus: Int
	private var magicBonus: Int
	private var defenceBonus: Int
	private var resistanceBonus: Int
	private var healthBonus: Int
	
	
	func attack(with weapon: WeaponType) -> Attack {
		let roll = Dice.d20.roll()
		var dmg = 0
		if roll > 0 {
			roll += baseAttack
			var baseDmg = weapon.damageRoll.roll()
			if roll == 20 {
				baseDmg * 2
			}
			dmg = baseDmg
		}
		return Attack(attackType: weapon.AttackType, dmg: dmg, roll: roll)
	}
	
	func defend(against: Attack) {
		
	}
}
