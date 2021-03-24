# From Glenn

# I’m quite happy for there to be a general covering of all Windows style things:

# Install a Windows Role – Maybe HyperV or IIS?
# Install a Windows Feature – Also something simple, but unrelated – maybe Telnet Server?
# Configure something network related (say – static IP address, or DNS servers)
# Add a custom registry key – I don’t mind if this is to a completely novel location with no effect e.g. HLKM\SOFTWARE\PUPPETDEMO\ThisDoesNothing
# Install an application – doesn’t have to be fancy, 7Zip or other GNU is fine.
# Demonstrate something which requires a reboot to complete, and continuing after a reboot. Even something simple like:
# Create a text file
# Write the time to it
# Reboot device and wait for recovery
# Add a new line to the text file with the time




# From Shane

# I would like to get more details on multi tenanting, leveraging the role based access.   
# Keen to understand if we could setup a "Spark" based Puppet infrastructure and service smaller customers out of there or 
# Master Puppet instance managing child instances.  I guess along the lines of Puppet as a service (PaaS 🙂). 
# Good way to maintain our IP and central management and automation.

class profile::spark::demo (
  Boolean $hyperrole = false,
  Boolean $iisRole = false,
  Boolean $windowsFeatureTelnet = false,
  Boolean $ipAddress = false,
  Boolean $dnsServer = false,
  Boolean $regKey = false,
  Boolean $appInstall7zip = false,
  Boolean $rebootDemo = false,
){

  if $hyper-v-role {


  }


  if $iisRole {


  }

  if $windowsFeatureTelnet {


  }

  if $ipAddress {


  }


  if $dnsServer {


  }


  if $regKey {


  }

  if $appInstall7zip {


  }

  if $rebootDemo {


  }



}
