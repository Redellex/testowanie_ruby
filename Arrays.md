#Arrays

Tablice - uporzadkowany system przechowywania danych (inaczej kolekcje). Tablice indeksujemy w ruby zaczynajac od 0

> A wiec jak wyglada Tworzenie prostej tablicy?

```Ruby
Array = ["ele1", "ele2"]
#=> ["ele1", "ele2"]
```

Definiowac tablice ruby pozwala takze bez okreslania elementow w niej:

```Ruby
Array = Array.new
Array = Array.new(2)
#=> [nil,nil]
```

Wybieranie elementu tablicy:

```Ruby
Array = [10,20,30,40,50]

Array[0]
#=> 10

Array [2..3]
#=>[20,30]
```

Dostepne sa tez rozne metody Tablicy:

```Ruby

Array.first # Pierwszy element
#=> 10

Array.last # Ostatni element
#=>50

Array.size # Wielkosc tablicy
#=> 5

Array.push(value) #Dodanie wartosci do tablicy

Array.delete_at(value) #usuwanie po indeksie elementu tablicy
```
