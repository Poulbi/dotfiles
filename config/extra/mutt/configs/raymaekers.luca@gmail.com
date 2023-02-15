set from = "raymaekers.luca@gmail.com"
set realname = "Raymaekers Luca"
set my_pass = "`pass tokens/raymaekers.luca@gmail.com`"

# IMAP settings
set imap_user = "raymaekers.luca@gmail.com"
set imap_pass = $my_pass

# SMTP settings
set smtp_url = "smtps://raymaekers.luca@smtp.gmail.com"
set smtp_pass = $my_pass

# Remote Gmail folders
set folder = "imaps://imap.gmail.com/"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set record = "+[Gmail]/Sent Mail"
set trash = "+[Gmail]/Trash"
