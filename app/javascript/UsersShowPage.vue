<template>
<div>
  <div class="alert alert-success" role="alert" v-if="flashMessage">編集完了</div>
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
        <a style="cursor: pointer;" @click="showModal('avatarEditModal')">
          <img :src="user.avatar" class="avatar rounded-circle" />
        </a>
        <div class="align-top ml-2">{{ user.name }}</div>
      </div>
      <div class="input-group mt-3">
        <a style="cursor: pointer;" @click="showModal('targetCommentEditModal')">
          <textarea readonly="readonly" placeholder="具体的な目標を記入しよう！" class="form-control rounded" style="cursor: pointer;" cols="40" rows="3" v-model="user.target_comment"></textarea>
        </a>
      </div>
      <div id="followInformation" class="d-flex mt-1">
        <a :href="followingPath"><h5><div class="badge-costom badge badge-pill badge-primary">フォロー（{{ user.following_count }}）</div></h5></a>
        <a :href="followersPath"><h5><div class="badge-costom badge badge-pill badge-primary ml-1">フォロワー（{{ user.followers_count }}）</div></h5></a>
        <a :href="shelfPath"><h5><div class="badge-costom badge badge-pill badge-primary ml-1">本棚（{{ user.books_count }}）</div></h5></a>
      </div>
    </div>
  </div>

  <hr class="mb-1">

  <div class="m-2">
    <div class="d-flex justify-content-between">
      <div><strong>自己紹介</strong></div>
      <a class="mr-2 text-primary" style="cursor: pointer;" @click="showModal('introductionEditModal')">編集</a>
    </div>
    <p v-if="user.introduction == ''" class="text-justify mt-3 ml-2 text-muted">
      自己紹介をしよう！
    </p>
    <p v-else class="text-justify mt-3 ml-2 mr-3">
      {{ user.introduction }}
    </p>
  </div>

  <hr class="mb-1">

  <div class="m-2">
    <div class="d-flex justify-content-between">
      <div><strong>目標ジャンル</strong></div>
      <a class="mr-2 text-primary" style="cursor: pointer;" @click="showModal('targetEditModal')">編集</a>
    </div>
    <div class="mt-3 ml-2">
      <i class="fab fa-font-awesome-flag text-primary"></i>
      {{ user.target }}
      <strong v-if="user.target == '大学受験合格'" class="ml-2">
        {{ user.my_choice_university }}
        <a v-if="user.my_choice_university == ''" class="text-primary" href="/search/universities">大学一覧</a>
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

  <AvatarEditModal :user="user"></AvatarEditModal>
  <TargetCommentEditModal :user="user"></TargetCommentEditModal>
  <IntroductionEditModal :user="user"></IntroductionEditModal>
  <TargetEditModal :user="user" :navbars="navbars" :targets="targets"></TargetEditModal>
  <BasicInformationEditModal :user="user"></BasicInformationEditModal>
</div>
</template>

<script>
import axios from 'axios';
import 'bootstrap/js/src/modal';
import AvatarEditModal from 'AvatarEditModal.vue';
import TargetCommentEditModal from 'TargetCommentEditModal.vue';
import IntroductionEditModal from 'IntroductionEditModal.vue';
import TargetEditModal from 'TargetEditModal.vue';
import BasicInformationEditModal from 'BasicInformationEditModal.vue';

export default {
  components: { AvatarEditModal ,TargetCommentEditModal, IntroductionEditModal, TargetEditModal, BasicInformationEditModal },
  data: function() {
    return {
      user: {},
      flashMessage: false,
      errors: '',
      followingPath: `/users/${this.$route.params.id}/follow?key=following`,
      followersPath: `/users/${this.$route.params.id}/follow?key=followers`,
      shelfPath: `/users/${this.$route.params.id}/books`,
      navbars: {},
      targets: []
    }
  },
  mounted: function() {
    axios
      .get(`/api/users/${this.$route.params.id}`)
      .then(response => {
        this.user = response.data.user
        this.navbars = response.data.navbars
        this.targets = response.data.targets
        })
  },
  methods: {
    showModal: function(modalName) {
      $(`#${modalName}`).modal('show');
    }
  }
}
</script>

<style scoped>
</style>