(* Main Entry Point *)
let () = 
  let markdown_content = "# Hello OcamlPress\nThis is a test markdown file." in
  let html_content = Ocamlpress.Markdown.markdown_to_html markdown_content in 
  print_endline html_content
