
# echo "First test : Login should pass"

# RESPONSE = curl -X POST -H "Content-Type: application/json"  http://localhost:3000/sessions -d '{"username":"zoran.todorovic@fer.hr",
# "password":"password"}' -w "%{http_code}" > out1 2> /dev/null
# if [ "$RESPONSE" == "406" ] 
# then
# 	echo "First test - FAIL"
# else
# 	echo "First test - ok"
# fi


# echo "Second test : Login should fail"

# JEDAN = curl -X POST -H "Content-Type: application/json" http://localhost:3000/sessions -d '{"username":"invaliduser@fer.hr",
# "password":"password"}' -w "%{http_code}" > out1 2> /dev/null
# if [ "$JEDAN" != "406" ] 
# then
# 	echo "Second test - FAIL"
# 	echo "$JEDAN"
# else
# 	echo "Second test - OK"
# fi

# echo "Second test : Invalid login"
# curl -H "Accept: application/json" http://localhost:3000/posts/1 -u wrong@user:12345678 > out2 2> /dev/null
# if diff out2 expected2 > /dev/null ; then
# 	echo "Second test - OK"
# else
# 	echo "Second test - FAIL"
# fi

# echo "First test : Post GET"

# curl -H "Accept: application/json" http://localhost:3000/posts/1 -u luka.dulcic@fer.hr:12345678 > out3 2> /dev/null
# if diff out1 expected1 > /dev/null ; then
# 	echo "First test - OK"
# else
# 	echo "First test - FAIL"
# fi
