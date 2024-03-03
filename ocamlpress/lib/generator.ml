(* Site generation logic *)

open Sys

(* Custom function to read the entire contents of a file *)
let read_file (filename : string) : string =
  let ic = open_in filename in
  let rec read_lines acc =
    try
      let line = input_line ic in
      read_lines (acc ^ line ^ "\n")  (* Accumulate lines, appending a newline character *)
    with End_of_file -> acc  (* End of file reached, return accumulated content *)
  in
  let contents = read_lines "" in
  close_in ic;
  contents

let rec find_markdown_files dir =
  if is_directory dir then
    Array.to_list (readdir dir)
    |> List.map (fun name -> Filename.concat dir name)
    |> List.concat_map find_markdown_files
  else if Filename.check_suffix dir ".md" then [dir]
  else []

let generate_site (markdown_files : string list) (config : Site_config.t) (template_path : string) (output_dir : string) : unit =
  let template_content = read_file template_path in
  List.iter (fun md_file ->
    let markdown_content = read_file md_file in
    let html_content = Markdown.markdown_to_html markdown_content in
    let filled_template = Template.apply_template template_content html_content in
    (* Incorporate site configuration into the HTML content *)
    let final_content = Str.global_replace (Str.regexp "{{site_title}}") config.title
                          (Str.global_replace (Str.regexp "{{site_description}}") config.description filled_template) in
    let output_file = Filename.concat output_dir (Filename.basename md_file |> Filename.remove_extension) ^ ".html" in
    let oc = open_out output_file in
    Printf.fprintf oc "%s\n" final_content;
    close_out oc
  ) markdown_files  

(* let generate_site (markdown_files : string list) (config : Site_config.t) (template_path : string) (output_dir : string) : unit =
  let template_content = read_file template_path in
  List.iter (fun md_file ->
    let markdown_content = read_file md_file in
    let html_content = Markdown.markdown_to_html markdown_content
                       |> Template.apply_template template_content in
    let output_file = Filename.concat output_dir (Filename.basename md_file |> Filename.remove_extension) ^ ".html" in
    let oc = open_out output_file in
    Printf.fprintf oc "%s\n" html_content;
    close_out oc
  ) markdown_files *)
