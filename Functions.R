clean_my_news <- function(df){
  # This function takes a single character object from read_file and returns
  # a clean single character object with the paragraphs where rki appears.
  
  require(readr)

  # Separating the file into paragraphs
  file_vector <- strsplit(df, split = "\\\n")[[1]]
      
  # Changing all to lower case
  file_vector <- tolower(file_vector)
  
  # Removing non UTF-8 symbols
  file_vector_clean <- gsub("[^[:alnum:][:blank:]?&]", " ", file_vector)

  df_clean <- paste(file_vector_clean[rki_lines], sep = "\\\n")
  
  return(df_clean)
}


word_in_paragraph <- function(df, my_words){
  
  file_vector <- strsplit(df, split = "\\\n")[[1]]
  my_lines <- c()
  
  for(word in my_words){
    
    # Find where the institute is named
    
    lines <- which(grepl(word, file_vector))
    my_lines <- append(my_lines, lines)
  }
  
  my_lines <- unique(my_lines)
  
  
  # Keeping only relevant paragrahps
  if(length(my_lines) > 0){
    df_clean <- paste(file_vector_clean[my_lines], sep = "\\\n")
    
    # Removing extra spaces
    df_clean <- paste(strsplit(df_clean, split = " ")[[1]][which(strsplit(df_clean, split = " ")[[1]] != "")], collapse=" ")
    
  }else{
    
    df_clean <- ""  
  }
  
  return(df_clean)
}