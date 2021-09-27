[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![MELPA](https://melpa.org/packages/helm-file-preview-badge.svg)](https://melpa.org/#/helm-file-preview)
[![MELPA Stable](https://stable.melpa.org/packages/helm-file-preview-badge.svg)](https://stable.melpa.org/#/helm-file-preview)

# helm-file-preview
> Preview the current helm file selection.

[![CI](https://github.com/jcs-elpa/helm-file-preview/actions/workflows/test.yml/badge.svg)](https://github.com/jcs-elpa/helm-file-preview/actions/workflows/test.yml)

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

## Usage

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

## Customization

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

## Contribution

If you would like to contribute to this project, you may either
clone and make pull requests to this repository. Or you can
clone the project and establish your own branch of this tool.
Any methods are welcome!
