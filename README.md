## SwiftUI/SwiftDataによるシンプルなTODOアプリ
### 機能
- 一覧取得
- 追加
- 編集
- 削除
### レイヤードアーキテクチャによる構成
- Presentation層（UI、画面遷移）
  - TodoListView（やることリスト画面）
  - TodoEditView（やることの追加・編集画面）
- Application層（UIとデータの橋渡し）
  - TodoListViewModel（TodoListViewの状態管理）
  - TodoEditViewModel （TodoEditViewの状態管理）
- Domain層（疎結合なデータ層。どの層にも依存しない）
  - Entity（汎用的なデータモデル）
  - Repository（汎用的なデータ管理）
- Infrastructure層（実際に取り扱う形式（今回はSwiftData）に応じた実装）
  - Entity
    - SwiftDataTodo（SwiftData用のデータ操作）
  - Repository
    - SwiftDataRepository（SwiftData用のデータ操作）

### 補足
規模の大きいアプリViewModelとRepositoryの間にUseCase等の層を追加しても良い
