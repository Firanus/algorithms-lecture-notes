# A6 - Mergesort

```Java
public class Merge {
  private final int CUTOFF = 7;
  private static Comparable[] aux;
  
  public static void sort(Comparable[] a) {
    aux = new Comparable[a.length]; //Important to do this outside the recursion 
    sort(a, aux, 0, a.length - 1);
  }
  
  private static void sort(Comparable[] a, Comparable[] aux, int lo, int hi) {
    if (hi <= lo + CUTOFF - 1) {
      Insertion.sort(a, lo, hi);
      return;
    }
    
    int mid = lo + (hi - lo) / 2;
    sort (aux, a, lo, mid);
    sort (aux, a, mid + 1, hi);
    if (!less(a[mid+1], a[mid])) return;
    merge(a, aux, lo, mid, hi);
  }
  
  private static void merge(Comparable[] a, Comparable[] aux, int lo, int mid, int hi) {
    int i = lo, j = mid+1;
    
    for (int k = 0; k <= hi; k++) {
      if      (i > mid)              a[k] = aux[j++];
      else if (j > hi)               a[k] = aux[i++];
      else if (less(aux[j], aux[i])) a[k] = aux[j++];
      else                           a[k] = aux[i++];
    }
  }
  
  private static boolean less(Comparable v, Comparable w) {
    return v.compareTo(w) < 0;
  }
}
```