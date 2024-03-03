(* lib/markdown.ml -> Markdown processing *)

(* open Omd *)

let markdown_to_html (input_markdown : string) : string = 
    input_markdown |> Omd.of_string |> Omd.to_html