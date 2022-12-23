void main() {
  // Declaram els arraylist de cada tipus d'objecte
  List<Serie> series = [];
  List<Videojoc> videojocs = [];
  
  // Instanciam 5 objectes de cada tipus, cridant al constructor que nosaltres volguem
  Serie s1 = Serie.senseLliurat("One piece", "Eichiro Oda", "a", 10);
  Serie s2 = Serie.senseLliurat("Harry Potter", "J.K Rowling", "a", 20);
  Serie s3 = Serie.senseLliurat("Naruto", "Anime", "Kishimoto", 7);
  Serie s4 = Serie.senseLliurat("Peaky Blinders", "Ficcion historica", "Steven", 5);
  Serie s5 = Serie.senseLliurat("Gambito de Dama", "Ajedrez", "Scott", 1);
  Videojoc v1 = Videojoc.senseLliurat("Dark Souls III", 30, "Souls", "From Software");
  Videojoc v2 = Videojoc.senseLliurat("Genshin", 100, "Gachapon", "Mihoyo");
  Videojoc v3 = Videojoc.senseLliurat("Mario", 20, "Plataformas", "Nintendo");
  Videojoc v4 = Videojoc.senseLliurat("Cyberpunk2077", 40, "Mundo Abierto", "Activision");
  Videojoc v5 = Videojoc.senseLliurat("Sekiro", 35, "Lobo", "From Software");

  // Afegim tots els objectes instanciats al les seves respectives llistes
  series.add(s1);
  series.add(s2);
  series.add(s3);
  series.add(s4);
  series.add(s5);
  videojocs.add(v1);
  videojocs.add(v2);
  videojocs.add(v3);
  videojocs.add(v4);
  videojocs.add(v5);

  // Lliuram un parell d'objectes(li canviam la variable "lliurat" a true) cridant al metode lliurar()
  series[0].lliurar();
  series[4].lliurar();
  videojocs[2].lliurar();
  videojocs[1].lliurar();
  videojocs[4].lliurar();

  // Amb aquest metode sabrem quantes series i quants de jocs hi ha lliurats
  int seriesLliurades = totalSeriesLliurades(series);
  int videojocsLliurats = totalVideojocsLliurats(videojocs);
  int objectesLliurats = seriesLliurades + videojocsLliurats;
  // ignore: avoid_print
  print("Hi ha un total de $objectesLliurats objectes lliurats, $seriesLliurades series i $videojocsLliurats videojocs");

  /* Amb aquest metode sabrem quin dels dos objectes te mes temporades(en el cas de les series)
   * i quin te mes hores estimades(en el cas dels videojocs) */
  s3.compareTo(s4);
  s1.compareTo(s2);
  v1.compareTo(v2);
  v5.compareTo(v3);
  
  /* Amb aquests metodes obtenim el valor mes alt de la llista d'objectes, en el cas 
   * de les series el numero de temporades i en el cas dels videojocs les hores estimades */
  maxNumeroTemporades(series);
  maxHoresEstimades(videojocs);
}

/* A aquest metode li passam com a paràmetre la llista de tipus Serie, perque la pugui
 * recorrer i en cas de que sigui lliurat(lliurat == true)) verificat amb el metode 
 * isLliurat() el contador suma 1 per cada iteració de la llista. Retorna un int. */
int totalSeriesLliurades(List<Serie> series) {
  int contador = 0;
  int total = series.length;
  for (int i = 0; i < series.length; i++) {
    if (series[i].isLliurat()) contador++;
  }
  print("Hi ha $contador serie/s lliurada/es de $total");
  return contador;
}

// Aqui feim el mateix que al metode de adalt pero amb els videojocs
int totalVideojocsLliurats(List<Videojoc> videojocs) {
  int contador = 0;
  int total = videojocs.length;
  for (int i = 0; i < videojocs.length; i++) {
    if (videojocs[i].isLliurat()) contador++;
  }
  print("Hi ha $contador videojoc/s lliurat/s de $total");
  return contador;
}

/* A aquest mètode el que feim es passarli com a paràmetre una llista de tipo Serie 
i dins cream una llista auxiliar per guardar els valors del numero de temporades per 
despres poder emprar la funcio List.reduce la qual te retorna el valor maxim o minim 
de la llista(depenent de quina operador li especifiquis a la funcio). 
Al segon for feim que te retorni s'objecte de tengui el numero de temporades mes alt */
void maxNumeroTemporades(List<Serie> series) {
  List<int> numTemporadesList = [];
  Serie s;
  for (int i = 0; i < series.length; i++) {
    s = series[i];
    int numTemporades = s.getNumeroTemporades;
    numTemporadesList.add(numTemporades);
  }
  int maxTemporades = numTemporadesList.reduce((curr, next) => curr > next? curr: next);
  print("La serie amb mes temporades te un total de $maxTemporades temporades");
  
  for (int i = 0; i < series.length; i++) {
    if (maxTemporades == series[i].getNumeroTemporades) {
      print(series[i].toString());
    }
  }
}

// Aqui feim el mateix que al metode anterior pero amb els videojocs i les hores estimades
void maxHoresEstimades(List<Videojoc> videojocs) {
  List<int> numHoresList = [];
  for (int i = 0; i < videojocs.length; i++) {
    Videojoc v = videojocs[i];
    int numHores = v.getHoresEstimades;
    numHoresList.add(numHores);
  }
  int maxHores = numHoresList.reduce((curr, next) => curr > next ? curr : next);
  print("El joc amb mes hores estimades te un total de $maxHores hores estimades");
  
  for (int i = 0; i < videojocs.length; i++) {
    if (maxHores == videojocs[i].getHoresEstimades) {
      print(videojocs[i].toString());
    }
  }
}

abstract class Prestec {
  bool lliurat = true;

  lliurar() {
    lliurat = true;
  }

  retornar() {
    lliurat = false;
  }

  bool isLliurat() {
    return lliurat;
  }

  compareTo(Object a) {}
}

class Serie extends Prestec {
  String titol = "";
  String genere = "";
  String creador = "";
  bool lliurat = false;
  int numeroTemporades = 3;

  /* Al metode compareTo() empram la funcio compareTo() que implementa dart per saber si
   * un objecte es major, menor o igual que l'altre. La funcio compareTo() el que fa es
   * que si a.compareTo(b) == 0 els dos numeros son iguals, a.compareTo(b) < 0 vol dir que
   * a < b i si a.compareTo(b) > 0 doncs a > b*/
  @override
  compareTo(Object a) {
    Serie aa = a as Serie;
    String aaTitol = aa.getTitol;
    String thisTitol = titol;
    int aaNum = aa.numeroTemporades;
    int thisNum = this.numeroTemporades;
    if (aaNum.compareTo(thisNum) == 0) {
      print("La serie ${aaTitol} te ${aaNum} temporades, igual a les ${thisNum} de la serie ${thisTitol}");
    }
    else if (aaNum.compareTo(thisNum) < 0) {
      print("La serie ${aaTitol} te ${aaNum} temporades, menor a les ${thisNum} de la serie ${thisTitol}");
    }
    else if (aaNum.compareTo(thisNum) > 0) {
      print("La serie ${aaTitol} te ${aaNum} temporades, major a les ${thisNum} de la serie ${thisTitol}");
    }
  }
  
  Serie();

  // Empram el "punt + el nom del constructor" per diferenciar els constructors.
  Serie.titolCreador(this.titol, this.creador);

  Serie.senseLliurat(this.titol, this.genere, this.creador, [this.numeroTemporades = 3]);

  get getTitol {
    return titol;
  }

  set setTitol(String titol) {
    this.titol = titol;
  }

  get getGenere {
    return genere;
  }

  set setGenere(String genere) {
    this.genere = genere;
  }

  get getCreador {
    return creador;
  }

  set setCreador(String creador) {
    this.creador = creador;
  }

  get getNumeroTemporades {
    return numeroTemporades;
  }

  set setNumeroTemporades(int numeroTemporades) {
    this.numeroTemporades = numeroTemporades;
  }
  
  @override
  String toString() {
    return "titol: ${titol}, genere: ${genere}, creador: ${creador}, lliurat: ${lliurat}, numero temporades: ${numeroTemporades}";
  }
}

class Videojoc extends Prestec {
  String titol = "";
  bool lliurat = false;
  int horesEstimades = 10;
  String genere = "";
  String companyia = "";

  @override
  compareTo(Object a) {
    Videojoc aa = a as Videojoc;
    String aaTitol = aa.getTitol;
    String thisTitol = titol;
    int aaNum = aa.horesEstimades;
    int thisNum = this.horesEstimades;
    if (aaNum.compareTo(thisNum) == 0) {
      print("El videojoc ${aaTitol} te ${aaNum} hores estimades, igual a les ${thisNum} del videojoc $thisTitol");
    } else if (aaNum.compareTo(thisNum) < 0) {
      print("El videojoc ${aaTitol} te ${aaNum} hores estimades, menor a les ${thisNum} del videojoc $thisTitol");
    } else if (aaNum.compareTo(thisNum) > 0) {
      print("El videojoc ${aaTitol} te ${aaNum} hores estimades, major a les ${thisNum} del videojoc $thisTitol");
    }
  }

  Videojoc();

  // Empram el "punt + el nom del constructor" per diferenciar els constructors.
  Videojoc.titolHoresEstimades(this.titol, this.horesEstimades);

  Videojoc.senseLliurat(this.titol, this.horesEstimades, this.genere, this.companyia);

  get getTitol {
    return titol;
  }

  set setTitol(String titol) {
    this.titol = titol;
  }

  get getHoresEstimades {
    return horesEstimades;
  }

  set setHoresEstimades(int horesEstimades) {
    this.horesEstimades = horesEstimades;
  }

  get getGenere {
    return genere;
  }

  set setGenere(String genere) {this.genere = genere;}

  get getCompanyia {return companyia;}

  set setCompanyia(String companyia) {
    this.companyia = companyia;
  }

  @override
  String toString() {
    return "titol: $titol, lliurat: $lliurat, hores estimades: $horesEstimades, genere: $genere, companyia: $companyia";
  }
}