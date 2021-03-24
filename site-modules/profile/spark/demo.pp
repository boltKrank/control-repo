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
  Boolean $hyper_v_role = false,
  Boolean $iis_role = false,
  Boolean $windows_feature_telnet = false,
  Boolean $ip_address = false,
  Boolean $dns_server = false,
  Boolean $reg_key = false,
  Boolean $app_install_7zip = false,
  Boolean $reboot_demo = false,
){

  if $hyper_v_role {


  }

  #puppetlabs-iis
  if $iis_role {

    $iis_features = ['Web-WebServer','Web-Scripting-Tools']

    iis_feature { $iis_features:
      ensure => 'present',
    }

    # Delete the default website to prevent a port binding conflict.
    iis_site {'Default Web Site':
      ensure  => absent,
      require => Iis_feature['Web-WebServer'],
    }

    iis_site { 'minimal':
      ensure          => 'started',
      physicalpath    => 'c:\\inetpub\\minimal',
      applicationpool => 'DefaultAppPool',
      require         => [
        File['minimal'],
        Iis_site['Default Web Site']
      ],
    }

    file { 'minimal':
      ensure => 'directory',
      path   => 'c:\\inetpub\\minimal',
    }

    file { 'c:/inetpub/minimal/index.html':
      ensure  => 'file',
      content => 'HELLO',
    }

  }

  #puppetlabs-windowsfeature
  if $windows_feature_telnet {

    windowsfeature { 'Telnet-Client':
    ensure                 => present,
    installmanagementtools => true,
    }
  }

  # Demo over network ?
  if $ip_address {


  }


  if $dns_server {


  }

  #mod 'puppetlabs-registry', '4.0.0'
  if $reg_key {
    registry_value { 'HKLM\System\CurrentControlSet\Services\Puppet\MyNameIs':
    ensure => present,
    type   => string,
    data   => 'My name is Simon',
}

  }

  # Chocolatey ?
  if $app_install_7zip {

    #package{'7zip':
    #  ensure    => latest,
    #  provider  => 'chocolatey',
    #}

  package{'7zip':
    ensure => installed,
    source => 'https://www.7-zip.org/a/7z1900-x64.msi',
  }


  }

  #mod 'puppetlabs-reboot', '4.0.2'
  if $reboot_demo {


  }



}
