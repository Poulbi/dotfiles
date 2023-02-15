set my_user = "tlast@murena.io"
set my_pass = "`pass tokens/tlast@murena.io`"

set smtp_url = "smtp://$my_user:$my_pass@mail.ecloud.global:587/"
set imap_user = $my_user
set imap_pass = $my_pass 
set folder = "imaps://mail.ecloud.global:993"
set smtp_authenticators = "login"
set ssl_starttls=yes
set ssl_force_tls=yes
set spoolfile = "+INBOX"
