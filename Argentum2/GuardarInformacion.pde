class GuardarInformacion{

    public GuardarInformacion(){

    }
    
    void saveArrayListToFile(ArrayList<String> arrayList, String fileName) {
        PrintWriter output = createWriter(fileName);
        for (String linea : arrayList) {
            output.println(linea);
        }
        output.flush();
        output.close();
    }

    ArrayList<String> readArrayListFromFile(String fileName) {
        ArrayList<String> arrayList = new ArrayList<String>();
        BufferedReader reader = createReader(fileName);
        String linea;
        try {
            while ((linea = reader.readLine()) != null) {
                arrayList.add(linea);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return arrayList;
    }
}