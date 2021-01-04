<template>
  <form @submit.prevent="updateUser">
    <div class="modal fade" id="targetEditModal" tabindex="-1" role="dialog" aria-labelledby="targetEditModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog modal-dialog-centered-scrollable" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">目標ジャンル</h5>
          </div>
          <div class="modal-body">
            <div class="pos-f-t" v-for="(navName, pointer) in navbars" :key="pointer">
              <nav class="navbar navbar-white bg-white px-0">
                <button class="navbar-toggler" type="button" data-toggle="collapse" :data-target="forCollapse(pointer)">
                  <span><i class="fas fa-bars mr-2"></i>{{ navName }}</span>
                </button>
              </nav>
              <div class="collapse" :id="collapse(pointer)">
                <div class="bg-white mx-2 py-1 px-2">
                  <div v-for="target in targets" :key="target.id">
                    <div class="form-check" v-if="target.target_category_id == pointer">
                      <input class="form-check-input" type="radio" name="user-target" :value="target.content" v-model="user.target">
                      <label class="form-check-label">{{ target.content }}</label>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
            <button type="submit" class="btn btn-primary">保存</button>
          </div>
        </div>
      </div>
    </div>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data: function() {
    return {
      forCollapse: function(pointer) { return `#collapse${pointer}` },
      collapse: function(pointer) { return `collapse${pointer}` }
    }
  },
  props: ['user', 'targets', 'navbars'],
  methods: {
    updateUser: function() {
      $('#targetEditModal').modal('hide');
      axios
        .patch(`/api/users/${this.$route.params.id}`, { user: { target: this.user.target  } } )
        .then(() => { 
          this.$parent.errors = '';
          this.$parent.flashMessage = true;
          setTimeout(() => { this.$parent.flashMessage = false}, 3000);
        });
    }
  }
}
</script>

<style scoped>
</style>