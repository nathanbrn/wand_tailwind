<template>
  <div class="card mt-5">
    <div class="card-body">
      <div class="d-flex justify-content-between mb-3 border-bottom pb-2 align-items-center">
        <h5 class="card-title">Categorias</h5>
        <span>
          <Link :href="`/categories/new`" class="btn btn-dark">Nova</Link>
        </span>
      </div>
      <table class="table">
        <tbody>
          <tr v-for="category in categories" :key="category.id">
            <td>{{ category.name }}</td>
            <td class="text-end">
              <div class="btn-group">
                <Link :href="`/categories/${category.id}/edit`" class="btn text-bs-white bg-bs-purple hover:bg-bs-indigo hover:text-bs-white btn-sm" >Editar</Link>
                <Link :href="`/categories/${category.id}`" class="btn btn-danger btn-sm" method="delete" as="button">Excluir</Link>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import { Head, Link } from '@inertiajs/vue3';

  export default {
    props: {
      categories: Array,
    },
    components: {
      Head,
      Link
    },
  };
  </script>