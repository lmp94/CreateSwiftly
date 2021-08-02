Implement Least Frequently Used (LFU) Cache
- Public API
  - getter, get(key : Key) -> V?
  - setter, put()
- Constructor
  - capacity // ex. cap = 10 after the 11 item follow the eviction protocol

// Evicition: which is used the least frequent, keep track of the # of times you use each item in the cache
//


// (key: into Cache) -> needed
// Cache, [K: [Value, Int]] K: Node, V: used times
// Node<K, V> >> time
//

// Add
// sort as go
// Full: Remove LFU,
// O:10 > O:9 > Tail
// Get

struct Node<K, V> {
  let key: Any
  let value: Any
  var count: Int
    
  // Linked List Portion 
  var prev: Node?
  var next: Node?
  
  public func Node(_ k: K, v: V) {
    key = k
    value = v
    timesUsed = 1 // Only make it when it ins the cache aka its has been asked for onces
  }
}

class LFUCache { //.. Hashbable
  
  var list: LinkedList
  // Better ways to write this generic than what it is
  var cache: [K: Node<K, V>] // K: Item Idenifier, V: count (usage)
  let maxCapacity: Int
  let currentCapacity: Int = 0
  
  public func LFUCache(_ capacity: Int) {
    // validity checks if needed
    maxCapacity = capacity
    cache = LinkedList() // give head and tail [
  }
  
  // Comparable needs to be accounted for
  // If item isn't in the cache, return nil
  public func get(_ key: Key) -> V? {
    guard let value = cache[key] else {
      return nil
    }
   cache[item] = value + 1
   reutrn
  }

  public func put(_ key: Key, value: Value) {
    if let node = cache[key]{// update key count
      node.count =+ 1
    }
    else {
      currentCapacity = currentCapacity + 1
      // too full, remove from cache & end of the list by ptrs
      
      if currentCapacity = maxCapacity,
         let node = list.tail.prev { //Evict
           cache[node.key] = nil // remove from cache
           let prior = node.prev
           // remove
           
           // create new node and hook up

            let newNode = Node(key, value) // create new node to add
            let endNode = node // save the node infront of the tail
            newNode.next = list.tail // tail should be behind new node
            newNode.prev = endNode
         }
      }
  }
  
}
