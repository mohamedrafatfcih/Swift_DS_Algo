
# Algorithms
  Algorithms like sorting, searching implemented using swift.


  ## Sorting
  
  - Buble Sort.
      - It start from the begining of the array and compare the first two elements, swap them if needed, then select the next two elements and so on till the array end. The largest element will be the last one after the first pass, then, do the other passes till the array become sorted.
      -  Notes:
            - Simple Implementation.
            - In-place sorting.
            - Best case is when array is sorted, complexity is O(n).
            - Worst case is when array is reversed, complexity is O(n^2).
            - Not efficient for large arrays.
  
  
  - Selection Sort.
      - It uses the linear search to find the smallest element.
      - Select the smallest element and swap it in the leftmost unsorted element. then, it consider it as sorted.
      - Notes:
        - Simple Implementation.
        - In-place sorting.
        - Worst case -> O(n^2).
        - Not efficient for large arrays.
