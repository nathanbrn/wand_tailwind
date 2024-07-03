<template>
  <div class="alert" :class="className">
    <ul>
      <li v-for="(msg, k) in items" :key="k">
        {{ msg }}
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  props:{
    items:Array,
    className: String
  }
}
</script>