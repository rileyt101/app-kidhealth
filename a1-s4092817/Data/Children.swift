//
//  Children.swift
//  a1-s4092817
//
//  Created by Riley Tran on 26/8/2026.
//

let childrenData: [Child] = [
    Child(name: "Ryan"
         ),
    Child(name: "Amanda",
          allergies: [Allergy(name: "Eggs", severity: "Severe", medication: "EpiPen", notes: "EpiPen is kept in the front pocket of her schoolbag. Allergic to the whites of the egg."),
                      Allergy(name: "Peanuts", severity: "Strong", medication: "EpiPen", notes: "EpiPen is kept in the front pocket of her schoolbag.")]
         ),
    Child(name: "Sammy",
          allergies: [Allergy(name: "Walnuts", severity: "Severe", medication: "EpiPen"),
                      Allergy(name: "Pollen", severity: "Moderate", medication: "Inhaler")]
         )
]

