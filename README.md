# docpht-ping

ports used are 
80 443 docpht 
hapttic is on port 84 on your system.





a idea for https://github.com/docpht/docpht using https://github.com/jsoendermann/hapttic running in a  docker  container

How to use, run make in the project folder and fix any errors. 

```bash 
make
```

if you need it on system boot up, use 
    ```bash 
    make boot-up or make boot-down
    ```
boot-up:
	$(on_boot)
	systemctl enable hapttic

boot-down:
	$(disable_boot)
	systemctl disable hapttic

to see logs: 
sudo journalctl -f -u hapttic



- TODO
- [x] create systemd for hapttic
- [ ] Get correct paths 


