(* Main Entry Point *)

let () =
  let markdown_files = Generator.find_markdown_files "content" in
  let site_config = Site_config.load "config/site_config.json" in
  Generator.generate_site markdown_files site_config "templates/default.html" "output"
