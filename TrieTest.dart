#import ("Trie.dart");
#import ("SimpleTrie.dart");

class TrieTest {
  static testMain() {
    testEmpty(new SimpleTrie());
    testAddGetSimple(new SimpleTrie());
    testAddGetComplex(new SimpleTrie());
    testGetKeysByPrefix(new SimpleTrie());
    testGetKeysByPrefixComplex(new SimpleTrie());
    testGetValuesByPrefix(new SimpleTrie());
    testGetKeyValuesByPrefix(new SimpleTrie());
    testGetKeysByNullOrEmptyPrefix(new SimpleTrie());
  }

  static void test(Trie trie) {
  }

  static void testEmpty(Trie trie) {
    Expect.isTrue(trie.isEmpty());
    Expect.equals(0, trie.size());
    Expect.isNotNull(trie.getKeysWithPrefix(""));
    Expect.isTrue(trie.getKeysWithPrefix("").isEmpty());
  }

  static void testAddGetSimple(Trie trie) {
    // Empty trie
    Expect.isTrue(trie.isEmpty());
    Expect.isNull(trie["Hello"]);
    Expect.isNull(trie[""]);

    trie["Hello"] = "Hello-Value";
    Expect.isFalse(trie.isEmpty());
    Expect.equals(1, trie.size());
    Expect.equals("Hello-Value", trie["Hello"]);

    // Add same
    trie["Hello"] = "Hello";
    Expect.equals(1, trie.size());
    Expect.equals("Hello-Value", trie["Hello"]);

    // Add another
    trie["Hell"] = "Hell-Value";
    Expect.equals(2, trie.size());
    Expect.equals("Hell-Value", trie["Hell"]);

    // Clear
    trie.clear();
    Expect.isTrue(trie.isEmpty());
    Expect.isNull(trie["Hello"]);
    Expect.isNull(trie[""]);
  }

  static void testAddGetComplex(Trie trie) {
    Expect.isTrue(trie.isEmpty());
    num limit = 1000;
    for (num i=0; i < limit; i++) {
      trie[i.toString()] = i;
    }
    Expect.equals(limit, trie.size());
    for (num i=1; i < limit; i++) {
      Expect.equals(i, trie[i.toString()]);
    }

    trie.clear();
    Expect.isTrue(trie.isEmpty());
    for (num i= limit -1; i >= 0; i--) {
      trie[i.toString()] = i;
    }
    Expect.equals(limit, trie.size());
    for (num i=0; i < limit; i++) {
      Expect.equals(i, trie[i.toString()]);
    }
  }

  static void testGetKeysByPrefix(Trie trie) {
    Expect.isTrue(trie.isEmpty());
    trie["Hello"] = "Hello-Value";
    trie["Hell"] = "Hell-Value";
    List<String> keys = new List.from(trie.getKeysWithPrefix("H"));
    List<String> expected = ["Hell", "Hello"];
    Expect.listEquals(expected, keys);
  }

  static void testGetKeysByNullOrEmptyPrefix(Trie trie) {
    Expect.isTrue(trie.isEmpty());
    trie["Hello"] = "Hello-Value";
    trie["Happy"] = "Happy-Value";
    trie["Apple"] = "Apple-Value";
    List<String> keysFromEmpty = new List.from(trie.getKeysWithPrefix(""));
    List<String> keysFromNull = new List.from(trie.getKeysWithPrefix(null));
    List<String> expected = ["Apple", "Happy", "Hello"];
    Expect.listEquals(expected, keysFromNull);
    Expect.listEquals(expected, keysFromEmpty);
  }

  static void testGetKeysByPrefixComplex(Trie trie) {
    Expect.isTrue(trie.isEmpty());
    // Add 0-999 to trie
    for (num i=0; i < 1000; i++) {
      trie[i.toString()] = i;
    }
    List<String> keys = new List.from(trie.getKeysWithPrefix("1"));
    Expect.equals(111, keys.length);
    keys = new List.from(trie.getKeysWithPrefix("12"));
    Expect.equals(11, keys.length);
    keys = new List.from(trie.getKeysWithPrefix("9"));
    Expect.equals(111, keys.length);
    keys = new List.from(trie.getKeysWithPrefix("99"));
    Expect.equals(11, keys.length);
  }

  static void testGetValuesByPrefix(Trie trie) {
    Expect.isTrue(trie.isEmpty());
    trie["Hello"] = "Hello-Value";
    trie["Hell"] = "Hell-Value";
    List<String> values = new List.from(trie.getValuesWithPrefix("H"));
    Expect.equals(2, values.length);
    List<String> expected = ["Hell-Value", "Hello-Value"];
    Expect.listEquals(expected, values);
  }

  static void testGetKeyValuesByPrefix(Trie trie) {
    Expect.isTrue(trie.isEmpty());
    trie["Hello"] = "Hello-Value";
    trie["Hel"] = "Hel-Value";
    trie["Happy"] = "Happy-Value";
    Map <String, String> actual = trie.getKeyValuesWithPrefix("H");
    Expect.equals(3, actual.length);
    // We expect results must be sorted by keys.
    LinkedHashMap<String, String> expected = {"Happy" : "Happy-Value",
                                              "Hel" : "Hel-Value",
                                              "Hello" : "Hello-Value", };
    Expect.mapEquals(expected, actual);
  }

}

main() {
  TrieTest.testMain();
}
