<template>
  <div class="card mt-5">
    <div class="card-body">
      <div v-if="!form.entry_type">
        <select v-model="form.entry_type" class="form-control">
          <option :value="null">Selecione o tipo</option>
          <option value="1">Receita</option>
          <option value="2">Despesa</option>
        </select>
      </div>
      <template v-if="form.entry_type">
        <h5 class="card-title">{{ form.id ? `Editar ${titleCard}` : `Nova ${titleCard}` }}</h5>
        <Message v-if="form.hasErrors" :items="form.errors" className="alert-danger"/>
        <form @submit.prevent="form[form.id ? 'put' : 'post'](form.id ? '/entries/'+form.id:'/entries')">
          <div class="row">
            <div class="col-4 mb-3">
              <label>Valor:</label>
              <input class="form-control" step="any" min="0" type="number" v-model="form.amount" />
            </div>
            <div class="col-4 d-flex align-items-center">
              <div class="form-check form-switch mt-1">
                <input class="form-check-input" type="checkbox" true-value="t" false-value="f" role="switch" id="status" v-model="form.status">
                <label class="form-check-label" for="status">{{ form.entry_type =='1' ? 'Recebida' : 'Foi paga' }}</label>
              </div>
            </div>
            <div class="form-group col-12 mb-3">
              <label>Descrição:</label>
              <input class="form-control" type="text" v-model="form.description" />
            </div>
            <div class="col-4 mb-3">
              <label>Categoria:</label>
              <select v-model="form.category_id" class="form-control">
                <option :value="null">Selecione</option>
                <option v-for="category in categories" :key="category.id" :value="category.id">
                  {{ category.name }}
                </option>
              </select>
            </div>
            <div class="col-12 mt-3">
              <button type="submit" class="btn btn-fin-default" :disabled="form.processing">
                {{ form.processing ? 'Enviando...' : 'Salvar' }}
              </button>
            </div>
          </div>
        </form>
      </template>
    </div>
  </div>
</template>

<script>
import { useForm } from '@inertiajs/vue3'
import Message from '../../Shared/Message.vue';

export default {
  components: { Message },
  props: {
    entry: Object,
    categories: Array
  },
  computed:{
    titleCard(){
      return this.form.entry_type == '1' ? 'receita' : 'despesa'
    }
  },
  setup(props) {
    const query = Object.fromEntries(new URLSearchParams(location.search))
    const form = useForm({ ...props.entry });
    if(query.tipo){
      form.entry_type = query.tipo
    }

    return { form };
  },
};
</script>
