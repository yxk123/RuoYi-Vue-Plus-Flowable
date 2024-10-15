<template>
  <div style="padding-bottom: 10px;">
    <el-row :gutter="10" class="mb8">
      <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-search"
            size="mini"
            @click="getListSearch('')"
            v-hasPermi="['workflow:message:list']"
          >全部</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-search"
            size="mini"
            @click="getListSearch('read')"
            v-hasPermi="['workflow:message:list']"
          >已读</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-search"
            size="mini"
            @click="getListSearch('notRead')"
            v-hasPermi="['workflow:message:list']"
          >未读</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            @click="handleReadMessageAll"
          >全部已读</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['workflow:message:remove']"
          >删除</el-button>
        </el-col>
      </el-form>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>
    <el-table v-loading="loading" border :data="messageList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="消息发送者" width="120" align="center" prop="sendName" />
      <el-table-column label="标题" align="center" width="200" prop="title" :show-overflow-tooltip="true"/>
      <el-table-column label="消息类型" width="80" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_message" :value="scope.row.type" />
        </template>
      </el-table-column>
      <el-table-column label="是否已读" width="80" align="center" prop="type">
        <template slot-scope="scope">
          <el-tag type="success" v-if="scope.row.readTime">是</el-tag>
          <el-tag type="danger" v-else-if="!scope.row.readTime">否</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="消息内容" :show-overflow-tooltip="true" align="center" prop="messageContent" />
      <el-table-column label="操作" align="center" width="120" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" :disabled="!(scope.row.readTime === null || scope.row.readTime === '')" icon="el-icon-edit" @click="handleReadMessage(scope.row.id)"
            v-hasPermi="['workflow:message:edit']">阅读</el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />
  </div>
</template>

<script>
import { listMessage,delMessage,readAll,readMessage} from "@/api/workflow/message";

export default {
  name: "Message",
  dicts: ['sys_message'],
  data () {
    return {
      // 按钮loading
      buttonLoading: false,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 消息通知表格数据
      messageList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 5,
        readTime: undefined,
        type:''
      }
    };
  },
  created () {
    this.getList();
  },
  methods: {
    getListSearch(type){
      this.queryParams.type = type
      if(type === 'read'){
        this.queryParams.readTime = new Date().toLocaleDateString()
      }else{
        this.queryParams.readTime = null
      }
      this.getList()
    },
    /** 查询消息通知列表 */
    getList () {
      this.loading = true;
      listMessage(this.queryParams).then(response => {
        this.messageList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 搜索按钮操作 */
    handleQuery () {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery () {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange (selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 删除按钮操作 */
    handleDelete (row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除？').then(() => {
        this.loading = true;
        return delMessage(ids);
      }).then(() => {
        this.loading = false;
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).finally(() => {
        this.loading = false;
      });
    },
    //已读
    handleReadMessage(id){
      this.loading = true
      readMessage(id).then(res => {
        this.getList()
        this.$modal.msgSuccess("操作成功");
      })
    },
    //全部已读
    handleReadMessageAll(){
      this.loading = true
      this.queryParams.type = ''
      readAll().then(res => {
        this.getList()
        this.$modal.msgSuccess("操作成功");
      })
    }
  }
};
</script>
