#!/usr/bin/ruby -w
def qsort(list)
 return [] if list.size == 0
 x, *xs = *list
 less, more = xs.partition{|y| y < x}
 qsort(less) + [x] + qsort(more)
end
