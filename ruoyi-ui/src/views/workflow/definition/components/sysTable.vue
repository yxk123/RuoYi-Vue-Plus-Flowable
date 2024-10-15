<template>
  <div>
    <!-- 导入表开始 -->
    <el-dialog title="数据表" :visible.sync="tableVisible" v-if="tableVisible" width="900px" top="5vh" append-to-body>
      <el-alert title="选择要绑定的业务表名" type="success" :closable="false" style="margin: 0px 0px 15px 0px;"></el-alert>
      <el-form :model="tableQueryParams" ref="tableQueryForm" size="small" :inline="true">
        <el-form-item label="表名称" prop="tableName">
          <el-input v-model="tableQueryParams.tableName" placeholder="请输入表名称" clearable
            @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item label="表描述" prop="tableComment">
          <el-input v-model="tableQueryParams.tableComment" placeholder="请输入表描述" clearable
            @keyup.enter.native="handleQuery" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleTableQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetTableQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <el-row>
        <el-table :highlight-current-row="true" @row-click="handleTableClick" ref="table" :data="dbTableList"
          height="260px">
          <el-table-column label="序号" type="index" width="50" align="center">
            <template slot-scope="scope">
              <span>{{ (tableQueryParams.pageNum - 1) * tableQueryParams.pageSize + scope.$index + 1 }}</span>
            </template>
          </el-table-column>
          <el-table-column label="表名称" align="center" prop="tableName" :show-overflow-tooltip="true" />
          <el-table-column label="表描述" align="center" prop="tableComment" :show-overflow-tooltip="true" />
          <el-table-column label="创建时间" align="center" prop="createTime" width="160" />
          <el-table-column label="更新时间" align="center" prop="updateTime" width="160" />
        </el-table>
        <pagination v-show="dbTableTotal > 0" :total="dbTableTotal" :page.sync="tableQueryParams.pageNum"
          :limit.sync="tableQueryParams.pageSize" @pagination="getDbList" />
      </el-row>
    </el-dialog>
    <!-- 导入表结束 -->
  </div>
</template>

<script>
import { listDb } from "@/api/tool/gen";
export default {
  data () {
    return {
      // 表数据
      dbTableList: [],
      // 总条数
      dbTableTotal: 0,
      // 查询参数
      tableQueryParams: {
        pageNum: 1,
        pageSize: 10,
        tableName: undefined,
        tableComment: undefined
      },
      tableVisible: false
    };
  },
  methods: {
    // 选中数据
    handleTableClick (row) {
      this.$emit("handleTableClick", row)
      this.tableVisible = false;
    },
    // 表数据
    getDbList () {
      listDb(this.tableQueryParams).then(res => {
        if (res.code === 200) {
          this.dbTableList = res.rows;
          this.dbTableTotal = res.total;
        }
      }
      );
    },
    /** 打开表弹窗 */
    handerOpenTable () {
      this.tableVisible = true;
      this.getDbList()
    },
    /** 搜索按钮操作 */
    handleTableQuery () {
      this.tableQueryParams.pageNum = 1;
      this.getDbList();
    },
    /** 重置按钮操作 */
    resetTableQuery () {
      this.resetForm("tableQueryForm");
      this.handleTableQuery();
    }
  }
};
</script>
<style scoped>
.line {
  padding-bottom: 20px;
}

.btn-footer {
  float: right;
  margin-top: 100px;
}
</style>
