import { createRouter, createWebHashHistory, RouteRecordRaw } from "vue-router";
import VHome from "@/views/VHome.vue";

const routes: Array<RouteRecordRaw> = [{ path: "/", name: "VHome", component: VHome }];

export default createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes,
});
