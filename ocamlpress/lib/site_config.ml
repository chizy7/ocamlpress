(* Site configuration handling *)

open Yojson.Basic.Util

type t = {
  title : string;
  description : string;
}

let load (file_path : string) : t =
  let json = Yojson.Basic.from_file file_path in
  {
    title = json |> member "title" |> to_string;
    description = json |> member "description" |> to_string;
  }