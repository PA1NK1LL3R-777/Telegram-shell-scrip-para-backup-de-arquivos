# Telegram-shell-scrip-para-backup-de-arquivos

## Pra que serve o script?
Fazer backup de arquivos na sua vps ou pc local, em espefico uma distribuição linux e enviar para um grupo ou no seu privado com um bot, assim ficando salvo na nuvem do telegram.  
  
## Como usar?
  
siga os passos abaixo

baixe o script com comando abaixo:
  
```bash
wget https://raw.githubusercontent.com/PA1NK1LL3R-777/Telegram-shell-scrip-para-backup-de-arquivos/main/telegram -O /bin/telegram
```

de permissão para execução do script

```bash
chmod +x /bin/telegram
```

Altere o TOKEN do bot para o seu, caso não saiba criar um bot no telegram, basta pesquisar no youtube.

Comando para alteração do token:

```bash
vim /bin/telegram
```
ou

```bash
nano /bin/telegram
```

Altere o TOKEN e o formato da compactação (zip ou tar)

Altere o token:

```bash
TOKEN="000000000:0000000000000-0000000000000000000000000000000"
```
Escolha o metodo de compactação tar/zip:

```bash
COMPAC='tar'
```

ou

```bash
COMPAC='zip'
```

AGORA VAMOS EDITAR O OUTRO ARQUIVO SHELL.

baixe ele usando wget:

```bash
wget https://raw.githubusercontent.com/PA1NK1LL3R-777/Telegram-shell-scrip-para-backup-de-arquivos/main/telegram_backup-bot.sh
```

editaremos apenas o ID usuário ou grupo (lembre-se que grupo sempre tem um “-” antes do ID), nome do arquivo e diretorio, ex:
```bash
"ID_CHAT" "DIRETORIO" "NOME"

"1496646298" "/root/bots" "bot1"

/bin/telegram -f "1496646298" "/root/bots" "bot1" "Backup feito as: $(date +%F\ %T)" >> /root/botbackup1.log

```

Feche e salve o arquivo.

De permissião nesse arquivo para execução

```bash
chmod +x telegram_backup-bot.sh
```

## Adicionando no crontab para que fique 100% automatico.

entre em modo root, caso não esteja.

```bash
sudo su -
```

Agore edite o arquivo /etc/crontab

```bash
vim /etc/crontab

ou

nano /etc/crontab
```
Irar aparecer:
```bash
# that none of the other crontabs do.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
#
```

Vá até o # e pule para baixo, volte para linha sem escrita e adicione:

```bash
*/1   *  * * *   root  /root/telegram_backup-bot.sh
```
essa linha está programada para enviar um bakcup a cada 1 minuto.

No meu caso o script está no diretorio /root/, apenas altere para o seu.

Se estiver assim:
```bash
# that none of the other crontabs do.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
*/1   *  * * *   root  /root/telegram_backup-bot.sh
#
```
Feche e salve.


Pronto!



  
## Esse scrip foi feito pelo remontti
- [Link do site dele](https://blog.remontti.com.br/4791) 

- Abraços! 
