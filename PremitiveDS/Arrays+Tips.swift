//
//  Arrays+Tips.swift
//  
//
//  Created by MohamedRafat on 11/13/21.
//

import Foundation


 // Efficient Array Creation

var myArr: [Int] = [3, 6, 0, 2]
myArr.append(5)// Appending new element takes time.

///  What happens behind the scene is :-
  /*
     // Geometric Growth Pattern:
   
        1- Reallocation: reserve a new storage in the memory bigger than the original array.
        2- Copying: copy the original elements to the new storage.
        3- Adding the new element 5 to the new storage.
  */

/// Recommendation:-
  /*
    - Reserve a storage for your array in the initialization step which should be approximatlly close to the expected size of the array.
    - With this way, you will prevent this pattern from occurring frequently because its growth is exponential.
  */
myArr.reserveCapacity(30)
     

/// Copying Array :-

var myArrCopy = myArr  // Coping is not done yet.
myArr.append(4) // Copying is done here. (Copy on Write)
  /*
     What happend is:-
        - Swift is not performing the actual copy operation until a mutation operation is performed on the array.
        - This feature is called Copy on Write.
   */


/// Safe element removal for an array :-
if let removalIndex = myArr.firstIndex(of: 3) { // Find the element first to avoid the crashes.
    let _ = myArr.remove(at: removalIndex) // confidnet removal.
}


