# some cookbooks

## 概要

 * some (https://github.com/tily/some) 向けの cookbooks です
 * 配布 URL は http://some.ncss.nifty.com/cookbooks.tgz です
 * 動作確認環境は NIFTY Cloud の CentOS 6.3 64bit Plain (image_id=26) です
 * rake upload S3_BUCKET=some S3_KEY=cookbooks.tgz でニフティクラウドストレージにアップロードできます

## 環境構築

	cd /var/chef/cookbooks
	yum install -y gcc libxml2-devel libxslt-devel git
	/opt/chef/embedded/bin/bundle

## TODO

 * cookbooks
   * hostsfile
     * うまく動いていないところがあるっぽい
   * drbd
     * 次のノードが立ち上がってくるまで起動スクリプトが終了しない
       * 自動で yes を押すようなオプションがないか…
     * node["hoge"] = "" とやっている箇所がありエラーとなる
   * redmine
     * deploy_revision の before_migrate で明示的に current/public へリンクを貼るようにする
     * bundle install がうまく動作していない (異常終了していないけど、DB アダプタが入らない？)
       * db:migrate 時に mysql2 が認識されてない？
     * /opt/redmine/current の中身が log ディレクトリ等のスケルトンだけになってしまう
       * /var/www/redmine/public から /opt/redmine/current/public へのリンクが張られない
       * deploy_revision-before-migrate で手動でリンクを貼った
   * haproxy
     * some::haproxy として chef-solo でも動き http/https 以外にも対応しているものを作る
   * gitlab
     * unicorn のタイムアウトを外出しにできるようにする
   * s3
     * https で動かないのを直す
   * iptables
   * openldap
   * chef-solo-search
     * solo-search でインポートされてしまった
   * mysql
     * ユーザー追加の SQL が実行されない
 * rake upload
   * .git を含まないようにする
 * misc
   * use Berksfile
   * https://gist.github.com/ysaotome/2048331
   * cookbooks のバージョンを固定する

## 作者

 * tily <tidnlyam@gmail.com>
