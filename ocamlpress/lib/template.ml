(* Template processing *)

let apply_template (template_content : string) (body_content : string) : string =
  Str.global_replace (Str.regexp "{{content}}") body_content template_content