<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
        </tr>
        <tr v-for="user in users" :key="user.id">
          <td><router-link :to="{ name: 'UsersShowPage', params: { id: user.id } }">{{ user.id }}</router-link></td>
          <td>{{ user.id }}</td>
          <td>{{ user.name }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      users: []
    }
  },
  mounted () {
    axios
      .get('/api/users.json')
      .then(response => (this.users = response.data))
  }
}
</script>

<style scoped>
/* p {
  font-size: 2em;
  text-align: center;
} */
</style>