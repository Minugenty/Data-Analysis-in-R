thislist <- list("apple", "banana", "cherry")
thislist
thislist[1]
thislist[2] <- "blackcurrant"
thislist
length(thislist)
"apple" %in% thislist #membership
append(thislist, "orange")
thislist
append(thislist, "grapes", after=2)
thislist
newlist <- thislist[-1]
newlist
anotherlist <- list("apple", "banana", "cherry", "grapes", "orange")
(anotherlist)[2:5]
for (x in thislist) {
  print(x)
}
list1 <- list("a", "b", "c")
list2 <- list(1,2,3)
list3 <- c(list1,list2)
list3
