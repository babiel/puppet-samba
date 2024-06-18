Facter.add(:samba_version) do
  confine package_provider: 'yum'
  setcode '/usr/bin/yum info samba | sed \'s/Version *: \([0-9\.]\+\)/\1/gp;d\' | head -n 1'
end

Facter.add(:samba_version) do
  confine package_provider: 'apt'
  setcode 'apt-cache show samba | sed \'s/Version:.*:\([0-9\.]\+\).*/\1/gp;d\' | head -n 1'
end

Facter.add(:samba_version) do
  confine package_provider: 'pacman'
  setcode 'pacman -Si samba | awk "/Version/ {print $3}" | cut -d"-" -f1'
end
