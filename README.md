**📢 Maintainer wanted: This project is looking for maintainers, please open up an issue if you would love to chime in!**

---

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![MELPA](https://melpa.org/packages/helm-file-preview-badge.svg)](https://melpa.org/#/helm-file-preview)
[![MELPA Stable](https://stable.melpa.org/packages/helm-file-preview-badge.svg)](https://stable.melpa.org/#/helm-file-preview)

# helm-file-preview
> Preview the current helm file selection.

[![CI](https://github.com/jcs-legacy/helm-file-preview/actions/workflows/test.yml/badge.svg)](https://github.com/jcs-legacy/helm-file-preview/actions/workflows/test.yml)

Every time uses [helm](https://github.com/emacs-helm/helm) 
to select the file is what painful to me. Especially when 
I use other extensions like 
[helm-ag](https://github.com/syohex/emacs-helm-ag), 
[helm-gtags](https://github.com/syohex/emacs-helm-gtags), 
[dumb-jump](https://github.com/jacktasia/dumb-jump#alternatives), 
etc. This package help you figure out what the file you are 
actually pointing to by showing the file in the previous window.

| helm-ag | helm-gtags |
|:---:|:---:|
|<img src="./etc/helm-ag-preview-demo.gif"/> | <img src="./etc/helm-gtags-preview-demo.gif"/>|

Few differences to `helm-follow-mode`.
* Decouple from `helm-source`.
* Customize once, works across all packages that use `helm`'s interface.
* Preview instead of opening files.

## 🔧 Usage

Add these lines to somewhere in your Emacs config.
```el
(require 'helm-file-preview)
(helm-file-preview-mode 1)
```
Or if you are using `use-package`.
```el
(use-package helm-file-preview
  :config
  (helm-file-preview-mode 1))
```

## 🧪 Customization

Turn off this if you want to preview the file no matter what. 
The default behaviour is the preview action will only occurs 
when line numbers appears in the selection. For instance, 
using `helm-ag`, `helm-gtags` or any packages that 
make compatible to [helm](https://github.com/emacs-helm/helm) 
interface.

```el
(setq helm-file-preview-only-when-line-numbers t)
```

If you don't want the file to be opened after viewing the file, 
you can set this variable to `t`. If you want to leave the file 
opened then you should set to `nil`.

```el
(setq helm-file-preview-preview-only t)
```

## 🛠️ Contribute

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![Elisp styleguide](https://img.shields.io/badge/elisp-style%20guide-purple)](https://github.com/bbatsov/emacs-lisp-style-guide)
[![Donate on paypal](https://img.shields.io/badge/paypal-donate-1?logo=paypal&color=blue)](https://www.paypal.me/jcs090218)
[![Become a patron](https://img.shields.io/badge/patreon-become%20a%20patron-orange.svg?logo=patreon)](https://www.patreon.com/jcs090218)

If you would like to contribute to this project, you may either
clone and make pull requests to this repository. Or you can
clone the project and establish your own branch of this tool.
Any methods are welcome!

### 🔬 Development

To run the test locally, you will need the following tools:

- [Eask](https://emacs-eask.github.io/)
- [Make](https://www.gnu.org/software/make/) (optional)

Install all dependencies and development dependencies:

```sh
eask install-deps --dev
```

To test the package's installation:

```sh
eask package
eask install
```

To test compilation:

```sh
eask compile
```

**🪧 The following steps are optional, but we recommend you follow these lint results!**

The built-in `checkdoc` linter:

```sh
eask lint checkdoc
```

The standard `package` linter:

```sh
eask lint package
```

*📝 P.S. For more information, find the Eask manual at https://emacs-eask.github.io/.*

## ⚜️ License

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

See [`LICENSE`](./LICENSE.txt) for details.
