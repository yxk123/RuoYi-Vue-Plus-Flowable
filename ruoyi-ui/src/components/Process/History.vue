<template>
    <div>
      <el-tabs  type="border-card" >
        
        <el-tab-pane label="流程进度" v-if="processInstanceId" style="height:520px" class="container-tab">
            <HistoryBpmn :processInstanceId="processInstanceId"/>
        </el-tab-pane>
        <el-tab-pane label="审批意见" v-loading="loading" class="container-tab">
            <div style="margin-bottom: 10px">
              <el-popover v-if="editBackNode"
                placement="right"
                trigger="click">
                <el-table :data="actTaskNodeList" border>
                  <el-table-column width="300" align="center" property="nodeName" label="节点名称"></el-table-column>
                  <el-table-column width="100" align="center" property="isBack" label="是否可驳回">
                    <template slot-scope="scope">
                      <el-switch
                          v-model="scope.row.isBack"
                          active-color="#13ce66"
                          inactive-color="#ff4949"
                          :active-value="true"
                          :disabled="scope.row.orderNo === 0"
                          @change="enableStatus(scope.row)"
                          :inactive-value="false">
                        </el-switch>
                    </template>
                  </el-table-column>
                </el-table>
                <el-button slot="reference">启用/禁用驳回节点</el-button>
              </el-popover>
            </div>
            <el-table :data="list" style="width: 100%" max-height="570">
              <el-table-column label="流程审批历史记录" align="center">
                <el-table-column type="index" label="序号" align="center" width="50"></el-table-column>
                <el-table-column prop="name" label="任务名称" align="center" ></el-table-column>
                <el-table-column prop="nickName" label="办理人" align="center" ></el-table-column>
                <el-table-column label="状态" align="center" >
                  <template slot-scope="scope">
                    <el-tag>{{scope.row.statusName}}</el-tag>
                  </template>
                </el-table-column>
                <el-table-column prop="comment" label="审批意见" align="center" ></el-table-column>
                <el-table-column prop="fileList" width="100" label="附件" align="center" >
                  <template slot-scope="scope">
                    <el-popover v-if="scope.row.fileList.length>0" placement="right" trigger="click">
                      <el-table :data="scope.row.fileList">
                        <el-table-column width="200" prop="name" :show-overflow-tooltip="true" label="附件名称"></el-table-column>
                        <el-table-column width="50" label="操作">
                          <template slot-scope="scope">
                            <el-button size="mini" type="text" @click="downloadFile(scope.row)">下载</el-button>
                          </template>
                        </el-table-column>
                      </el-table>
                      <el-button size="mini" type="text" slot="reference">查看附件</el-button>
                    </el-popover>
                  </template>
                </el-table-column>
                <el-table-column prop="startTime" label="开始时间" align="center" ></el-table-column>
                <el-table-column prop="endTime" label="结束时间" align="center" ></el-table-column>
                <el-table-column prop="runDuration" label="运行时长" align="center" ></el-table-column>
                <el-table-column fixed="right" label="操作" v-if="editMessage" align="center" width="80">
                  <template slot-scope="scope">
                    <el-button @click="handleClick(scope.row)" type="text" v-if="scope.row.commentId" size="small">编辑意见</el-button>
                  </template>
                </el-table-column>
              </el-table-column>
            </el-table>
        </el-tab-pane>
      </el-tabs>
      <el-dialog title="编辑意见" :close-on-click-modal="false" :visible.sync="dialogVisible" v-if="dialogVisible" append-to-body width="60%">
        <el-form>
          <el-form-item label="审批意见" prop="comment" label-width="120px">
            <el-input  type="textarea" v-model="comment" maxlength="300" placeholder="请输入意见" :autosize="{ minRows: 4 }" show-word-limit />
          </el-form-item>
          <el-form-item label="附件" prop="message" label-width="120px">
            <fileUpload @input="deleteFile" v-model="fileIds"/>
        </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button type="primary" size="small" @click="clickUpdate">确 定</el-button>
          <el-button size="small" @click="dialogVisible = false">取 消</el-button>
        </span>
      </el-dialog>
    </div>
</template>

<script>
import apiProcessInst from '@/api/workflow/processInst'
import {enableStatus} from '@/api/workflow/actTaskNode'
import taskApi from '@/api/workflow/task'
import HistoryBpmn from "@/components/Process/HistoryBpmn";
export default {
    props: {
      processInstanceId: String,
      editMessage: {
        type: Boolean,
        default: false
      },
      editBackNode: {
        type: Boolean,
        default: false
      }
    },
    components:{
      HistoryBpmn
    },
    data() {
      return {
        loading: false,
        list: [],
        dialogVisible: false,
        commentId: undefined,
        comment: undefined,
        fileIds: undefined,
        taskId: undefined,
        actTaskNodeList: []
      }
    },
    watch: {
      processInstanceId: {
        handler(newVal,oldVal){
          if(newVal) {
            this.loading = true
            // 审批历史数据
            this.getHistoryInfoList()
          }
        },
        immediate: true,
        deep:true
      }
    },

    methods: {
        // 查询审批历史记录
        async getHistoryInfoList() {
            const { data } = await apiProcessInst.getHistoryInfoList(this.processInstanceId)
            this.list = data.historyRecordList
            if(data.actTaskNodeList){
              this.actTaskNodeList = data.actTaskNodeList
            }
            this.loading = false
        },
        // 打开编辑意见
        handleClick(row){
            this.fileIds = ''
            this.commentId = row.commentId
            this.comment = row.comment
            this.taskId = row.id
            if(row.fileList.length>0){
                this.fileIds = row.fileList.map(e=>e.contentId).join(',')
            }
            this.dialogVisible = true
        },
        // 编辑意见
        async clickUpdate(){
          let data = {
            processInstanceId: this.processInstanceId,
            taskId: this.taskId,
            commentId: this.commentId,
            comment: this.comment,
            fileIds: this.fileIds
          }
            const {code,msg} = await taskApi.editComment(data)
            if(code === 200){
                this.$modal.msgSuccess(msg);
                this.dialogVisible = false
                this.getHistoryInfoList()
            }
        },
        // 附件下载
        downloadFile(row) {
          this.$download.oss(row.contentId)
        },
        //启用驳回
        enableStatus(data){
          enableStatus(data).then(res => {
            this.$modal.msgSuccess("更新成功");
          })
        },
        //删除附件
        deleteFile(fileList,ossId){
          if(ossId){
            taskApi.deleteAttachment(ossId).then(response => {
              this.$modal.msgSuccess("删除成功");
              this.getHistoryInfoList()
            })
          }
        }
    }

}
</script>
<style lang="scss" scoped>

.el-table__header colgroup col[name="gutter"] {
    display: table-cell !important;
}
</style>
