#name
name <- read_csv("name.csv")
pair0 <- read_csv("pair0.csv")

#leven
firm <- read_csv("firm.csv")
firm$name <- name$name
sorted_value_leven <- firm[(firm$firm_num < 1000000), ]
nrow(sorted_value_leven)

#pair0 jaccard
firm_JC_pair0 <- read_csv("firm_JC_pair0.csv")
firm_JC_pair0$name <- name$name
sorted_value_JC <- firm_JC_pair0[(firm_JC_pair0$firm_num < 1000000), ]
View(sorted_value_JC)

#TFIDF
firm_TF <- read_csv("firm_TF.csv")
firm_TF$name <- name$name
sorted_value_tf <- firm_TF[(firm_TF$firm_num < 1000000), ]
nrow(sorted_value_tf)


#jaro
sorted_value_jaro <- firm_jaro[(firm_jaro$firm_num < 1000000), ]
nrow(sorted_value_jaro)


#jaccard
sorted_value_jaccard <- firm_jaccard[(firm_jaccard$firm_num < 1000000), ]
nrow(sorted_value_jaccard)

#cosine
sorted_value_cosine <- firm_co[(firm_co$firm_num < 1000000), ]
nrow(sorted_value_cosine)

#softTFIdf
sorted_value_softTFIdf <- firm_sf[(firm_sf$firm_num < 1000000), ]
nrow(sorted_value_softTFIdf)

#Monge-Elkan
sorted_value_me <- firm_me[(firm_me$firm_num < 1000000), ]
nrow(sorted_value_me)


#jaro after levenshtein
firm_jaro_af["name"] <- name$name
sorted_value_jaro_af <- firm_jaro_af[(firm_jaro_af$firm_num < 1000000), ]
nrow(sorted_value_jaro_af)

#jaccard after levenshtein
firm_jac["name"] <- name$name
sorted_value_jac <- firm_jac[(firm_jac$firm_num < 1000000), ]
nrow(sorted_value_jac)

#jaro after levenshtein
firm_after_leven$name <- name$name
sorted_value_firm_after_leven <- firm_after_leven[(firm_after_leven$firm_num < 1000000), ]

#jaro after levenshtein2
firm_after_leven2$name <- name$name
sorted_value_firm_after_leven2 <- firm_after_leven2[(firm_after_leven2$firm_num < 1000000), ]

#leven
firm_TF_pair0 <- read_csv("firm_TF_pair0.csv")
firm_TF_pair0$name <- name$name
sorted_value_TF_pair0 <- firm_TF_pair0[(firm_TF_pair0$firm_num < 1000000), ]
nrow(sorted_value_leven)

str(pair)
unique(firm_jaro)

name[which(name$id == 481), ]

View(pair_after_leven[pair_after_leven$id2 == 4, ])

str(pair_after_leven)
View(pair[pair$id2 == 4, ])

x_1 <- pair$id1 %in% sorted_value_leven$id
x_2 <- pair$id2 %in% sorted_value_leven$id
x_3 <- x_1 | x_2
x_3 <- !x_3
sum(x_3)

pair_after_leven <- pair[x_3, ]
View(pair_after_leven)



a11 <- firm_jaro[which(firm_jaro$firm_num==0), ]









# name에 id가 disambiguation해야 하는 리스트(pair)에 포함되어 있는지 파악하는 코드입니다.
# 포함되어 있으면 dimambiguation을 해야 하는
# 포함되지 않았다면 그럴 필요가 없는 기업입니다.
x <- name$id %in% pair$id1
y <- name$id %in% pair$id2

# id1이나 id2에 들어있는 id는 disambiguation이 필요한 기업명입니다.
z <- x | y

# disambiguation이 필요한 Name을 추출합니다.
disambiguation_list <-  unique(name[z, ])

# 총 몇개의 disambiguation 리스트가 있는지 확인합니다.
print(nrow(disambiguation_list))

#disambiguation_list에서 levenshtein을 통해 매칭되지 않은 id를 검색합니다.
x1 <- disambiguation_list$id %in% sorted_value_leven$id 
x1 <- !x1
sum(x1)

dismatched_name_af_leven <- disambiguation_list[x1, ]


dismatched_pair_id1_af_leven <- pair$id1 %in% dismatched_name_af_leven$id
dismatched_pair_id2_af_leven <- pair$id2 %in% dismatched_name_af_leven$id
the_vector_of_dismatched_pair_id_af_leven <- dismatched_pair_id1_af_leven | dismatched_pair_id2_af_leven

the_set_of_dismatched_pair_id_af_leven <- pair[the_vector_of_dismatched_pair_id_af_leven, ]
write.csv(the_set_of_dismatched_pair_id_af_leven, file = "pair_after_leven.csv")


x12 <- sorted_value_leven$id %in% disambiguation_list$id 
sum(x12)


x2 <- sorted_value_jaro$id %in% ununique_name$id


af_leven <- disambiguation_list[x1, ]

x3 <- pair$id1 %in% af_leven$id
x4 <- pair$id2 %in% af_leven$id
x5 <- x3 | x4

x5 <- !x5
xk <- pair[x5, ]$id1 %in% pair_after_leven$id1

xz <- pair[x5, ]$id2 %in% pair_after_leven$id2
xm <- xk | xz
xm

new_leven <- pair[x5, ]

View(pair_after_leven[pair_after_leven$id2 == 277, ])
View(new_leven[new_leven$id2 == 277, ])


firm_after_leven$name <- name$name
View(firm_after_leven2[which(firm_after_leven2$firm_num == 26), ])


x41 <- sorted_value_firm_after_leven$id %in% sorted_value_leven$id
sum(x41)
pure_jaro_after_leven <- sorted_value_firm_after_leven[!x41, ]

View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 2358, ])
View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 12416, ])
View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 0, ])
View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 2, ])
View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 5295, ])
View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 5, ])
View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 201, ])
View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 4, ])
View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 14937, ])

View(pure_jaro_after_leven[pure_jaro_after_leven$id == 528469, ])
View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 14937, ])


x50 <- dismatched_name_af_leven$id %in% pure_jaro_after_leven$id
sum(x50) / length(x50)

x44 <- sample(1:18687, size = 1000)
View(pure_jaro_after_leven[pure_jaro_after_leven$firm_num %in% x44, ])

x100 = "the university of male"
y100 = "university of madrid"
stringdist(x100, y100, method = "jw")




View(firm_after_leven2[which(firm_after_leven2$firm_num == 26), ])
View(firm_after_leven2[which(firm_after_leven2$firm_num == 175), ])
View(firm_after_leven2[which(firm_after_leven2$firm_num == 1038), ])
View(firm_after_leven2[which(firm_after_leven2$firm_num == 2843), ])
View(firm_after_leven2[which(firm_after_leven2$firm_num == 96), ])
View(firm_after_leven2[which(firm_after_leven2$firm_num == 956), ])
View(firm_after_leven2[which(firm_after_leven2$firm_num == 3), ])


pairset <- function(df){
  pair_list <- list()
  for (i in 0:1){
    #pair_list[[i+1]] <- NA
    pair <- df[firm_num = i, ]
    pair$num_string <- nchar(pair$name)
    pair_list_under <- list()
    for (j in 1:nrow(pair)){
      new_pair <- pair[pair$num_string < 1.5*nchar(pair[j,"name"]), c("id", "name")]
      new_pair$id2 <- pair[j, "id"]
      new_pair$name2 <- pair[j, "name"]
      pair_list_under[[j]] <- new_pair
    }
    pair_list[[paste("firm_num = ", i, sep = "")]] <- pair_list_under
    print(paste("firm_num = ",i, "is done!"))
  }
  return(pair_list)
}

pair_list <- list()
pair_list1 <- list()
#pair_list[[1]] <- NA
pair11 <- pure_jaro_after_leven[pure_jaro_after_leven$firm_num == 0, ]
pair11$num_string <- nchar(pair11$name)
new_pair <- pair11[pair11$num_string < 1.5*nchar(pair11[1,"name"]), c("id", "name")]
new_pair$id2 <- pair11[1, "id"]
new_pair$name2 <- pair11[1, "name"]
pair_list[["firm_num is 0"]][2] <- new_pair
pair_list1[[1]] <- pair_list

paste("firm_num = ", 1, sep = "")

pair_r <- pairset(pure_jaro_after_leven)


