{
  config,
  lib,
  ...
}: {
  # Enable thermald to prevent overheating on Intel CPUs
  services.thermald.enable = true;

  # auto-cpufreq for power management
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "auto";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
}
