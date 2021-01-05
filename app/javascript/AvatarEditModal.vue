<template>
  <form @submit.prevent="updateUser">
    <div class="modal fade" id="avatarEditModal" tabindex="-1" role="dialog" aria-labelledby="avatarEditModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">編集</h5>
          </div>
          <div class="modal-body">
            <input id="userAvatar" class="form-control-file" type="file" @change="selectedFile">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
            <button v-if="submitBtn" type="submit" class="btn btn-primary">保存</button>
          </div>
        </div>
      </div>
    </div>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      file: null,
      submitBtn: false
    }
  },
  props: ['user'],
  methods: {
    selectedFile: function (e) {
      this.submitBtn = true;
      let files = e.target.files;
      this.file = files[0];
    },
    updateUser: function() {
      let formData = new FormData();
      formData.append('user[avatar]', this.file);
      let config = { headers: { 'content-type': 'multipart/form-data' } };
      $('#avatarEditModal').modal('hide');
      this.submitBtn = false;
      axios
        .patch(`/api/users/${this.$route.params.id}`, formData, config)
        .then(response => {
          this.user.avatar = response.data.user.avatar;
          $("#userAvatar").val('');
          this.$parent.errors = '';
          this.$parent.flashMessage = true;
          setTimeout(() => { this.$parent.flashMessage = false}, 4000);
        })
        .catch(error => {
          if (error.response.data && error.response.data.errors) {
          this.$parent.errors = error.response.data.errors;
        }
        })
    }
  }
}
</script>

<style scoped>
</style>