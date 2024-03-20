import List "mo:base/List";
import Debug "mo:base/Debug";

actor Dkeeper{

  //defining datatype fot note
  public type Note ={
    title : Text;
    content : Text;
  };

  //defining stable List to hold all the created notes
  stable var notes: List.List<Note> = List.nil<Note>();


  //public function to create new note
  public func createNote(titletext: Text, contenttext : Text){

      let newNote : Note = {
          title = titletext;
          content = contenttext;
      };

      notes := List.push(newNote, notes);

  };

  //query function to return list of all created notes
  public query func getNotes() : async [Note] {
    return List.toArray(notes);
  };

  //public function to remove/delete a note
  public func remove(id : Nat){
    let A = List.take(notes, id);

    let B = List.drop(notes, id+1);

    notes:= List.append(A,B);
    
  }
};
