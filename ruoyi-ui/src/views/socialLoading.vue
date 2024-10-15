<template>
  <div
    v-loading="loading"
    element-loading-text="拼命加载中..."
    element-loading-background="rgba(0, 0, 0, 0.8)"
    element-loading-spinner="el-icon-loading"
    style="height: 100%"
  ></div>
</template>

<script>
import { socialLogin } from "@/api/login";
import { setToken } from "@/utils/auth";
export default {
  data() {
    return {
      loading: false,
    };
  },
  created() {
    this.loading = true;
    const query = this.$route.query;
    socialLogin(query, query.source).then((res) => {
      if (res.code === 200) {
        if (res.data.result !== 2000) {
          if (res.data.path == "/user/profile") {
            this.$modal.msgError(res.data.result);
            this.$router.push(res.data.path);
          } else {
            this.$modal.msgError(res.data.result);
            this.$router.push("/login");
          }
        } else {
          if (res.data.path == "/") {
            setToken(res.data.token);
            this.loading = false;
            this.$router.push(res.data.path);
          } else {
            this.loading = false;
            this.$modal.msgSuccess("绑定成功！");
            this.$router.push(res.data.path);
          }
        }
      }
    });
  },
};
</script>