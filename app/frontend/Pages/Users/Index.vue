<template>
  <div class="flex items-center justify-center border border-black">
    <header class="text-xl font-bold">Usuários</header>
    <main>
      <ul>
        <li v-for="user in users" :key="user.id">
          <span>{{ user.name }}</span>
        </li>
      </ul>
    </main>
  </div>
</template>

<script>
  export default {
    props: {
      users: Array,
    },
  }
</script>