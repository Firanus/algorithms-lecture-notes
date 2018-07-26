# A1 - QuickUnion Implementation

```Java
public class QuickUnionUF
{
  private int[] id;
  private int[] size;
  
  public QuickUnionUF(int N)
  {
    id = new int[N];
    size = new int[N];
    for (int i = 0; i<N; i++)
      id[i] = i;
      size[i] = 1;
  }
  
  public boolean find(int p, int q) 
  {
    return root(p) == root(q)
  }
  
  public void union(int p, int q)
  {
    int rootP = root(p)
    int rootQ = root(q)
    if (rootP == rootQ) return;
    
    //Weighting changes
    if size[rootP] < size[rootQ] {
      id[rootP] = rootQ;
      size[rootQ] = size[rootP];
    } else {
      id[rootQ] = rootP;
      size[rootP] = size[rootQ];
    }
  }
  
  private int root(int p)
  {
    while (id[p] != p) 
    {
      id[p] = id[id[p]];
      p = id[p];
    }
    return p;
  }
}
```