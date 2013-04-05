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

## 作者

 * tily <tidnlyam@gmail.com>
