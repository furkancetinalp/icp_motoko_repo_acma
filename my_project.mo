import Trie "mo:base/Trie";
import Text "mo:base/Text";
import Nat32 "mo:base/Nat32";
import Bool "mo:base/Bool";

actor {

  type NoteId = Nat32;
  type Note = {
    title : Text;
    content : Text;
};

  private stable var next : NoteId = 0;

  private stable var notes : Trie.Trie<NoteId, Note> = Trie.empty();

  public func addNote(title : Text, content : Text) : async Text {
    let noteId = next;
    next += 1;
    let note : Note = { title = title; content = content };
    notes := Trie.replace(
      notes,
      key(noteId),
      Nat32.equal,
      ?note,
    ).0;
    return ("Note Created Successfully");
  };

}
