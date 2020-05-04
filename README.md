# architecture_iOS

# はじめに
iOSのアーキテクチャーパターンをちゃんと理解しているか判断してもらうために作成しています！<br>
ここはこうした方がいいよなどありましたら『プルリクエスト』お願いします。<br>
ブランチの使い方自体間違っているのは気にしないで頂けると嬉しいです!<br>

# 動かすまで
指摘頂いたのでcocoapodの管理方法を変更しました！(MVP、MVVM)<br>
詳しくはこちらをご覧ください → [その他の決め事1詳細](https://github.com/sachiko-kame/architecture_iOS/wiki/%E3%81%9D%E3%81%AE%E4%BB%96%E3%81%AE%E6%B1%BA%E3%82%81%E4%BA%8B1%E8%A9%B3%E7%B4%B0)<br>

- **MVP**<br>
[sample]プロジェクトで配下で<br>
`$ bundle install`<br>
`$ bundle exec pod install`<br>

- **MVVM(ライブラリ未使用)**<br>
[sample]プロジェクトで配下で<br>
`$ bundle install --path vendor/bundle` ここはなくても大丈夫かもです。<br>
`$ bundle install`<br>
`$ bundle exec pod install`<br>

# それぞれの紹介
## [MVC](https://github.com/sachiko-kame/architecture_iOS/tree/feature/MVC)

**投票結果(合計21票)**
- 問題ないと思う(19%)
- 許容範囲と思う(14.3%)
- 問題があると思う(0%)
- 回答だけみたい(66.7%)

[twitter投票結果ページ](https://twitter.com/854729/status/1249711200151040000)

## [MVP](https://github.com/sachiko-kame/architecture_iOS/tree/feature/MVP)

**投票結果(合計12票)**
- 問題ないと思う(8.3%)
- 許容範囲と思う(33.3%)
- 問題があると思う(0%)
- 回答だけみたい(58.3%)

※MVPの時は投票10票、投票12票後にコード記述修正しています。🙇‍♀️<br>
結果に大差はなさそうなので最終結果のみ記載しています。<br>

[twitter投票結果ページ](https://twitter.com/854729/status/1251014938941722624)

**リファクタリングして頂いたコード**<br>
[uhooi/architecture_iOS](https://github.com/uhooi/architecture_iOS/tree/feature/fix_mvp)

## [MVVM](https://github.com/sachiko-kame/architecture_iOS/tree/feature/MVVM)

**投票結果(合計票)**
- 問題ないと思う(%)
- 許容範囲と思う(%)
- 問題があると思う(%)
- 回答だけみたい(%)

## [VIPER(おまけ)](https://github.com/sachiko-kame/architecture_iOS/tree/feature/VIPER)

**投票予定なし**

# [ZenHub](https://github.com/sachiko-kame/architecture_iOS/labels#workspaces/improvement-plan-5e99713e92d4be70c1e29ede/board?repos=255258678)

# [wiki](https://github.com/sachiko-kame/architecture_iOS/wiki)

# 参考
https://peaks.cc/books/iOS_architecture
