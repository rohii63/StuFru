<template>
  <div>
    <form @submit.prevent="updateUser" @change="showSubmitBtn">
      <div class="modal fade" id="basicInformationEditModal" tabindex="-1" role="dialog" aria-labelledby="basicInformationEditModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">編集</h5>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label class="mb-1">ユーザー名</label>
                <div>
                  <input v-model="user.name" type="text">
                </div>
              </div>
              <div class="form-group">
                <label class="mb-1">性別</label>
                <div>
                  <select v-model="user.sex">
                    <option value=""></option>
                    <option>男</option>
                    <option>女</option>
                    <option>その他</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="mb-1">年齢</label>
                <div>
                  <select v-model="user.age">
                    <option value=""></option>
                    <option v-for="(item,index) in ages" v-bind:value="item" :key="index">{{item}}</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="mb-1">住まい</label>
                <div>
                  <select v-model="user.live">
                    <option value=""></option>
                    <option v-for="(item,index) in lives" v-bind:value="item" :key="index">{{item}}</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="mb-1">職業</label>
                <div>
                  <select v-model="user.job">
                    <option value=""></option>
                    <option v-for="(item,index) in jobs" v-bind:value="item" :key="index">{{item}}</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
              <button v-if="show" type="submit" class="btn btn-primary">保存</button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function() {
    return {
      ages: [...Array(100).keys()].map(i => ++i),
      lives: ['北海道', '青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県', '茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '東京都', '神奈川県', '新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県', '三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県', '鳥取県', '島根県', '岡山県', '広島県', '山口県', '徳島県', '香川県', '愛媛県', '高知県', '福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県'],
      jobs: ['中学１年生', '中学２年生', '中学３年生', '高校１年生', '高校２年生', '高校３年生', '浪人生', '大学１年生', '大学２年生', '大学３年生', '大学４年生', '大学院生', '専門学校生', '社会人'],
      show: false
    }
  },
  props: ["user"],
  methods: {
    showSubmitBtn: function() { this.show = true },
    updateUser: function() {
      $("#basicInformationEditModal").modal("hide");
      this.show = false;
      axios
        .patch(`/api/users/${this.user.id}`, { user: {
          name: this.user.name,
          sex: this.user.sex,
          age: this.user.age,
          live: this.user.live,
          job: this.user.job  } } )
        .then(() => { 
          this.$parent.errors = '';
          this.$parent.show = true;
          setTimeout(() => { this.$parent.show = false}, 3000);
          })
        .catch(error => {
          if (error.response.data && error.response.data.errors) {
            this.$parent.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>