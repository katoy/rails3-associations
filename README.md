
[![Build Status](https://travis-ci.org/katoy/rails3-associations.png?branch=master)](https://travis-ci.org/katoy/rails3-associations)
[![Dependency Status](https://gemnasium.com/katoy/rails3-associations.png)](https://gemnasium.com/katoy/rails3-associations)
[![Coverage Status](https://coveralls.io/repos/katoy/rails3-associations/badge.png?branch=master)](https://coveralls.io/r/katoy/rails3-associations?branch=master)

１対多
-------

    idea (1) <--> (m) comment

　　[idea]  
    　has_many :comments, dependent: :destroy, :inverse_of => :idea  
　　  
　　[comment]  
　　　belongs_to :idea, inverse_of: :comments  
　　　t:references :comment  
　　  
　　Idea.first.comments  
　　Comment.first.idea  


１対１
-------

    idea (1) <--> (1) info

　　[idea]  
　　　has_one :info, dependent: :destroy, :inverse_of => :idea  
　　  
　　[info]  
　　　belongs_to :idea, , inverse_of: :info  
　　　t:references :comment  
　　  
　　Idea.first.info  
　　Info.first.idea  

多 対 多
------

    assembly (m) <--> (m) part
　　
　　[assenly]  
　　   has_and_belongs_to_many :parts  
　　  
　　[part]  
　　   has_and_belongs_to_many :assemblies  
　　  
　　[assenblies_parts]  
　　   t:belongs_to :assenbly  
　　   t:belongs_to :part  
　　  
　　  
　　Assembly.last.parts  
　　Part.last.assemblies  
　　  

ポリモフィック（polymorphic）関連
----------

    idea    --| (1)  
                      (m) |-- picture  
    comment --| (1)   

　　[idea]  
　　　has_many :pictures, as: :imageable  
　　  
　　[comment]  
　　　has_many :pictures, as: :imageable  
　　  
　　[picture]  
　　　belongs_to: imageable, polymorphic: true  
　　  
　　in Fixture:  
　　  imageable:  one (idea)  
　　  imageable:  one (comment)  
　　  
　　Idea.first.pictures  
　　Idea.first.picture_ids  
　　Comment.first.pictures  
　　Comment.first.picture_ids  

多 対 多 and ポリモフィック（polymorphic）関連
----------

    xassembly (m) --|  
                     (m) |-- part2  
    yassembly (m) --|   

　　[xassenbly]  
　　　has_many :subscriptions, :as => :attendee  
　　　has_many :part2s, :through => :subscriptions  
　　  　　  
　　[yassembly]  
　　　has_many :subscriptions, :as => :attendee  
　　　has_many :part2s, :through => :subscriptions  
　　  　　  
　　[part2]  
　　　has_many :subscriptions    
　　  　　  
　　[subscription]  
　　  t.belongs_to :attendee, polymorphic: true  
　　  t.belongs_to :part2  
　　  
　　in Fixture:  
　　  imageable:  one (idea)  
　　  imageable:  one (comment)  
　　  
　　Xassembly.first.port2s  
　　Yassembly.first.port2s  
　　Part2.first.subscriptions  

操作
-----

    $ bundle install
    $ rake db:drop
    $ rake db:create
    $ rake db:migrate
    $ rake db:fixtures:load
    $ rake fixtures
    $ rake show
    $ rake table_print
    $ rake test
    $ rails s

* test/modes/idea_test.rb

 has_many, has_one の option で dependent: :destroy を指定している場合、
　　データを削除すると 子のデータが自動削除される
 ことをテストしている。
 
 belongs_to, has_one の option で  :inverse_of を指定している場合、 
   子データの親データとしてアクセスしたものが、自分自身そのものになる
 ことをテストしている。

 validates で 文字列長さ [4..32] の制限が有効なことをテストしている。

* $ rake erd orientation=vertical filetype=png

 ./erd.png として ER 図を生成する。


* $ rake spec

主な画面のスクリーンショットを撮る  (./screenshots/*.png)

* $ bundle viz

gem の依存関係を gem_graph.png として出力する。


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

- http://stackoverflow.com/questions/6964678/habtm-polymorphic-relationship  
    HABTM Polymorphic Relationship  

