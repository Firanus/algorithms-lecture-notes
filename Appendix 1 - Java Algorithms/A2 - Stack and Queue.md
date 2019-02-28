# A2 - Stack and Queue Implementations

## Stacks

```Java
public class LinkedStack<Item> {
  private Node first = null;
  
  private class Node {
    Item item;
    Node next;
  }
  
  void push (Item item) {
    Node newFirst = new Node();
    newFirst.item = item;
    newFirst.next = first;
    first = newFirst;
  }
  
  Item pop() {
    Node oldFirst = first;
    first = oldFirst.next;
    return oldFirst.item;
  }
  
  boolean isEmpty() {
    return first == null;
  }
}
```

```Java
public class ResizingArrayStack<Item> {
  private int N = 0;
  private Item[] s;
  
  public ResizingArrayStack() {
    s = (Item[]) new Object[1];
  }
  
  public boolean isEmpty() {
    return N == 0;
  }

  public void push(Item item) {
    if (N == s.length) resize(2 * s.length);
    s[N++] = item;
  }

  private void resize(int capacity) {
    Item[] newS = (Item[]) new Object[capacity];

    for (int i = 0; i < s.length; i++) {
      newS[i] = s[i];
    }

    s = newS;
  }

  public String pop() {
    Item item = s[--N];
    s[N] = null;
    return item;
  }
}
```

## Queues

```Java
public class LinkedQueue<Item> {
  private Node first;
  private Node last;

  private class Node {
    Item item;
    Node next;
  }
  
  void enqueue(Item item) {
    Node newLast = new Node();
    newLast.item = item;
    newLast.next = null;
    if (isEmpty()) { // special case for empty queue
      first = newLast;
    } else {
      last.next = newLast;
    }
    last = newLast;
  }
  
  String dequeue() {
    String returnItem = first.item;
    first = first.next;
    if(isEmpty()) { //special case for empty queue
      last = null;
    }
    return returnItem;
  }
  
  boolean isEmpty() {
    return first == null;
  }
}
```
