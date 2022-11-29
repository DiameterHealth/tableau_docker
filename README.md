
# Dockerfile for Tableau Server on Linux. 

## Build
   
Be sure that your `EDITOR` environment variable is set then simply call `make`:

    make
    
## Run image

To boot (run) Tableau Server container simply execute:

    make run

It will call a `systemd` `/sbin/init` on the image and configure, register and start tableau server
on the first start.

To connect from a different terminal to the server itself use

    make exec
    
Pro tipp: If you commit the image state after the first execution (tableau configuration and registration) you don't
have to wait minutes next time.
    


## Tableau docs

- [Introducing Tableau Server on Linux](https://onlinehelp.tableau.com/current/server-linux/en-us/release_notes_linux.htm)

- [Whitepaper Tableau for the enterprise](https://www.tableau.com/sites/default/files/whitepapers/whitepaper_tableau-for-the-enterprise_0.pdf)

- [Online Help](http://onlinehelp.tableau.com/v10.5/pro/desktop/en-us/help.htm)
