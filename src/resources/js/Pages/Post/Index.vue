<script>
import Layout from "../../Layouts/Layout.vue";
import { Head } from '@inertiajs/vue3'

export default {
    // Using a render function...
   // layout: (h, page) => h(Layout, [page]),
    layout: [Layout],
}


</script>

<script setup>
    import Layout from "../../Layouts/Layout.vue";
    import ListPosts from "./components/ListPosts.vue";
    defineProps({ posts: Array, layout: Layout })
</script>

<Head title="Your page title test" />
<template>
    <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-body-tertiary">
        <div>
            <ListPosts :posts=posts></ListPosts>
        </div>
    </div>




</template>
