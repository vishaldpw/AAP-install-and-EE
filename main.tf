 1052  docker pull quay.io/rayank/ansible-modules:66    (Pulling our image to server)
 
 1054  docker images                                  (listing images) 

 1060  docker run -it -d --name container-test quay.io/rayank/ansible-modules:66  (launching a container from image ansible-modules:66)
 
[root@ansible ~]# docker ps
CONTAINER ID  IMAGE                              COMMAND     CREATED        STATUS        PORTS       NAMES
655766b8d897  quay.io/rayank/ansible-modules:66  bash        3 minutes ago  Up 3 minutes              container-test
[root@ansible ~]#

 1063  docker exec -it 655766b8d897 bash      (login to container) 

======= From this step onwards we are in conatinere ======== // Look out for the hostname

[root@655766b8d897 runner]#
[root@655766b8d897 runner]#
[root@655766b8d897 runner]# ansible-galaxy collection install servicenow.servicenow   (installing servicenow collections) 
Starting galaxy collection install process
[WARNING]: Collection redhatinsights.insights does not support Ansible version 2.15.3rc1
Nothing to do. All requested collections are already installed. If you want to reinstall them, consider using `--force`.
[root@655766b8d897 runner]#

============= Next Steps commit, tag the image and push to repository are out of conatiner ===============================

exit from conatiner 
[root@655766b8d897 runner]# exit
exit
[root@ansible ~]#

[root@ansible ~]# docker container commit 655766b8d897 quay.io/rayank/ansible-modules:77    (commit the changes made in conatiner - With new name - here :77 )

[root@ansible ~]# docker images    (you should see both old and new images) 
REPOSITORY                      TAG         IMAGE ID      CREATED         SIZE
quay.io/rayank/ansible-modules  77          bf65335ab252  31 seconds ago  2.16 GB
quay.io/rayank/ansible-modules  66          5110c54fa8ba  6 days ago      2.16 GB
[root@ansible ~]#


 
 [root@ansible ~]# docker login quay.io
 [root@ansible ~]# docker image push quay.io/rayank/ansible-modules:77
 
