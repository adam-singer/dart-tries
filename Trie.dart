#library ("trie");

/*
* A simple generic Trie interface. Trie uses Strings as keys.
*/
interface Trie<T> {

  /**
   * Adds item [T] to trie using given String [key].
   */
  void operator []=(String key, T value);

  /**
   * Retrieves the value identified by [str], [null] otherwise.
   */
  T operator [](String key);

  /**
   * Returns a [Collection] of all items with keys has prefix [pre] in the trie.
   * Collection is lexicographically ordered by keys.
   * For obejcts {"foo":o1, "foobar":o2, "blah":o3} in trie,
   * returns (o1,o2) for [pre] = "foo".
   *
   * If prefix is null or empty string it returns all values.
   */
  Collection<T> getValuesWithPrefix(String pre);

  /**
   * Returns a [Collection] of all keys with given prefix [pre] in the trie.
   * Collection is lexicographically sorted.
   * For obejcts {"foo":o1, "foobar":o2, "blah":o3} in trie,
   * returns ("foo","foobar") for [pre] = "foo".
   */
  Collection<String> getKeysWithPrefix(String pre);

  /**
   * Returns a map of key-value pairs with given [prefix]
   * map is sorted lexicographically.
   */
  Map<String, T> getKeyValuesWithPrefix(String prefix);

  void forEach(void f(String key, T value));

  bool isEmpty();

  num size();

  void clear();
}
