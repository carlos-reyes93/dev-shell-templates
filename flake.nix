{
  description = "A collection of flake templates";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs =
      import
      nixpkgs {inherit system;};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [just];
    };

    templates = {
      angular = {
        path = ./angular;
        description = "Angular development template";
        welcomeText = ''          You have created an Angular template that will help
                 you develop your frontend application. See the README for further
                 instructions. '';
      };

      cpp = {
        path = ./cpp;
        description = "C++ development template using cmake";
        welcomeText = ''
          You have created an C++ template using cmake. See the README for
          further instructions. '';
      };

      rust-stable = {
        path = ./rust-stable;
        description = "Rust development
      template";
        welcomeText = ''              You have created a Rust template
          that will help you manage your project. See the README for instructions
          on how to use the template. '';
      };

      rust-nightly = {
        path = ./rust-nightly;
        description = "Rust development
      template using fenix";
        welcomeText = ''              You have created a Rust
          template that will help you manage your project. See the README for
          instructions on how to use the template. '';
      };

      svelte-tailwind = {
        path = ./svelte-tailwind;
        description = "Svelte
      development template with tailwind.css";
        welcomeText = ''              You
          have created a Svelte template that will help you manage your project.
          See the README for instructions on how to

                       use the template. '';
      };

      volta = {
        path = ./volta;
        description = "Volta
      development template for NextJS";
        welcomeText = ''              You
          have created a Svelte template that will help you manage your project.
          See the README for instructions on how to
                       use the template. '';
      };

      trivial = {
        path = ./trivial;
        description = "Simple template using
      flake-utils";
      };
    };
  };
}
