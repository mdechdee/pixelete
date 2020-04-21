PrintWriter output;
int file_num;

void file_setup() {
  output = createWriter("file_num.txt"); 
  parseFile();
}

void parseFile() {
  // Open the file from the createWriter() example
  BufferedReader reader = createReader("file_num.txt");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      file_num = int(line);
    }
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
} 
