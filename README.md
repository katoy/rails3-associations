
[![Build Status](https://travis-ci.org/katoy/rails3-ssociations.png?branch=master)](https://travis-ci.org/katoy/rails3-ssociations)
[![Dependency Status](https://gemnasium.com/katoy/rails3-ssociations.png)](https://gemnasium.com/katoy/rails3-ssociations)
[![Coverage Status](https://coveralls.io/repos/katoy/rails3-ssociations/badge.png)](https://coveralls.io/r/katoy/rails3-ssociations)

１対多
-------
　　idea (1) <--> (m) comment

　　[idea]
    　has_many :comments, dependent: :destroy, :inverse_of => :idea

　　[comment]
　　　belongs_to :idea, inverse_of: :comments
　　　t:references :comment
　　
１対１
-------
　　idea (1) <--> (1) info

　　[idea]
　　　has_one :info, dependent: :destroy, :inverse_of => :idea

　　[info]
　　　belongs_to :idea, , inverse_of: :info
　　　t:references :comment

多対多 (not yet)
------
　　idea (m) <--> (m) idea

ポリモフィック（polymorphic）関連
----------
    idea    --|
	          |-- picture
    comment --|  

　　[idea]
　　　has_many :pictures, as: :imageable

　　[comment]
　　　has_many :pictures, as: :imageable

　　[picture]
　　　belongs_to: imageable, polymorphic: true

　　in Fixture:
      imageable:  one (idea)
　　　imageable:  one (commnet)

操作
-----

    $ bundle instal
    $ rake db:drop
    $ rake db:create
    $ rake db:migrate
    $ rake db:fixtures:load
    $ rake test
    $ rails s

* test/modes/idea_test.rb

 has_many, has_one の option で dependent: :destroy を指定している場合、
　　データを削除すると 子のデータが自動削除される
 ことをテストしている。
 
 belongs_to, has_one の option で  :inverse_of を指定している場合、 
   子データの親データとしてアクセスしたものが、自分自身そのものになる
 ことをテストしている。

 validates で 文字列長さ [4..10] の制限が有効なことをテストしている。

* $ rake erd filetype=png

 ./erd.png として ER 図を生成する。


See
====
- http://railsdoc.com/references/belongs_to
　　Railsドキュメント: belongs_to
- http://railsdoc.com/references/has_one
　　Railsドキュメント: has_one

- http://merrill777.blog135.fc2.com/blog-date-201304.html
　　Rails3.2 でWebアプリケーションを作成

- http://railsgirls.jp/app/
　　Rails Girls アプリ・チュートリアル

- http://www.nullislove.com/2008/01/08/testing-in-rails-part-7-activerecord-relationships/
　　Testing in Rails: Part 7 – ActiveRecord Relationships

- http://d.hatena.ne.jp/shindo_r/20130227/1361930960
　　inverse_of を使うと何ができるのか

- http://memo.yomukaku.net/entries/187
　　validates :uniquenessはuniquenessを保証しないのでDBにindexをつけましょう！

- http://ruby-journal.com/rails/define-fixtures-with-polymorphic-association/
　　Define Fixtures With Polymorphic Association
