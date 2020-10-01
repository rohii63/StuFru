<template>
      <div>
        <!-- object value -->
          <model-select :options="options"
                                placeholder="select item">
          </model-select>

        <!-- string value -->
          <model-select :options="options2"
                                v-model="item2"
                                placeholder="select item2">
          </model-select>
      </div>
</template>

<script>
  import { ModelSelect } from 'vue-search-select'
  import axios from 'axios';

  export default {
    data () {
      return {
        options: [],
        item: {
          value: '',
          text: ''
        },
        options2: [
          { value: '1', text: 'aa' + ' - ' + '1' },
          { value: '2', text: 'ab' + ' - ' + '2' },
          { value: '3', text: 'bc' + ' - ' + '3' },
          { value: '4', text: 'cd' + ' - ' + '4' },
          { value: '5', text: 'de' + ' - ' + '5' }
        ],
        item2: ''
      }
    },
    mounted () {
      axios
        .get('/api/universities')
        .then(response => (this.options = response.data))
      },
    methods: {
      reset () {
        this.item = {}
      },
      selectFromParentComponent1 () {
        // select option from parent component
        this.item = this.options[0]
      },
      reset2 () {
        this.item2 = ''
      },
      selectFromParentComponent2 () {
        // select option from parent component
        this.item2 = this.options2[0].value
      }
    },
    components: {
      ModelSelect
    }
  }
</script> 