 library(rmongodb)

 mongo <- mongo.create(host="localhost" , db="sanika", username="", password="")
 db <- "sanika"
# insert 20 entries in performance1 collection
 a <- mongo.bson.from.JSON( '{"ident":"1", "name":"Markus","rated":"passed ok","product":"A"}')
 b <- mongo.bson.from.JSON( '{"ident":"2", "name":"John","rated":"passed ok","product":"ABC"}')
 c <- mongo.bson.from.JSON( '{"ident":"3", "name":"Roy","rated":"damaged","product":"AB"}')
 d <- mongo.bson.from.JSON( '{"ident":"4", "name":"Martin","rated":"passed ok","product":"AAA"}')
 e <- mongo.bson.from.JSON( '{"ident":"5", "name":"Lucas","rated":"damaged","product":"ABA"}')
 f <- mongo.bson.from.JSON( '{"ident":"6", "name":"Kome","rated":"damaged","product":"BBA"}')
 g <- mongo.bson.from.JSON( '{"ident":"7", "name":"Tim","rated":"passed ok","product":"BBB"}')
 h<- mongo.bson.from.JSON( '{"ident":"8", "name":"Timmy","rated":"damaged","product":"CBB"}')
 i<- mongo.bson.from.JSON( '{"ident":"9", "name":"Roy","rated":"passed ok","product":"CBC"}')
 j<- mongo.bson.from.JSON( '{"ident":"10", "name":"Kimmy","rated":"passed ok","product":"BBC"}')
 k<- mongo.bson.from.JSON( '{"ident":"11", "name":"Kaur","rated":"damaged","product":"CCC"}')
 l<- mongo.bson.from.JSON( '{"ident":"12", "name":"Kim","rated":"damaged","product":"CBB"}')
 m<- mongo.bson.from.JSON( '{"ident":"13", "name":"John","rated":"passed ok","product":"BB"}')
 n<- mongo.bson.from.JSON( '{"ident":"14", "name":"Jony","rated":"damaged","product":"BBD"}')
 o<- mongo.bson.from.JSON( '{"ident":"15", "name":"Tim","rated":"passed ok","product":"BDD"}')
 p<- mongo.bson.from.JSON( '{"ident":"16", "name":"Timmy","rated":"passed ok","product":"DDD"}')
 q<- mongo.bson.from.JSON( '{"ident":"17", "name":"Titu","rated":"damaged","product":"ADD"}')
 r<- mongo.bson.from.JSON( '{"ident":"18", "name":"Lucas","rated":"damaged","product":"ADB"}')
 s<- mongo.bson.from.JSON( '{"ident":"19", "name":"Mary","rated":"passed ok","product":"BDB"}')
 t<- mongo.bson.from.JSON( '{"ident":"20", "name":"Page","rated":"passed ok","product":"BAB"}')
 if(mongo.is.connected(mongo) == TRUE) {
   icoll <- paste(db, "performance1", sep=".")
   mongo.insert.batch(mongo, icoll, list(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t) )
   dbs <- mongo.get.database.collections(mongo, db)
   print(dbs)
   mongo.find.all(mongo, icoll)
 }
# insert 20 entries in attendence1 collection
 a <- mongo.bson.from.JSON( '{"ident":"1","portion covered(%)":"60","attendence":"70"}')
 b <- mongo.bson.from.JSON( '{"ident":"2","portion covered(%)":"70","attendence":"65"}')
 c <- mongo.bson.from.JSON( '{"ident":"3","portion covered(%)":"90","attendence":"95"}')
 d <- mongo.bson.from.JSON( '{"ident":"4","portion covered(%)":"80","attendence":"80"}')
 e <- mongo.bson.from.JSON( '{"ident":"5","portion covered(%)":"75","attendence":"76"}')
 f <- mongo.bson.from.JSON( '{"ident":"6","portion covered(%)":"66","attendence":"80"}')
 g <- mongo.bson.from.JSON( '{"ident":"7","portion covered(%)":"40","attendence":"50"}')
 h <- mongo.bson.from.JSON( '{"ident":"8","portion covered(%)":"96","attendence":"100"}')
 i <- mongo.bson.from.JSON( '{"ident":"9","portion covered(%)":"91","attendence":"80"}')
 j <- mongo.bson.from.JSON( '{"ident":"10","portion covered(%)":"88","attendence":"81"}')
 k <- mongo.bson.from.JSON( '{"ident":"11","portion covered(%)":"80","attendence":"71"}')
 l <- mongo.bson.from.JSON( '{"ident":"12","portion covered(%)":"88","attendence":"72"}')
 m <- mongo.bson.from.JSON( '{"ident":"13","portion covered(%)":"84","attendence":"70"}')
 n <- mongo.bson.from.JSON( '{"ident":"14","portion covered(%)":"65","attendence":"70"}')
 o <- mongo.bson.from.JSON( '{"ident":"15","portion covered(%)":"62","attendence":"60"}')
 p <- mongo.bson.from.JSON( '{"ident":"16","portion covered(%)":"76","attendence":"81"}')
 q <- mongo.bson.from.JSON( '{"ident":"17","portion covered(%)":"72","attendence":"81"}')
 r <- mongo.bson.from.JSON( '{"ident":"18","portion covered(%)":"35","attendence":"40"}')
 s <- mongo.bson.from.JSON( '{"ident":"19","portion covered(%)":"30","attendence":"41"}')
 t <- mongo.bson.from.JSON( '{"ident":"20","portion covered(%)":"50","attendence":"61"}')
if(mongo.is.connected(mongo) == TRUE) {
   icoll <- paste(db, "attendence1", sep=".")
   mongo.insert.batch(mongo, icoll, list(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t) )
   dbs <- mongo.get.database.collections(mongo, db)
   print(dbs)
   mongo.find.all(mongo, icoll)
 }
coll <- "te3235db.performance1"
#get the rating for a particular product of each employee
a=mongo.count(mongo,coll,'{"rated":"damaged"}')
b=mongo.count(mongo,coll,'{"rated":"passed ok"}')
stat <- c(a,b)
#performance analysis graph
png('performance.png')
barplot(stat)  
coll <- "te3235db.attendence1"
#get the statistics for relative analysis of each employee's attendence during training
if(mongo.is.connected(mongo) == TRUE) { 
a=mongo.count(mongo, coll,'{"attendence":{"$lte":"50"}}')
b=mongo.count(mongo, coll,'{"attendence":{"$lte":"75","$gte":"50"}}')
c=mongo.count(mongo, coll,'{"attendence":{"$lte":"90","$gte":"75"}}')
d=mongo.count(mongo, coll,'{"attendence":{"$gte":"90"}}')
}
stat <- c(a,b,c,d)
#attendence analysis graph
png('attendence.png')
barplot(stat)
#get the statistics for relative analysis of each employee's portion covered 
if(mongo.is.connected(mongo) == TRUE) {
 a=mongo.count(mongo, coll,'{"portion covered(%)":{"$lte":"50"}}')
b=mongo.count(mongo, coll,'{"portion covered(%)":{"$lte":"75","$gte":"50"}}')
c=mongo.count(mongo, coll,'{"portion covered(%)":{"$lte":"90","$gte":"75"}}')
d=mongo.count(mongo, coll,'{"portion covered(%)":{"$gte":"90"}}')
}
#portion covered analysis graph
stat <- c(a,b,c,d)
png('portion.png')
barplot(stat)

