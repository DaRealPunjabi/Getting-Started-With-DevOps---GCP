# Install and Configure Google SDK


## Prerequisite
Cloud SDK requires Python. Supported versions are 3.5 to 3.7, and 2.7.9 or higher. To check the Python version installed on your system:

```
python -V
```

# Install the SDK

Enter the following at a command prompt to save the install script locally
```
curl https://sdk.cloud.google.com > install.sh
```
Run the script using bash or zsh
```zsh install.sh --disable-prompts
```
>— disable-prompts ~ disable prompts <br />
>— install-dir=DIRECTORY ~set the installation root directory to DIRECTORY. The Cloud SDK will be installed in DIRECTORY/google-cloud-sdk. The default is $HOME. <br />
>❗️ Close and restart the terminal for the changes to take effects. <br />

# Initialise the SDK
Use the gcloud init command to perform several common SDK setup tasks. These include authorizing the SDK tools to access Google Cloud Platform using your user account credentials and setting up the default SDK configuration.
```
gcloud init
```
## Create a configuration
<pre>
Pick configuration to use:
 [1] Re-initialize this configuration [default] with new settings
 [2] Create a new configuration
Please enter your numeric choice: <b>2</b>
</pre>

## Give it a name …
<pre>
Enter configuration name. Names start with a lower case letter and
contain only lower case letters a-z, digits 0–9, and hyphens ‘-’:  <b>darealpunjabi-20200813</b>
</pre>

## Authenticate to Google Cloud
<pre>
You must log in to continue. Would you like to log in (Y/n)? <b>Y</b>
This will open your browser and allow you to log in to GCP account. Once verified …
You are logged in as: [your-email@gmail.com].
Pick cloud project to use:
 [1] Create a new project
Please enter your numeric choice: <b>1</b>
Enter a Project ID. <b>darealpunjabi-20200813</b>
👏 Your current project has been set to: [darealpunjabi-20200813].
</pre>

# Working with Configurations

[gcloud config | Cloud SDK Documentation | Google Cloud](https://cloud.google.com/sdk/gcloud/reference/config "Google Developer Tools")

## List the Configuration
```
gcloud config configurations list
```
>default <br />
>darealpunjabi-20200813 <br />

## Describe a Configuration
```
gcloud config configurations describe darealpunjabi-20200813
```
>is_active: true <br />
>name: devops-20200813 <br />
>properties: <br />
> ▫️ core: <br />
> ▫ account: your-email@gmail.com <br />
> ▫ project: darealpunjabi-20200813 <br />

## Activate another Configuration
gcloud config configurations activate <config-name>
