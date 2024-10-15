<template>
  <div>
    <el-badge :value="messageTotle" :max="99">
      <el-popover placement="right" width="400" trigger="click">
        <div>
          <el-card class="box-card">
            <div class="read">
              <div><i class="el-icon-message-solid icon"></i></div>
              <div><el-link :underline="false" :disabled="!messageList.length > 0" @click="readAll()">知道了</el-link></div>
            </div>
            <div class="content" v-for="(v, k) in messageList" :key="k">
                <div class="title" @click="readMessage(v, k)">
                    <span><i class="el-icon-message icon-title"></i>{{ v.title}}</span>
                    <span>{{ parseTime(v.createTime) }}</span>
                </div>
                <div style="cursor: pointer;" @click="readMessage(v,k)">
                    <span style="font-size: 12px;">{{ v.messageContent }}</span>
                </div>
            </div>
            <div class="view"><el-link @click="clickMessage()">查看更多消息</el-link></div>
          </el-card>
        </div>
        <svg-icon slot="reference" icon-class="message" />
      </el-popover>
    </el-badge>
  </div>
</template>

<script>
import store from '@/store'
export default {
  name: 'RuoYiMsg',
  data () {
    return {
    }
  },
  computed: {
    messageList:{
        get() { 
            if (store.state.notice.notices !== null && typeof store.state.notice.notices !== 'undefined') {
                return store.state.notice.notices;
            } else {
                return [];
            }
        },
        set(newValue) {
            this.messageList = newValue;
        }
    },
    messageTotle () {
      if (store.state.notice.notices.length !== null && typeof store.state.notice.notices.length !== 'undefined') {
        return store.state.notice.notices.length;
      } else {
        return 0;
      }
    }
  },
  methods: {
    //点击消息，写入已读
    readMessage (data,index) {
      store.state.notice.notices.splice(index,1);
      store.dispatch('readMessage',data.id)
    },
    readAll () {
      if(this.messageList && this.messageList.length > 0){
        this.messageList.forEach(e => {
          e.readTime = new Date();
        });
      }
      store.state.notice.notices = [];
      store.dispatch('readAll')
    },
    //查看更多消息
    clickMessage(){
      this.$router.push("/user/profile");
    }
  }
}
</script>
<style lang="scss" scoped>

.icon {
  font-size: 20px;
  vertical-align: middle;
  padding-right: 2px;
}
.icon-title{
  font-size: 20px;
  vertical-align: middle;
  padding-right: 2px;
  margin-top: -2px;
}
.read {
  display: flex;
  justify-content: space-between;
  padding: 0px 0px 5px 0px;
  border-bottom: 1px solid #ccc;
}

.title {
  display: flex;
  justify-content: space-between;
  font-size: 13px;
  color: #000;
  font-weight: bolder;
  padding: 0px 0px 10px 0px;
  margin: 0px 0px 0px 0px;
}
.content {
  cursor: pointer;
  padding: 8px 0px 8px 0px;
  border-bottom: 1px solid #ccc;
}
.view {
  text-align: right;
  padding: 8px 0px 0px 0px;
}
::v-deep .el-badge__content.is-fixed {
  margin-top: 7px;
}
</style>
