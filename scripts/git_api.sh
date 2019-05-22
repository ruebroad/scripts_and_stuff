GITHUB_TOKEN=3494ee7****************7be399e132399
# curl -H "Authorization: token $OAUTH_TOKEN" -X GET https://api.github.com/orgs/exactsoftware/repos | jq '.[] | .html_url' 

#curl https://api.github.com/?access_token=$OAUTH_TOKEN

# curl -i https://api.github.com/orgs/exactsoftware/repos/?access_token=$OAUTH_TOKEN 
# >> repo_list.json #| jq '.[0] |.html_url'

# curl -X GET https://api.github.com/orgs/exactsoftware/repos/?access_token=$OAUTH_TOKEN

#GET /user/orgs

# curl -X GET https://api.github.com/orgs/exactsoftware/repos?access_token=$GITHUB_TOKEN  | jq '.[] | .html_url' 

# curl https://api.github.com/orgs/exactsoftware/repos\?type\=private?access_token=$GITHUB_TOKEN | jq '.[] | .html_url' 

curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/orgs/exactsoftware/repos?type=private&per_page=100&page=2 | jq '.[] | .html_url' 