<template>
    <el-dialog :title="title" :visible.sync="visible" @close="visible = false"  :width="width" append-to-body v-dialogDrag :close-on-click-modal="false">
      <div :style="[{height:`${height}px`}]" class="styleObj">
        <template>
          <i-frame :src="url" />
        </template>
      </div>
    </el-dialog>
  </template>
  <script>
  import iFrame from "@/components/iFrame/index";
  import { Base64 } from "./base64.min.js";
  export default {
    props: {
        //宽
        width: {
          type: String,
          default: '60%',
        },
        //高
        height: {
          type: Number,
          default: 500,
        },
        //标题
        title: {
          type: String,
          default: '文件预览',
        }
    },
    name: "FilePreview",
    components: { iFrame },
    data() {
      return {
        visible: false,
        url:''
      };
    },
    methods: {
        preview(fileUrl){
            this.visible = true
            this.url = process.env.VUE_APP_KK_FILE_VIEW_URL + encodeURIComponent(Base64.encode(fileUrl))
        },
    }
  };
  </script>
  <style scoped>
   .styleObj{
    overflow: auto;
   }
  </style>
  