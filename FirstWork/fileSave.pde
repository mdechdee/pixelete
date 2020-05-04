PrintWriter output;
int file_num;

void file_setup() {
  parseFile();
  output = createWriter("file_num.txt"); 
}

void parseFile() {
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
