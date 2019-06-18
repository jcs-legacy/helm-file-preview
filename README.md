[![Build Status](https://travis-ci.com/jcs090218/helm-file-preview.svg?branch=master)](https://travis-ci.com/jcs090218/helm-file-preview)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)


# helm-file-preview
> Preview the current helm file selection.

## Usage
Add these lines to somewhere in your Emacs config.
```el
(require 'helm-file-preview)
(helm-file-preview-mode t)
```
Or if you are using `use-package`.
```el
(use-package 'helm-file-preview
  :config
  (helm-file-preview-mode t))
```


## Customization
Turn off this if you want to preview the file no matter what.
```el
(setq helm-file-preview-only-when-line-numbers t)
```


## Contribution
If you would like to contribute to this project, you may either
clone and make pull requests to this repository. Or you can
clone the project and establish your own branch of this tool.
Any methods are welcome!
