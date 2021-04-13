{ pkgs, ... }:

[
  {
    predicate = _: true;
    override = drv: drv;
    correction = data: {
      # Add missing dependency on trivial-features
      systems = data.systems // {
        "cffi-grovel" = data.systems."cffi-grovel" // {
          dependencies = data.systems."cffi-grovel".dependencies ++ [
            "babel"
            "trivial-features"
          ];
        };
      };
    };
  }
]
