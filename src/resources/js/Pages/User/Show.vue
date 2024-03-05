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
    defineProps({ users: Array, layout: Layout })
</script>

<Head title="Your page title test" />
<template>
    <!--<Layout>
        <Head title="Welcome" />
        <h1>Welcome</h1>
        -<p>Hello {{ user.id }}, welcome to your first Inertia app!</p>
    </Layout> -->
    <div>
        <div>{{$page.props}}</div>

        <h1>Welcome to User Page</h1>
        <div v-for="(user, index) in users">
            <div>{{user}}</div>
            <div>{{user.id}}</div>
        </div>
        <!-- Добавьте дополнительный контент здесь -->
    </div>
</template>
