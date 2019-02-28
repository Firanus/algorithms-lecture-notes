# A5 - Shellsort

```Java
public class Shell {
  public static void sort(Comparable[] a) {
    int N = a.length;
    
    int h = 1;
    while (h < N/3) h = h*3 + 1;
    
    while (h > 0) {
      for (int i = h; i < N; i++) {
        for (int j = i; j >= h && less(a[j], a[j-h]); j -= h) {
            exch(a, j, j-h);
        }
      }
      
      // h=h/3 also works, as int division drops remainder, but less readable.
      h = (h - 1) / 3;
    }
  }
  
  private static boolean less(Comparable v, Comparable w) {
    return v.compareTo(w) < 0;
  }

  private static void exch(Comparable[] a, int i, int j) {
    Comparable swap = a[i];
    a[i] = a[j];
    a[j] = swap;
  }
}
```
