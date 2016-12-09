echo "1. test: get list of users"

RESPONSE=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost:3000/users)
echo $RESPONSE
if [[ $RESPONSE == 200 ]]; then
	printf "1. test - ok \n \n"
else 
	printf "1. test - fail \n \n"
fi


echo "2. test: login user"
RESPONSE=$(curl -X POST -H "Content-Type: application/json" --write-out %{http_code} --silent --output /dev/null http://localhost:3000/sessions -d '{"username":"zoran.todorovic@fer.hr","password":"password"}')
echo $RESPONSE
# RESPONSE = $(curl -X POST -H "Content-Type: application/json"  http://localhost:3000/sessions -d '{"username":"zoran.todorovic@fer.hr",
# "password":"password"}' -w "%{http_code}")
if [[ $RESPONSE == 201 ]]
then
	printf "2. test - ok \n \n"
else
	printf "2. test - fail \n \n"
fi

echo "GET TOKEN:"
TOKEN=$(curl -X POST -H "Content-Type: application/json" http://localhost:3000/sessions -d '{"username":"zoran.todorovic@fer.hr","password":"password"}' | python -m json.tool | python -c 'import sys, json; print json.load(sys.stdin)["data"]["attributes"]["token"]')
printf "$TOKEN \n \n \n"


echo "3. test: get current user"
RESPONSE=$(curl -X GET -H "Content-Type: application/json" -H "X-Api-Key: $TOKEN" --write-out %{http_code} --silent --output /dev/null http://localhost:3000/users/1)
echo $RESPONSE
# RESPONSE = $(curl -X POST -H "Content-Type: application/json"  http://localhost:3000/sessions -d '{"username":"zoran.todorovic@fer.hr",
# "password":"password"}' -w "%{http_code}")
if [[ $RESPONSE == 200 ]]
then
	printf "3. test - ok \n \n"
else
	printf "3. test - fail \n \n"
fi


echo "4. test: update user"
RESPONSE=$(curl -X PATCH -H "Content-Type: application/vnd.api+json" -H "X-Api-Key: $TOKEN" --write-out %{http_code} --silent --output /dev/null http://localhost:3000/users/1 -d '{"data":{"type":"users","attributes":{"full_name":"Zoran Todorovic updated"}}}')
echo $RESPONSE
if [[ $RESPONSE == 200 ]]
then
	printf "4. test - ok \n \n"
else
	printf "4. test - fail \n \n"
fi


echo "5. test: create user"
RESPONSE=$(curl -X POST -H "Content-Type: application/vnd.api+json" -H "X-Api-Key: $TOKEN" --write-out %{http_code} --silent --output /dev/null http://localhost:3000/users -d '{"data": {"type": "users","attributes": {"username": "exampleusername","full-name": "Example user","password": "password"}}}')
echo $RESPONSE
if [[ $RESPONSE == 201 ]]
then
	printf "5. test - ok \n \n"
else
	printf "5. test - fail \n \n"
fi


echo "6. test: get users list of projects"
RESPONSE=$(curl -X GET -H "Content-Type: application/vnd.api+json" -H "X-Api-Key: $TOKEN" --write-out %{http_code} --silent --output /dev/null http://localhost:3000/users/1/projects )
echo $RESPONSE
if [[ $RESPONSE == 200 ]]
then
	printf "6. test - ok \n \n"
else
	printf "6. test - fail \n \n"
fi


echo "7. test: get first users project with id 1"
RESPONSE=$(curl -X GET -H "Content-Type: application/vnd.api+json" -H "X-Api-Key: $TOKEN" --write-out %{http_code} --silent --output /dev/null http://localhost:3000/users/1/projects/1 )
echo $RESPONSE
if [[ $RESPONSE == 200 ]]
then
	printf "7. test - ok \n \n"
else
	printf "7. test - fail \n \n"
fi


echo "8. test: delete first users project with id 24"
RESPONSE=$(curl -X DELETE -H "Content-Type: application/vnd.api+json" -H "X-Api-Key: $TOKEN" --write-out %{http_code} --silent --output /dev/null http://localhost:3000/users/1/projects/24)
echo $RESPONSE
if [[ $RESPONSE == 204 ]]
then
	printf "8. test - ok \n \n"
else
	printf "8. test - fail \n \n"
fi



echo "9. test: update first users project with id 1"
RESPONSE=$(curl -X PATCH -H "Content-Type: application/vnd.api+json" -H "X-Api-Key: $TOKEN" --write-out %{http_code} --silent --output /dev/null http://localhost:3000/users/1/projects/1 -d '{"data": {"id": "1","type": "projects","attributes": {"title": "Projekt prvi","rating": 1}}}')
echo $RESPONSE
if [[ $RESPONSE == 200 ]]
then
	printf "9. test - ok \n \n"
else
	printf "9. test - fail \n \n"
fi

# echo "9. test: delete first users project with id 9"
# RESPONSE=$(curl -X PATCH -H "Content-Type: application/vnd.api+json" -H "X-Api-Key: $TOKEN" --write-out %{http_code} --silent --output /dev/null http://localhost:3000/users/1/projects/9 -d '{"data": {"id": "1","type": "projects","attributes": {"title": "Projekt prvi","rating": 1}}}')
# echo $RESPONSE
# if [[ $RESPONSE == 200 ]]
# then
# 	printf "9. test - ok \n \n"
# else
# 	printf "9. test - fail \n \n"
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
