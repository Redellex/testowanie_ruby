#Hash

Hashe w ruby sa bardzo podobne do pythonowych slownikow. Oznacza to ze tworzymy element ktory "wskazuje" na drugi. Najlepiej bedzie to pokazane na ponizej przedstawionych kodach.

>Tworzenie

```Ruby
grades = { "Jane Doe" => 10, "Jim Doe" => 6 } # tworzymy przykladowa tablice hashy. Jesli do  wpiszemy grades["Jane Doe"] wypisze nam wartosc "wskazujaca".
```

>Ustawianie domyslnej wartosci. Jesli nie ma takiego klucza w tablicy hashujace to wypisze wartosc domyslna.

```Ruby
grades.default = 0
```

>Przykladowe wyswietlanie elemtnow tablicy hashujacej.

```Ruby
H = Hash["a" => 100, "b" => 200]

puts "#{H['a']}"
#=> 100
puts "#{H['b']}"
#=> 200
```

>Ladne wyswietlanie calej listy hashujacej.

```Ruby
H = Hash["a" => 100, "b" => 200]
H.inspect
```

>Dodanie do istniejacej tablicy hashy nowy element.

```Ruby 
H = Hash["a" => 100, "b" => 200]

H.["c"]=300

puts "#{H['c']}"
#=> 300
```

>Wyczyszczenie tablicy hashy:

```Ruby
H = Hash["a" => 100, "b" => 200]
puts "#{H['b']}"
#=> 200

H.clear
puts "#{H['b']}"
#=> error. 
```

>Usuwanie konkretnego elementu tablicy hashy

```Ruby
H = Hash["a" => 100, "b" => 200, "c" => 300]
H.delete("b")
puts "#{H['b']}"
#=> error.
```

>Testowanie czy hashe sa rowne:

```Ruby
hash_1 = Hash["a" => 100, "b"=> 200]
hash_2 = Hash["a" => 100, "b"=> 200]
hash_3 = Hash["a" => 200, "b"=> 200]

if hash_1 == hash_2
#=> true

if hash_2 == hash_3 
#=> false
```

>Sprawdzanie czy hash jest pusty

```Ruby
hash_1 = Hash["a" => 100, "b"=> 200]
hash_2 = hash[]

if hash.empty? hash_1
#=> false
if hash.empty? hash_2
#=> true
```

>Sprawdzanie czy hash zawiera dana wartosc

```Ruby
hash_1 = Hash["a" => 100, "b"=> 200]
hash_2 = Hash["a" => 150, "b"=> 250]

if hash_1.value?(100)
#=> true

if hash_2.value?(100)
#=> false
```

>Wypisanie liczby elementow tablicy hashujacej

```Ruby
hash_1 = Hash["a" => 100, "b"=> 200]

puts H.length
#=> 2
```

>Odwrocenie elementow tablicy hashujacej. (Pierwsze elementy beda ostatnie, a ostatnie pierwszymi)

```Ruby
H = Hash["a" => 100, "b"=> 200]

puts "#{H['a']}"
#=>100

H.invert
puts "#{H['a']}"
#=>200
```
