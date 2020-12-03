class TargetCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '資格取得' }, { id: 2, name: 'スキルアップ' }, { id: 3, name: 'TOEIC・TOEFL・英会話' },
    { id: 4, name: '外国語習得' }, { id: 5, name: '読書・趣味・教養' }, { id: 6, name: '学問' },
    { id: 7, name: '専門学校進学' }, { id: 8, name: '大学受験合格' }
  ]
end