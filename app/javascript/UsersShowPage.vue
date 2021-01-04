<template>
<div>
  <div class="alert alert-success" role="alert" v-if="show">編集完了</div>
  <div v-if="errors.length != 0" id="error_explanation" class="border-bottom">
    <div class="alert alert-danger">
      エラーが{{ errors.length }}つ発生しました。
    </div>
    <ul v-for="e in errors" :key="e">
      <li>{{ e }}</li>
    </ul>
  </div>

  <div class="m-2">
    <div><strong>プロフィール</strong></div>
    <div class="mx-1">
      <div class="d-flex mt-3">
        <img :src="user.avatar" class="avatar rounded-circle" />
        <div class="align-top ml-2">{{ user.name }}</div>
      </div>
      <div class="input-group mt-3">
        <textarea readonly="readonly" placeholder="具体的な目標を記入しよう！" class="form-control rounded" style="cursor: pointer;" cols="40" rows="3" v-model="user.target_comment"></textarea>
      </div>
      <div id="followInformation" class="d-flex mt-1">
        <h5><div class="badge-costom badge badge-pill badge-primary">フォロー（{{ user.following_count }}）</div></h5>
        <h5><div class="badge-costom badge badge-pill badge-primary ml-1">フォロワー（{{ user.followers_count }}）</div></h5>
        <h5><div class="badge-costom badge badge-pill badge-primary ml-1">本棚（{{ user.books_count }}）</div></h5>
      </div>
    </div>
  </div>

  <hr class="mb-1">

  <div class="m-2">
    <div><strong>自己紹介</strong></div>
    <p v-if="user.introduction !== null" class="text-justify mt-3 ml-2 mr-3">
      {{ user.introduction }}
    </p>
    <p v-else class="text-justify mt-3 ml-2 text-muted">
      自己紹介をしよう！
    </p>
  </div>

  <hr class="mb-1">

  <div class="m-2">
    <div><strong>目標ジャンル</strong></div>
    <div class="mt-3 ml-2">
      <i class='fab fa-font-awesome-flag text-primary'></i>
      {{ user.target }}
      <strong v-if="user.target == '大学受験合格'" class="ml-2">
        {{ user.my_choice_university }}
      </strong>
    </div>
  </div>

  <hr class="mb-1">

  <div class="m-2 mb-4">
    <div class="d-flex justify-content-between">
      <div><strong>基本情報</strong></div>
      <a class="mr-2 text-primary" style="cursor: pointer;" @click="showModal('basicInformationEditModal')">編集</a>
    </div>
    <div class="mt-3 ml-2">
      <div class="d-flex mb-1">
        <div class="mr-3" style="width: 64px;">ユーザ名</div>
        {{ user.name }}
      </div>
      <div class="d-flex mb-1">
        <div class="mr-3" style="width: 64px;">性別</div> 
        {{ user.sex }}
      </div>
      <div class="d-flex mb-1">
        <div class="mr-3" style="width: 64px;">年齢</div>
        {{ user.age }}
      </div>
      <div class="d-flex mb-1">
        <div class="mr-3" style="width: 64px;">住まい</div>
        {{ user.live }}
      </div>
      <div class="d-flex mb-1">
        <div class="mr-3" style="width: 64px;">職業</div>
        {{ user.job }}
      </div>
    </div>
  </div>

  <BasicInformationEditModal :user="user"></BasicInformationEditModal>
</div>
</template>

<script>
import axios from 'axios';
import 'bootstrap/js/src/modal';
import BasicInformationEditModal from 'BasicInformationEditModal.vue';

export default {
  components: { BasicInformationEditModal },
  data: function () {
    return {
      user: {},
      show: false,
      errors: ''
    }
  },
  mounted () {
    axios
      .get(`/api/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  },
  methods: {
    showModal: function(modalName) {
      $(`#${modalName}`).modal("show");
    }
  }
}
</script>

<style scoped>
/* p {
  font-size: 2em;
  text-align: center;
} */
</style>