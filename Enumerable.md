#Enumerable
Enumerable - operacje na strukturach i typach wyliczeniowych w Ruby. 
Przykladem struktur ktore dziedzicza po enumerable sa miedzy innymi tablice (arrays), tablice hashujace (hash).

> Automatyczne tworzenie tablicy za pomoca wzoru matematycznego

```Ruby
#(ilosc..do_ilu).map{|zmienna| wzor_elementow)
(1..5).map {|i| i+i }
#=> [2, 4, 6, 8, 10]
```

>Wyszukiwanie wedlug wzoru:

```Ruby
(1..10).grep 2..3
#=> [2, 3]
```

>Grupowanie tablicy wedlug okreslonego wzoru:

```Ruby 
(1..10).group_by {|i| i%3}
#=> {0=>[3,6,9], 1=>[1,2,4,5,7,8,10]} #Powstaja dwa tablice. Jedna spelniajaca wzor a druga nie spelniajaca.
```
