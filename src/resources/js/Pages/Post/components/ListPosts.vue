

<template>
    <div class="col-md-6 p-lg-5 mx-auto my-5">
        <h2 class="display-3 fw-bold">My opinion</h2>
        <h3 class="fw-normal text-muted mb-3">Совсем не объектинвые мысли о...</h3>
        <div class="d-flex gap-3 justify-content-center lead fw-normal">
            <a class="icon-link" href="#">
                Mix
                <svg class="bi"><use xlink:href="#chevron-right"/></svg>
            </a>
            <a class="icon-link" href="#">
                Movies
                <svg class="bi"><use xlink:href="#chevron-right"/></svg>
            </a>
            <a class="icon-link" href="#">
                Games
                <svg class="bi"><use xlink:href="#chevron-right"/></svg>
            </a>
        </div>
    </div>

    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>

    <div class="row justify-content-center flex-md-equal w-100 my-md-3 ps-md-3">

                <Post v-for="(post, index) in posts"
                    :post="post"
                    :boostrapBackgroundColor="boostrapBackgroundColors[index] ? boostrapBackgroundColors[index] : boostrapDefaultColor"
                    :boostrapDefaultColor="boostrapDefaultColor"
                ></Post>
        </div>

</template>


<script>
import Post from "./Post.vue";
export default {
    name: 'ListPosts', // Имя компонента

    props: {
        posts: Array
    },

    components: {
        Post
    },

    setup() {
        console.log('setup')
        const boostrapBackgroundColors = [
            'text-bg-dark',
            'bg-body-tertiary',
            'bg-body-tertiary',
            'text-bg-dark',
        ];

        const boostrapDefaultColor = 'bg-body-tertiary'
        console.log('boostrapBackgroundColors:', boostrapBackgroundColors);

        // Возвращаемые значения из setup
        return {
            boostrapBackgroundColors,
            boostrapDefaultColor
        };
    },
};
</script>

<style scoped>

</style>
