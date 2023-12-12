# sSMTP

Extremely simple MTA to get mail off the system to a mail hub. This is ssmtp into a snap.

***

## Snap building
The snap can be built using snapcraft. The snapcraft.yaml file is located in the snap directory. To build the snap, use the following command:

`snapcraft`

Remember to put yourself in the snap-ssmtp directory before running the command.

## Snap installation
The installation process is pretty straight forward and you can install the snap in two different ways:
- From the snap store
- From a local file

The easiest way is to install the snap from the snap store. Use the following command:

`snap install ssmtp-snap`

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-white.svg)](https://snapcraft.io/ssmtp-snap)


If you prefer to install the snap from a local file, follow the instructions below.

For installing the snap in devmode from a local file, use the following command:

`snap install ssmtp-snap_2.64_amd64.snap --dangerous --devmode`

For installing the snap in confined mode from a local file, use the following command:

`snap install ssmtp-snap_2.64_amd64.snap --dangerous`

## Snap configuration
Use this command to obtain a template for your configuration file:

`ssmtp-snap.config`

Or simply copy the template below, customize it and place it in /var/snap/ssmtp-snap/current/ssmtp.conf

```
#
# sSMTP configuration file
#

# The person who gets all mail for userids < 1000
# Make this empty to disable rewriting.
root=postmaster

# The place where the mail goes. The actual machine name is required
# no MX records are consulted. Commonly mailhosts are named mail.domain.com
mailhub=your_mail_server.com

# Where will the mail seem to come from?
#rewriteDomain=

# The full hostname
hostname=your_hostname

# Are users allowed to set their own From: address?
# YES - Allow the user to specify their own From: address
# NO - Use the system generated From: address
FromLineOverride=YES

# Use SSL/TLS before starting negotiation
UseTLS=YES

# Use SSL/TLS after starting negotiation
UseSTARTTLS=YES

# Username/Password for SMTP authentication
AuthUser=your_username
AuthPass=your_password

# Use these options to provide a username and password for authentication.
#AuthUser=username
#AuthPass=password

# Use or don't use SSL/TLS for authentication.
#UseTLS=YES
#UseSTARTTLS=NO

# Where to store mail
# The mail spool directory. The default is /var/mail. This should be 
# changed to your mailbox. For example:
# mailbox=/var/spool/mail/user
maildir=/var/mail

# Add this line if you use SSL/TLS, to prevent ssmtp from failing if the cert
# isn't valid
TLS_CA_File=/etc/ssl/certs/ca-certificates.crt
```

## Usage
Using the snap is pretty straight forward.

Use this command to obtain a template for your mail:

`ssmtp-snap.email`

Or simply copy the template below and customize it to your needs:

```
To: recipient@example.com
From: your_email@example.com
Subject: Your Subject Here

Hello,

This is the body of your email. You can write your message here.

Regards,
Your Name

```

To send a mail, use the following command:

`ssmtp-snap.ssmtp -v recipient@example.com < /path/to/your/mail`

To send a mail overruling the From: address in your mail, use the following command:

`ssmtp-snap.ssmtp -f your_email@example.com -v recipient@example.com < /path/to/your/mail`
