{pkgs, ...}: {
  # Enabling QEMU+KVM and virt-manager
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [virtiofsd];
  };
  programs.virt-manager.enable = true;

  # Adding my user to libvitd group
  users.users.nikolaj.extraGroups = ["libvirtd"];

  # For DNS and DHCP functionality within the network
  environment.systemPackages = with pkgs; [
    vagrant
    dnsmasq
  ];

  # Allow virbr0 interface through firewall filter
  networking.firewall.trustedInterfaces = ["virbr0"];
}
