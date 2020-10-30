

# Using ops@getcourgaenow.org email account for this setup
GOOGLEPROJECTID=v2-ci-getcouragenow-org

# general
export GOOGLE_KEY=111
export GOOGLE_SECRET=222

# gmail
export GOOGLE_CLIENT_ID=""
export GOOGLE_CLIENT_SECRET=""
export GOOGLE_REFRESH_TOKEN=""
export GOOGLE_ACCESS_TOKEN=""

1:
	# user makes a project
	open https://console.cloud.google.com/home/dashboard?$(GOOGLEPROJECTID)
	
2:
	# user turns on gmail rest api
	open https://console.cloud.google.com/apis/library/gmail.googleapis.com?project=$(GOOGLEPROJECTID)
3:
	# user create service credentials
	open https://console.cloud.google.com/iam-admin/serviceaccounts?project=$(GOOGLEPROJECTID)

	#https://console.cloud.google.com/apis/api/gmail.googleapis.com/credentials?project=$(GOOGLEPROJECTID)

run:
	go run main.go 