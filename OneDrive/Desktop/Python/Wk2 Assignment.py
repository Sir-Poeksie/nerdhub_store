my_list =[] #create an empty list

#append elements to the list
my_list.append(10)
my_list.append(20)
my_list.append(30)
my_list.append(40)
my_list.insert(1,15)
print(my_list)
#another list second one
another_list=[50,60,70]
#extend the first list with the second list
my_list.extend(another_list)
print(my_list)

del my_list[-1] #delete last element
my_list.sort() #sort the list in ascending order
print(my_list)

index_of_30 = my_list.index(30) #find the index of the value 30
print(f"The index of 30 is: {index_of_30}")
