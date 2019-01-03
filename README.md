# villancicos
Generador de villancicos a partir de hoja de cálculo tsv. Si funciona, integraré parte del código en haikoumatic


## Pensamientos ...

### Por qué con hoja de cálculo
Porque es mucho más fácil editar el texto.

### Por qué en TSV
La edición española de excel utiliza un formato de CSV que la mayoría de bibliotecas de programación no entienden. Puesto que en español (como en otros idiomas) se emplea la coma en lugar del punto, los CSV de la edición española de excel utilizan punto y coma en lugar de coma.
El objeto Table de Processing puede ser construido a partir de un TSV o de un CSV con comas, pero no a partir de un CSV sin comas.

He valorado la posibilidad de usar mi propio formato de tabla, con "|" como separador (es lo que uso en mis app de Construct2), pero es complicado exportarlo desde excel y me complicaría la vida a la hora de leerlo desde Processing.

### Problemas adicionales
Hay que tener cuidado con la marca de inicio de archivo utf-8. 

### Por qué no uso ArrayLists.
Mi idea es acceder a los objetos por orden. Con ArrayLists el orden se pierde. Pero quizá en el futuro use ArrayLists

### Si uso un objeto Table, ¿por qué lo convierto en matrices?
Los objetos table de Processing parecen estar orientados a su lectura línea a línea. Para facilitar su lectura en excel, mis tablas están dispuestas en columnas (se elige una palabra de cada columna para componer el villancico). A mí me interesa saber cosas como cuántas posibilidades hay en cada columna. Eso es más difícil si no convierto el Table en matrices.

### ¿Qué son las columnas E-eo y similares?
Esas columnas contienen palabras con la rima especificada en las letras del final. Crear una función para computar la rima asonante de una palabra es más difícil que simplemente hacer una lista de palabras sobre un tema que rimen entre sí.

Una posible mejora es incluir, además de rimas, conexiones temáticas, de manera que se pueda elegir que si una columna contiene un lugar, otra pueda llevar una preposición de lugar... etcétera.

