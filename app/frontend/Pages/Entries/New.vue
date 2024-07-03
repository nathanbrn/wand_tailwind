<template>
  <form-fin :entry="entry" :categories="categories"></form-fin>
</template>
<script setup>
  import FormFin from './Form.vue'
  const props = defineProps({
    entry: Object,
    categories: Array
  })
</script>
