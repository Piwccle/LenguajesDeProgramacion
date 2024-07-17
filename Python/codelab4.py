wiki_text = """Sojourner was an experimental vehicle whose main mission was to test in the Martian environment 
technical solutions that were developed by engineers of the NASA research laboratories.[7] It was necessary to verify 
whether the design strategy followed had resulted in the construction of a vehicle suitable for the environment it 
would encounter, despite the limited knowledge of it. Careful analysis of the operations on Mars would make it 
possible to develop solutions to critical problems identified and to introduce improvements for subsequent planetary 
exploration missions. One of the mission's main aims was to prove the development of "faster, better and cheaper" 
spacecraft was possible. Development took three years and cost under $150 million for the lander, and $25 million for 
the rover; development was faster and less costly than all previous missions"""

stop_words = frozenset(
    ["a", "about", "after", "all", "also", "always", "am", "an", "and", "any", "are", "at", "be", "been", "being",
     "but", "by", "came", "can", "cant", "come", "could", "did", "didnt", "do", "does", "doesnt", "doing", "dont",
     "else", "for", "from", "get", "give", "goes", "going", "had", "happen", "has", "have", "having", "how", "i", "if",
     "ill", "im", "in", "into", "is", "isnt", "it", "its", "ive", "just", "keep", "let", "like", "made", "make", "many",
     "may", "me", "mean", "more", "most", "much", "no", "not", "now", "of", "only", "or", "our", "really", "say", "see",
     "some", "something", "take", "tell", "than", "that", "the", "their", "them", "then", "there", "they", "thing",
     "this", "to", "try", "up", "us", "use", "used", "uses", "very", "want", "was", "way", "we", "what", "when",
     "where", "which", "who", "why", "will", "with", "without", "wont", "you", "your", "youre"])

wiki_text_list = (wiki_text.replace(".", " ").replace(",", " ").replace(";", " ")
                  .replace("(", " ").replace(")", " ").replace("[", " ").replace("]", " ")
                  .replace("-", " ").split())

set_words = {s for s in wiki_text_list if s not in stop_words}
print("\n".join(set_words))
print(len(set_words))

mapped_words = {i: wiki_text_list.count(i) for i in set_words}
print(mapped_words)

mapped_stop_words = {i: (wiki_text_list.count(i)/len(wiki_text_list))*100 for i in stop_words}
print(mapped_stop_words)
