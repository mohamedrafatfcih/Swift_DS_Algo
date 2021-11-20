# Common Non-Premitive Data Structures (DS).
  - Introduced (stack, queue, linked list, ....) DS that are commonly known and used in many cases in our apps.
  - Provided example cases that should be close enough to the real world situations which trigger the need for building such DS.
 
 ## Stack
  Example case:
  - Assume you want to read set of books and you put them in a reading list. Aslo, you want to keep their reading order to help you to get back quickly to the last read book.
 
 ## Queue
 Example case: 
 - Assume you are in metero station and you want to buy a ticket the so, you will go to one of the selling windows and wait at the end of the people line.
 
 ## Linked List
  - Notes :
      - It is linear data structre.
      - Every element is a node.
      - It uses head and tail nodes.
      - Quick insertion and deletion.
      - Adding new element will be through appending or insertion at a position.
      - Deleting element will be from the end (tail) or at a position.
      - You have to use classes for linked list because they are reference type which it needed for next reference.
  
  ### Single Linked List
   - Example Case: 
        - you have childern in a school class and you want to place them. Also you want to make each child know his next classmate.
  
  ### Double Linked List 
   - Example Case:
       - Assume that you have students in a class and you want to place them. Also, you want from each one to know who is his before and after classmates.
  

## HashTable
  - Notes:
      - Search complexity is O(1).
      - Insertion, Deletion depends on the bucket size (hashtable slot).


  - Example Case:
      - Assume that you have a list of employees and the search operation is very important for you (because it the most frequant operation in your system). So, you decided to store them in such away that gives you O(1) in search. at that time you can use the HashTable DS.


## Tree
   - It is a non-linear (heirarchal) DS.
   - There are variations of tree DS like :
        - Binary Tree
            - Notes:-
            - BT has variations like:
                - Full Binary Tree.
                - Perfect Binary Tree.
                - Complete Binary Tree.
                - Balanced Binary Tree.
                - etc...
            - Travese/search types:
                - Pre-Order  -> i.e. (parent, left, right)
                - In-Order -> i.e. (left, parent, right)
                - Post-Order -> i.e. (left, right, node)


        - Binary Search Tree (BST):
            -  Notes:
                - It is a binary tree.
                - always any node is greater than its left child and less than its right child.
                - Insertion, search and deletion complexity in most cases is O(log n).
                - If all nodes values have some ascending/descending order the BST may end up with a linear structure like Linked List DS. So, the tree operations complexity will be O(n). (worst senario).
            
            - Example Case:-
                - Assume you have already decided to store your data in a tree DS and you want to reduce the search time and keep the data in a sorted manner. So, BST is a good tree variant for such case. (But, consider the worst case).
                
        - Red-Black Tree
        - R Tree
        - Trie , etc..
 
 
   - Example Case:
     - You have a family and you want to store the family members in such a way to preserve their heirarchy.


## Trie

   - Notes: 
        - Each node store one character.
        - It is better than HashTable DS in case of string prefix matching.
            - No collisions.
            - No hash function.
            - Better worst case.
            
   - Example Case:
      - Assume you have a language consist of number of characters then you want to check if a word or a set of words exists in that language words or not. at that case, we can use a Trie DS to store your language words which enables the fast querying.

