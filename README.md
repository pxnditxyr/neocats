# 🐼✨ NeoCats 🐱‍👤

**My personal Neovim configuration, powered by NixCats 🚀**

Welcome to **NeoCats**! 🎉 This is my personal Neovim setup, designed to be flexible and easy to use with both **Nix** and traditional Lua configurations. If you're looking for an efficient way to manage dependencies and keep your development environment clean and organized, you've come to the right place! 🛠️

---

## What is NeoCats? 🤔

NeoCats is a customized Neovim configuration that uses **NixCats** to efficiently manage dependencies with Nix. 🧰 Unlike **NixVim**, this configuration is not entirely tied to Nix, meaning you can use it as a traditional Lua configuration if you prefer. However, if you choose to use Nix, you'll get all the benefits of a reproducible and easy-to-install environment. 🚀

### Key Features: 🌈

- 🐱 **Flexible**: Use it with Nix or as a traditional Lua configuration.
- 🧩 **Reproducible**: With Nix, all dependencies are managed automatically.
- 🚀 **Fast**: Optimized for efficient performance.
- 🐼 **Customizable**: Add or remove plugins according to your needs.

---

## Installation 🛠️

### Option 1: Using Nix 🐚

If you decide to use Nix, the command to run Neovim with this configuration will be `neocats` instead of `nvim`. This allows you to keep your current Neovim configuration intact while testing or using NeoCats. 🎯

1. Add NeoCats to your Nix flake:
   In your `flake.nix` file, add the following to the inputs section:

    ```
    inputs = {
    ...
    neocats.url = "github:pxnditxyr/neocats";
    };
    ```

2. Install NeoCats in your home-manager:
   In your `home-manager/neocats.nix` file, add the following:

    ```
    { inputs, pkgs, ... }: {
      home.packages = [
        inputs.neocats.packages.${ pkgs.system }.default
      ];
    };
    ```

3. Rebuild your environment with home-manager:
   Run the following command to apply the changes:
   home-manager switch

4. Ready! 🎉 Now you can run NeoCats with the command:
   neocats

### Option 2: Traditional Lua Configuration 📜

If you prefer not to use Nix, you can clone this repository and use the configuration as a traditional Neovim Lua setup. However, you'll need to manually install the dependencies on your system.

1. Clone the repository into your Neovim configuration folder:
   git clone https://github.com/pxnditxyr/neocats ~/.config/nvim

2. Manually install the necessary dependencies. 🛠️

3. Ready! 🎉 Now you can run Neovim with the NeoCats configuration:
   nvim

---

## License 📄

NeoCats is licensed under the MIT license. For more details, see the [LICENSE](LICENSE) file.

---

## Contact 📧

Do you have questions or suggestions? Feel free to contact me! 😊
- **GitHub**: [@pxnditxyr](https://github.com/pxnditxyr)

---

Enjoy using NeoCats as much as I enjoyed creating it! 🐱💻✨
Happy coding! 🚀
