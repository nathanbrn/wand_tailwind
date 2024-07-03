<template>
  <div class="card mt-5">
    <div class="card-body">
      <h5 class="card-title">{{ form.id ? `Editar categoria` : `Nova categoria` }}</h5>
      <Message v-if="form.hasErrors" :items="form.errors" className="alert-danger"/>
      <form @submit.prevent="form[form.id ? 'patch':'post'](`/categories${form.id ? '/'+form.id:''}`)">
        <div class="mb-3">
          <label>Nome:</label>
          <input type="text" class="form-control" v-model="form.name" />
        </div>
        <div class="col-12 mt-3">
          <button type="submit" class="btn btn-fin-default">Salvar</button>
        </div>
      </form>
    </div>
  </div>
</template>
<script>

import { useForm } from '@inertiajs/vue3'
import Message from '../../Shared/Message.vue';

export default {
  props: {
    category: Object,
  },
  components:{ Message },
  setup(props) {
    const form = useForm({ ...props.category });
    return { form };
  },
};
</script>
