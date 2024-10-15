<template>
  <el-dialog title="审批意见" :visible.sync="recordVisible" v-if="recordVisible" append-to-body v-dialogDrag width="70%">
    <div class="containers" v-loading="loading">
      <el-table :data="list" style="width: 100%">
        <el-table-column label="流程审批历史记录" align="center">
          <el-table-column type="index" label="序号" align="center" width="50"></el-table-column>
          <el-table-column prop="name" label="任务名称" align="center"></el-table-column>
          <el-table-column prop="nickName" label="办理人" align="center"></el-table-column>
          <el-table-column label="状态" align="center">
            <template slot-scope="scope">
              <el-tag>{{ scope.row.statusName }}</el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="comment" label="审批意见" align="center"></el-table-column>
          <el-table-column prop="fileList" width="100" label="附件" align="center">
            <template slot-scope="scope">
              <el-popover v-if="scope.row.fileList.length > 0" placement="right" trigger="click">
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
          <el-table-column prop="startTime" label="开始时间" align="center"></el-table-column>
          <el-table-column prop="endTime" label="结束时间" align="center"></el-table-column>
          <el-table-column prop="runDuration" label="运行时长" align="center"></el-table-column>
        </el-table-column>
      </el-table>
    </div>
  </el-dialog>
</template>

<script>
import apiProcessInst from '@/api/workflow/processInst'
export default {
  data () {
    return {
      loading: false,
      list: [],
      recordVisible: false
    }
  },
  methods: {
    // 查询审批历史记录
    init (processInstanceId) {
      this.loading = true
      this.recordVisible = true
      this.$nextTick(() => {
        apiProcessInst.getHistoryInfoList(processInstanceId).then(response => {
          this.list = response.data.historyRecordList
          this.loading = false
        })
      })
    },
    // 附件下载
    downloadFile (row) {
      this.$download.oss(row.contentId)
    }
  }
}
</script>
<style scoped>
.containers {
  height: 550px;
  overflow-y: auto;
}

.el-table__header colgroup col[name="gutter"] {
  display: table-cell !important;
}
</style>
