<script>
  import { Head, Link } from '@inertiajs/vue3';

  export default {
    props: {
      entries: Array,
      tipo: String
    },
    components: {
      Head,
      Link
    }
  };
</script>

<template>
  <Head>
    <title>{{ tipo == '1' ? 'Receitas' : 'Despesas' }}</title>
  </Head>
  <div class="card mt-5">
    <div class="card-body">
      <div class="d-flex justify-content-between mb-3 border-bottom pb-2 align-items-center">
        <h5 class="card-title">{{ tipo == '1' ? 'Receitas' : 'Despesas' }}</h5>
        <span>
          <Link :href="`/entries/new?tipo=${tipo}`" class="btn btn-dark">Nova</Link>
        </span>
      </div>
      <table class="table">
        <thead>
          <tr>
            <th>Descrição</th>
            <th>Valor</th>
            <th class="text-center">Status</th>
            <th class="text-center">Categoria</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="entry in entries" :key="entry.id">
            <td>{{ entry.description }}</td>
            <td>{{ $formatCurrency(entry.amount) }}</td>
            <td class="text-center">
              <span :class="entry.status == 't' ? 'text-success': 'text-danger' "><i class="fa-solid fa-check"></i></span>
            </td>
            <td class="text-center">
              {{ entry?.category?.name }}
            </td>
            <td class="text-end">
              <div class="btn-group">
                <Link :href="`/entries/${entry.id}/edit`" class="btn btn-fin-default btn-sm" >Editar</Link>
                <Link :href="`/entries/${entry.id}`" class="btn btn-danger btn-sm" method="delete" as="button">Excluir</Link>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>