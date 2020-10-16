//
//  IngridientData.swift
//  XPack2
//
//  Created by Jazilul Athoya on 07/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import Foundation

class IngredientData {
    
    
    let data = [
        ["Brown Rice", "Romaine Lettuce", "Sweet Potato", "Whole-wheat Pasta", "Baby Spinach", "Quinoa"],
        ["Chicken Breast", "Dory", "Tilapia", "Tofu", "Rib Eye Steak", "Salmon"],
        ["Baby Corn", "Bell Papers", "Broccoli", "Butter Bean", "Button Mushrooms", "Carrots", "Cherry Tomatoes", "Couscous", "Egg Whites", "Kimchi", "Onsen Egg", "Pumpkin", "Spicy Edamame", "Sweet Corn", "Wakame", "Zucchini", "Avocado"],
        ["Almonds", "Furikake", "Garlic", "Mixed Seeds", "Raisins", "Tortilla"],
        ["Barbeque", "Green Curry", "Mint Yogurt", "Miso Mustard", "Pesto Vinaigrette", "Romesco", "Sesame Peanut", "Thai"]
    ]
    
    let imageDescription = [
        ["nutty flavor and a medium to firm, chewy texture", "crisp, succulent, and crunchy with a mild, slightly bitter taste",
        "a mild, starchy, sweet flavor", "similar in firmness to pasta with 10% pea fiber, as measured by Instron", "smooth smallest leaves of the flat-leaf variety", "fluffy, creamy, crunchy and somewhat nutty, all rolled into one"],
        ["bone-in, boneless, skin-on and skinless which consists of white meat only", " white flesh and a firm, flaky texture",
        "a mild-flavored, lean fish", "coagulating soy milk, resulting curds into solid white blocks of varying softness", "mouthwatering, juiciness, and flavor in every bite", "mildly flavored meat which came right out of the sea"],
        ["slightly sweet and earthy and very vegetal, it tastes like the liquid. It's crunchy but mushy at the same time. It doesn't have the snap, the crunch and the life that fresh corn has", " thick flesh, are crunchy and juicy, and are often eaten raw, sauteed, roasted or stuffed", "broccoli vegetables food", "Butter Bean", "Button Mushrooms", "Carrots", "Cherry Tomatoes", "Couscous", "Egg Whites", "Kimchi", "Onsen Egg", "Pumpkin", "Spicy Edamame", "Sweet Corn", "Wakame", "Zucchini", "Avocado" ],
        ["Almonds", "Furikake", "Garlic", "Mixed Seeds", "Raisins", "Tortilla"],
        ["Barbeque", "Green Curry", "Mint Yogurt", "Miso Mustard", "Pesto Vinaigrette", "Romesco", "Sesame Peanut", "Thai"]
    ]
    
    
    let additionalPrice: [String:Int] = ["Baby Spinach": 10, "Quinoa": 10, "Rib Eye Steak": 10, "Salmon": 20, "Avocado": 10]
    
    let additionalServing: [IngredientType:Int] = [.base: 10, .supplement: 10, .topping: 5, .dressing: 5]
    
    var bases: [[String]] {
        get {
            return [data[0], imageDescription[0]]
        }
    }
    
    var proteins: [[String]] {
        get {
            return [data[1], imageDescription[1]]
        }
    }
    
    var supplemets: [[String]] {
        get {
            return [data[2], imageDescription[2]]
        }
    }
    
    var toppings: [[String]] {
        get {
            return [data[3], imageDescription[3]]
        }
    }
    
    var dressings: [[String]] {
        get {
            return [data[4], imageDescription[4]]
        }
    }
}
