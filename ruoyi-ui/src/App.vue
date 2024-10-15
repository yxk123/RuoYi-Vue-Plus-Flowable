<template>
  <div id="app">
    <router-view />
    <theme-picker />
  </div>
</template>

<script>
import ThemePicker from "@/components/ThemePicker";
import { initWebSocket } from '@/utils/websocket';
import router from './router'
export default {
  name: "App",
  components: { ThemePicker },
    metaInfo() {
        return {
            title: this.$store.state.settings.dynamicTitle && this.$store.state.settings.title,
            titleTemplate: title => {
                return title ? `${title} - ${process.env.VUE_APP_TITLE}` : process.env.VUE_APP_TITLE
            }
        }
    },
    data () {
      return {
        socketUrl: "", // socket地址
        websocket: null, // websocket 实例
        heartTime: null, // 心跳定时器实例
        socketHeart: 0, // 心跳次数
        HeartTimeOut: 10000, // 心跳超时时间 10000 = 10s
        lsocketError: 0 // 错误次数
      };
    },
    mounted () {
      if(window.location.pathname != '/login' && window.location.pathname != '/register' && window.location.pathname != '/' && window.location.pathname != '/index'){
        initWebSocket("ws://" + window.location.host + process.env.VUE_APP_BASE_API + "/resource/websocket");
      }
    }
};
</script>
<style scoped>
#app .theme-picker {
  display: none;
}
</style>
