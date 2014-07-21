###
## This is the place to override the apache2 cookbook's default attributes.
##
## The following shows how to override the Apache contact and timeout settings:
##

normal[:apache][:contact] = 'igord@bra.in.rs'
##normal[:apache][:timeout] = 60
#

#Prefork settings
default[:apache][:prefork][:startservers] = 4
default[:apache][:prefork][:minspareservers] = 8
default[:apache][:prefork][:maxspareservers] = 10
default[:apache][:prefork][:serverlimit] = 96
default[:apache][:prefork][:maxclients] = 96
default[:apache][:prefork][:maxrequestworkers] = 100
default[:apache][:prefork][:maxrequestsperchild] = 1000
default[:apache][:prefork][:maxconnectionsperchild] = 1000

