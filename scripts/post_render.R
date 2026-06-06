rendered_files <- Sys.getenv("QUARTO_PROJECT_OUTPUT_FILES")
output_dir <- Sys.getenv("QUARTO_PROJECT_OUTPUT_FILES")

rendered_files <- stringr::str_split_1(rendered_files, "\n")
cur_date <- Sys.Date()


capture_apply <- lapply(rendered_files, function(x) {
  x_ext <- tools::file_ext(x)
  x_sans <- tools::file_path_sans_ext(x)
  x_new <- paste0(
    x_sans, "_", cur_date, ".", x_ext
  )

  file.rename(x, x_new)
  message("Renamed:\n\t", x, "\nto:\n\t", x_new)

  # For markdown files, also move the companion _files/ directory
  if (x_ext == "md") {
    files_dir <- paste0(x_sans, "_files")
    if (dir.exists(files_dir)) {
      files_dir_new <- paste0(x_sans, "_", cur_date, "_files")
      file.rename(files_dir, files_dir_new)
      # Update image paths in the renamed markdown file
      md_content <- readLines(x_new)
      md_content <- gsub(
        basename(files_dir),
        basename(files_dir_new),
        md_content,
        fixed = TRUE
      )
      writeLines(md_content, x_new)
      message("Moved _files dir and updated paths in:\n\t", x_new)
    }
  }
})

invisible(0)
