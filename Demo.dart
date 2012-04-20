#import ("Trie.dart");
#import ("ModifiedSimpleTrie.dart");
#import('dart:io');

int LIMIT = 50000;

String createKey(num i) => "$i $i $i";

void populate(Trie trie) {
  for (num i=0; i < LIMIT; i++) {
    trie[createKey(i)] = i;
  }
}

void getAll(Trie trie) {
  for (num i=0; i < LIMIT; i++) {
    num res = trie[createKey(i)];
    if (res != i) {
      print ("Error");
      return;
    }
  }
}

void getAllKeysForPrefix(Trie trie) {
  for (num i=100; i < 1000; i++) {
    trie.getKeysWithPrefix("$i");
  }
}

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

  Stopwatch w = new Stopwatch();
//  w.reset();

//  populate(mst);
//  print("Populate: ${w.elapsedInMs()}");
//  getAll(mst);
//  print("Get All: ${w.elapsedInMs()}");
//  getAllKeysForPrefix(mst);
//  print("Get All Keys for Prefix: ${w.elapsedInMs()}");
//  addStrings(mst, dic);
//  print("Add dict: ${w.elapsedInMs()}");
//  getStrings(mst, dic);
//  print("Get dict: ${w.elapsedInMs()}");
//  getStringsForPrefixes(mst, prefixes);
//  print("Prefix search dict: ${w.elapsedInMs()}");
//  mst.calculateMetrics();
//  mst.dump();



}