<script>
import { Head, Link, router } from '@inertiajs/vue3';
import { ref } from 'vue'
export default {
  props: {
    resumo: Array,
  },
  components: {
    Head,
    Link
  },
  methods:{
    goTo(card){
      if(card.tipo){
        router.visit('/entries?tipo='+card.tipo)
      }
    }
  },
  setup(props) {
    const cards=ref([
      {title:'Receita' , total:props.resumo.receita, tipo:1 },
      {title:'Despesas' , total:props.resumo.despesa, tipo:2 },
      {title:'Pendente' , total:props.resumo.pendente},
      {title:'Pago' , total:props.resumo.despesa - props.resumo.pendente},
    ])

    return { cards };
  },
};
</script>
<template>
  <div class="top-dash">
    <div class="content-cards-info">
      <header>
        Resumo dos lançamentos
      </header>
      <div class="wrapper-card-resume d-flex">
        <div v-for="(card, k) in cards" class="card-resume" :key="k" @click="goTo(card)" :class="{'link-listagem':card.tipo}">
          <div class="box-resumo">
            <span>{{ card.title }} <i v-if="card.tipo" class="fa-solid fa-chevron-right"></i> </span>
            <span>{{ $formatCurrency(card.total) }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>