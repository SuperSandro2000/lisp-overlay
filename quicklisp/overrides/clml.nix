{ pkgs, ... }:

[
  {
    predicate = { dist, ... }: dist == "2020-10-16";
    override = drv: drv;
    correction = data: {
      # Remove dependency on clml.data.r-datasets-package - it's a metapackage anyway
      systems = data.systems // {
        "clml.data.r-datasets" = data.systems."clml.data.r-datasets" // {
          dependencies = builtins.filter (x: x != "clml.data.r-datasets-package")
            data.systems."clml.data.r-datasets".dependencies;
        };
      };
    };
  }
]
