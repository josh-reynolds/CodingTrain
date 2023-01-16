
// Test grammar -------------------
// "S"  -> "The N V"
// "N"  -> "cat", "dog", "sheep", "pig", "AJ N"
// "V"  -> "meows", "barks", "baas", "oinks", "V AV"
// "AJ" -> "fuzzy", "blue", "oily", "hungry"
// "AV" -> "sleepily", "quickly", "forlornly", "happily"

// Allison Parrish grammar --------
// "S"      -> "NP VP", "Interj NP VP"
// "NP"     -> "Det N", "Det N that VP", "Det Adj N"
// "VP"     -> "Vtrans NP", "Vintr"
// "Interj" -> "oh,", "my,", "wow,", "damn,"
// "Det"    -> "this", "that", "the"
// "N"      -> "amoeba", "dichotomy", "seagull", "trombone", ""
// "Adj"    -> "bald", "smug", "important", "tame", "overstaffed", ""
// "Vtrans" -> "computes", "examines", "foregrounds", ""
// "Vintr"  -> "coughs", "daydreams", "whines", "slobbers", ""

class Grammar {
  HashMap<String, String[]> rules;
  
  Grammar(){
    rules = new HashMap<String, String[]>();
    //rules.put("S",  new String[]{"The N V"});
    //rules.put("N",  new String[]{"cat", "dog", "sheep", "pig", "AJ N"});
    //rules.put("V",  new String[]{"meows", "barks", "baas", "oinks", "V AV"});
    //rules.put("AJ", new String[]{"fuzzy", "blue", "oily", "hungry"});
    //rules.put("AV", new String[]{"sleepily", "quickly", "forlornly", "happily"});
    
    rules.put("S",      new String[]{"NP VP", "Interj NP VP"});
    rules.put("NP",     new String[]{"Det N", "Det N that VP", "Det Adj N"});
    rules.put("VP",     new String[]{"Vtrans NP", "Vintr"});
    rules.put("Interj", new String[]{"oh,", "my,", "wow,", "damn,"});
    rules.put("Det",    new String[]{"this", "that", "the"});
    rules.put("N",      new String[]{"amoeba", "dichotomy", "seagull", "trombone"});
    rules.put("Adj",    new String[]{"bald", "smug", "important", "tame", "overstaffed"});
    rules.put("Vtrans", new String[]{"computes", "examines", "foregrounds"});
    rules.put("Vintr",  new String[]{"coughs", "daydreams", "whines", "slobbers"});
  }
}