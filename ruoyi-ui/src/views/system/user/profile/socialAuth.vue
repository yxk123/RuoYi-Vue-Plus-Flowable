<template>
  <div>
    <el-table :data="listSocial" border style="width: 100%">
      <el-table-column prop="username" align="center" label="用户名">
      </el-table-column>
      <el-table-column prop="nickname" align="center" label="用户名称">
      </el-table-column>
      <el-table-column label="头像" align="center" prop="url">
        <template slot-scope="scope">
          <ImagePreview :width="60" :height="60" :src="scope.row.avatar" />
        </template>
      </el-table-column>
      <el-table-column prop="source" align="center" label="授权平台">
      </el-table-column>
      <el-table-column label="绑定时间" align="center">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button size="mini" type="danger" icon="el-icon-delete" @click="handleDelSocialUser(scope.row)"
            v-hasPermi="['system:socialUser:remove']">解除绑定</el-button>
        </template>
      </el-table-column>
    </el-table>
    <div style="font-size: 30px; float: right">
      <el-tooltip effect="dark" content="绑定gitee" placement="top">
        <svg-icon icon-class="gitee" class="icon" @click="handleSocialLogin('gitee')" />
      </el-tooltip>
      <el-tooltip effect="dark" content="绑定github" placement="top">
        <svg-icon icon-class="github" class="icon" @click="handleSocialLogin('github')" />
      </el-tooltip>
      <el-tooltip effect="dark" content="绑定QQ" placement="top">
        <svg-icon icon-class="qq" class="icon" @click="handleSocialLogin('qq')" />
      </el-tooltip>
      <el-tooltip effect="dark" content="绑定微信" placement="top">
        <svg-icon icon-class="wechat" class="icon" @click="handleSocialLogin('wechat_open')" />
      </el-tooltip>
    </div>
  </div>
</template>

<script>
import { listSocialUser, delSocialUser } from "@/api/system/socialUser";
import { renderAuth } from "@/api/login";

export default {
  data () {
    return {
      listSocial: [],
    };
  },
  created () {
    this.getList();
  },
  methods: {
    getList () {
      listSocialUser(null).then((response) => {
        this.listSocial = response.data;
      });
    },
    handleSocialLogin (source) {
      renderAuth(source).then((response) => {
        window.location.href = response.data;
      });
    },
    handleDelSocialUser (row) {
      this.$modal
        .confirm("是否解除【" + row.source + "】账号绑定？")
        .then(() => {
          return delSocialUser(row.id);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("解除成功！");
        });
    },
    close () {
      this.$tab.closePage();
    },
  },
};
</script>
<style scoped>
.icon {
  padding: 5px;
  cursor: pointer;
}
</style>
