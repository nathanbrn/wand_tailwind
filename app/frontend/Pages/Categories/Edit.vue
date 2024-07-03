<template>
  <form-fin :category="category"></form-fin>
</template>
<script setup>
  import FormFin from './Form.vue'
  const props = defineProps({
    category: Array
  })
</script>