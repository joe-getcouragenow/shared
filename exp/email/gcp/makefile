# https://github.com/BinodKafle/gomail

# https://medium.com/wesionary-team/sending-emails-with-go-golang-using-smtp-gmail-and-oauth2-185ee12ab306

## FLOW


# 1 Create new GCP Project
GOOG_PROJECT_ACTIVATE_URL=https://console.developers.google.com/projectcreate
# and we get:
GOOG_PROJECT_ID=goog-email-test
GOOG_PROJECT_URL=https://console.cloud.google.com/iam-admin/settings?project=$(GOOG_PROJECT_ID)


# 2. Activate the right API. Its called "Smart Device Management API", with id = "smart"
# By doing this first, you will see the ability to create scope for it when making credentials
GOOG_API_PREFIX_URL=https://console.developers.google.com/apis/api
GOOG_GMAIL_API_PREFIX_URL=$(GOOG_API_PREFIX_URL)/library/gmail.googleapis.com
GOOG_GMAIL_API_ACTIVATE_URL=$(GOOG_GMAIL_API_PREFIX_URL)?project=$(GOOG_PROJECT_ID)

# 3. Create Oauth Credentials
GOOG_OAUTH_ACTIVATE_URL=https://console.developers.google.com/apis/credentials/consent?project=$(GOOG_PROJECT_ID)

https://console.developers.google.com/apis/credentials?project=goog-email-test

# 3 Create Credentials for Email.
GOOG_GMAIL_API_CRED_URL=$(GOOG_GMAIL_API_PREFIX_URL)/gmail.googleapis.com/credentials?project=$(GOOG_PROJECT_ID)

# 3. Create Credentials for the "smart" api.
# Click "Create Credentilals" and "Create OAuth client ID"
# Only choose a name and add your email
# DOnt add any logo or domain info
GOOG_CRED_ACTIVATE_URL=https://console.developers.google.com/apis/credentials/wizard?project=$(GOOG_PROJECT_ID)
#- pick "Smart API"
#- pick "Other UI"
#- pick "Application date"
GOOG_CRED_CONSOLE_URL=https://console.developers.google.com/apis/credentials?&project=$(GOOG_PROJECT_ID)
#- save the GOOG_OAUTH2_CLIENT_ID
#- save the GOOG_OAUTH2_CLIENT_SECRET
GOOG_OAUTH2_CLIENT_ID= 32629484251-mq3uhfi2sn97e4fh1mb1v5sgp4o8e3td.apps.googleusercontent.com
GOOG_OAUTH2_CLIENT_SECRET= nsBjE87vNyZUIQX7LC5x3B4c


# 4 make a nest project ID
NEST_ACTIVATE_URL=https://developers.google.com/nest/device-access/registration
NEST_PROJECT_ID=home
NEST_PROJECT_GUID=95ec4a1b-2cff-4845-bd16-c6fa966f98a1
NEST_PROJECT_CONSOLE_URL=https://console.nest.google.com/device-access/project/$(NEST_PROJECT_GUID)/information
NEST_OAUTH_URL='https://nestservices.google.com/partnerconnections/$(GOOG_PROJECT_ID)/auth?redirect_uri=https://www.google.com&access_type=offline&prompt=consent&client_id=$(GOOG_OAUTH2_CLIENT_ID)&response_type=code&scope=https://www.googleapis.com/auth/sdm.service'



print:
	@echo -- PROJECT --
	@echo GOOG_PROJECT_ACTIVATE_URL: 	$(GOOG_PROJECT_ACTIVATE_URL)
	@echo GOOG_PROJECT_ID: 				$(GOOG_PROJECT_ID)
	@echo GOOG_PROJECT_URL: 			$(GOOG_PROJECT_URL)
	@echo
	@echo -- API --
	@echo GOOG_GMAIL_API_URL: 			$(GOOG_GMAIL_API_URL)
	@echo GOOG_GMAIL_API_ACTIVATE_URL: 	$(GOOG_GMAIL_API_ACTIVATE_URL)
	@echo GOOG_GMAIL_API_CRED_URL: 		$(GOOG_GMAIL_API_CRED_URL)
	@echo
	@echo -- OAUTH2 --
	@echo GOOG_OAUTH_ACTIVATE_URL: 		$(GOOG_OAUTH_ACTIVATE_URL)
	@echo
	@echo -- CRED --
	@echo GOOG_CRED_ACTIVATE_URL: 		$(GOOG_CRED_ACTIVATE_URL)
	@echo GOOG_CRED_CONSOLE_URL: 		$(GOOG_CRED_CONSOLE_URL)
	@echo
	@echo -- OAUTH2 --
	@echo GOOG_OAUTH2_CLIENT_ID: 		$(GOOG_OAUTH2_CLIENT_ID)
	@echo GOOG_OAUTH_URL:				$(GOOG_OAUTH_URL)
	@echo 
	@echo -- NEST --
	@echo NEST_ACTIVATE_URL: 			$(NEST_ACTIVATE_URL)
	@echo NEST_PROJECT_ID: 				$(NEST_PROJECT_ID)
	@echo NEST_PROJECT_GUID: 			$(NEST_PROJECT_GUID)
	@echo NEST_PROJECT_CONSOLE_URL: 	$(NEST_PROJECT_CONSOLE_URL)
	@echo NEST_OAUTH_URL: 				$(NEST_OAUTH_URL)
	@echo 
	@echo 

01:
	# Create project
	open $(GOOG_PROJECT_NEW_URL)
	# save the Project ID !

02:
	# Activate the API
	open $(GOOG_GMAIL_API_ACTIVATE_URL)

03: 
	# Create oAuth consent
	# screen: Pick internal, so you dont need to get verified. Just name an email needed
	# scopes: Pick "https://mail.google.com/"
	open $(GOOG_OAUTH_ACTIVATE_URL)

04:
	# Create an OAuth Client ID
