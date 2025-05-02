;;; Directory Local Variables            -*- no-byte-compile: t -*-
;;; For more information see (info "(emacs) Directory Variables")

((org-mode . ((org-publish-project-alist . (("org-content"
                                             :base-directory "./"
                                             :base-extension "org"
                                             :recursive t
                                             :exclude "\\(\\.git\\|dist\\|\\.dir-locals\\.el\\|\\.sync\\|\\.DS_Store\\|\\org-html-themes\\|\\.cache\\|\\.chats\\)/\\|setup\\.org"
                                             :publishing-directory
                                             "./dist/"
                                             :publishing-function org-html-publish-to-html
                                             :html-postamble "
                                                <p class=\"author\"> Author:<a href=\"https://kaorubb.org/\"> %a</a></p>
                                                <p class=\"email\" style=\"margin-bottom: 0em;\">Email: %e</p>
                                                <p class=\"date\">Last Updated: %T</p>
                                                <p style=\"margin-bottom: 0em;\">
                                                    <img src=\"/icons/house-color-icon.svg\" alt=\"home\" style=\"height: 1.2em; width: 1.2em; vertical-align: middle; margin-bottom: 0.6em;\">
                                                    <a href=\"/index.html\">Home</a> |
                                                    <a href=\"/index-ja.html\">ホーム</a> |
                                                    <a href=\"https://github.com/KaoruBB/Hoff_AFCBSM\" target=\"_blank\" rel=\"noopener noreferrer\" title=\"View source on GitHub\">
                                                    <img src=\"/icons/github-mark-white.svg\" alt=\"GitHub\" style=\"height: 1.2em; width: 1.2em; vertical-align: middle; margin-bottom: 0.6em;\">
                                                    </a>
                                                </p>")
                                            ("static-assets"
                                             :base-directory "./"
                                             :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|svg\\|woff\\|woff2\\|ttf\\|eot\\|swf\\|json\\|map\\|html\\|txt\\|ico"
                                             :recursive t
                                             :exclude "\\(\\.git\\|dist\\|\\.dir-locals\\.el\\|\\.org$\\|\\.el$\\)/\\|ch[0-9]+/fig/"
                                             :publishing-directory "./dist/"
                                             :publishing-function org-publish-attachment)
                                            ("project"
                                             :components ("org-content" "static-assets")))))))
