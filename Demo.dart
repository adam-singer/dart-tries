#import ("Trie.dart");
#import ("SimpleTrie.dart");
#import('dart:io');

int LIMIT = 50000;

void addStrings(Trie trie, List<String>list) {
  var x = "hello";
  for (String s in list) {
    trie[s] = x;
  }
}

void getStrings(Trie trie, List<String>list) {
  for (String s in list) {
    String x = trie[s];
  }
}

void getStringsForPrefixes(Trie trie, List<String>list) {
  for (String pref in list) {
    trie.getKeysWithPrefix(pref);
  }
}

void main() {
  File f = new File("eng_words");
  List<String> dic = f.readAsLinesSync(Encoding.UTF_8);
  print("Total words in the dict: ${dic.length}");
  File pf = new File("prefixes");
  List<String> prefixes = pf.readAsLinesSync(Encoding.UTF_8);
  print("Total prefixes: ${prefixes.length}");

  var st = new SimpleTrie();
  Stopwatch w = new Stopwatch();
  w.start();
  addStrings(st, dic);
  print("Add dict: ${w.elapsedInMs()}");
  getStrings(st, dic);
  print("Get dict: ${w.elapsedInMs()}");
  getStringsForPrefixes(st, prefixes);
  print("Prefix search dict: ${w.elapsedInMs()}");
  st.calculateMetrics();
  st.dump();

}