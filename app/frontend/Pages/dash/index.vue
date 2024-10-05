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
  <div class="px-3.75 relative before:content-[''] before:block before:h-35 before:bg-bs-purple before:absolute before:left-0 before:top-0 before:right-0">
    <div class="bg-bs-white shadow-bs-1 rounded-lg-2 pt-5 pb-7.5 px-6 relative z-1 flex flex-wrap">
      <header class="flex-t-2 max-w-full text-xl border-b border-b-['#ddd'] mb-5 pb-4.5">
        Resumo dos lançamentos
      </header>
      <div class="w-full flex gap-3.5 flex-wrap">
        <div v-for="(card, k) in cards" class="flex-t-3 max-w-1/4" :key="k" @click="goTo(card)" :class="{'hover:shadow-bs-1 cursor-pointer ':card.tipo}">
          <div class="shadow-bs-2 flex flex-wrap flex-1 rounded-lg p-3.75 transition-all duration-100">
            <span class="flex justify-between items-center w-full mb-2.5 text-bs-gray-600">{{ card.title }} <i v-if="card.tipo" class="fa-solid fa-chevron-right"></i> </span>
            <span class="flex justify-between items-center w-full">{{ $formatCurrency(card.total) }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>