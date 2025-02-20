{
  config,
  lib,
  ...
}: {
  options.power.enable = lib.mkEnableOption "enable power management";

  config = lib.mkIf config.power.enable {
    # Enable thermald to prevent overheating on Intel CPUs
    services.thermald.enable = true;

    # auto-cpufreq for power management
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
