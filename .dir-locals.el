;;; Directory Local Variables            -*- no-byte-compile: t -*-
;;; For more information see (info "(emacs) Directory Variables")


((org-mode . ((org-publish-project-alist .
                                         ;; 元の設定はコメントアウトまたは削除
                                         ;; (("org-files"
                                         ;;   :base-extension "org"
                                         ;;   :base-directory "./"
                                         ;;   :recursive t
                                         ;;   :exclude ".chats/"
                                         ;;   :publishing-directory "./dist/")
                                         ;;  ("images"
                                         ;;   :base-directory "./fig/"
                                         ;;   :base-extension ".*"
                                         ;;   :recursive t
                                         ;;   :publishing-directory "./dist/fig/"
                                         ;;   :publishing-function org-publish-attachment)
                                         ;;  ("files"
                                         ;;   :base-directory "./files/"
                                         ;;   :base-extension ".*"
                                         ;;   :publishing-directory "./dist/files/"
                                         ;;   :publishing-function org-publish-attachment)
                                         ;;  ("tangles"
                                         ;;   :base-directory "./tangles/"
                                         ;;   :base-extension ".*"
                                         ;;   :publishing-directory "./dist/tangles/"
                                         ;;   :publishing-function org-publish-attachment)
                                         ;;  ("notes" :components ("org-files" "images" "files" "tangles")))

                                         ;; 新しい設定案
                                         (("org-content" ;; Org ファイルとその関連ファイル (画像など)
                                           :base-directory "./"
                                           :base-extension "org"
                                           :recursive t
                                           ;; 除外するディレクトリやファイル (正規表現)
                                           :exclude "\\(\\.git\\|dist\\|\\.dir-locals\\.el\\|\\.sync\\|\\.DS_Store\\|\\org-html-themes\\|\\.cache\\|\\.chats\\)/\\|setup\\.org"
                                           :publishing-directory "./dist/"
                                           ;; HTML へのパブリッシュ関数を指定
                                           ;; これが Org ファイル内の画像リンクを解決し、画像をコピーする役割を担う
                                           :publishing-function org-html-publish-to-html
                                           ;; もし org-tailwind を使用している場合はこちらを有効化
                                           ;; :publishing-function org-tailwind-publish-to-html
                                           :html-postamble "
                                                    <p class=\"author\">Author: Kaoru Babasaki</p>
                                                    <p class=\"email\">Email: <a href=\"mailto:bbkaoru1007@keio.jp\">bbkaoru1007@keio.jp</a></p>
                                                    <p class=\"date\">Last Updated: %d</p>
                                                    <a href=\"/index.html\">Home (English)</a> |
                                                    <a href=\"/index_jp.html\">ホーム (日本語)</a> |
                                                    <a href=\"https://github.com/KaoruBB/Hoff_AFCBSM\" target=\"_blank\" rel=\"noopener noreferrer\" title=\"View source on GitHub\">
                                                        <img src=\"/icons/github-mark-white.svg\" alt=\"GitHub\" style=\"height: 1em; vertical-align: middle; margin-right: 0.2em;\">
                                                    </a>"
                                           )

                                          ("static-assets" ;; CSS, JS, Fonts, MathJax など共通の静的ファイル
                                           :base-directory "./"
                                           ;; コピーしたい静的ファイルの拡張子 (正規表現)
                                           :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|svg\\|woff\\|woff2\\|ttf\\|eot\\|swf\\|json\\|map\\|html\\|txt\\|ico"
                                           :recursive t
                                           ;; 除外: Org ソースファイル, .el ファイル, Git, 出力先, 各章の fig ディレクトリ (org-content で処理される想定) など
                                           :exclude "\\(\\.git\\|dist\\|\\.dir-locals\\.el\\|\\.org$\\|\\.el$\\)/\\|ch[0-9]+/fig/"
                                           ;; 必要であれば :include でコピー対象ディレクトリを明示的に指定する方が確実
                                           ;; 例: :include ("css/.*" "js/.*" "mathjax/.*" "org-html-themes/.*" "icons/.*")
                                           :publishing-directory "./dist/"
                                           :publishing-function org-publish-attachment
                                           )

                                          ;; tangles ディレクトリがある場合のコンポーネント (必要に応じて)
                                          ;; ("tangles"
                                          ;;  :base-directory "./tangles/" ; tangles ディレクトリのパス
                                          ;;  :base-extension ".*"
                                          ;;  :publishing-directory "./dist/tangles/" ; 出力先
                                          ;;  :publishing-function org-publish-attachment)

                                          ("project" :components ("org-content" "static-assets")) ; 必要なら "tangles" も追加
                                          )))))
