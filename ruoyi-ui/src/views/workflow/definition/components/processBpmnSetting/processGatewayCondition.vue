<template>
  <el-dialog  title="网关条件" :visible.sync="visible" v-if="visible" append-to-body v-dialogDrag width="80%">
    <div class="app-container">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="备注" prop="remark">
          <el-input
            v-model="queryParams.remark"
            placeholder="请输入备注"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>

      <el-row :gutter="10" class="mb8">
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>

      <el-table v-loading="loading" border :data="dataList" :max-height="tableHeight" highlight-current-row @current-change="handleCurrentChange">
        <el-table-column label="主键" align="center" prop="id" v-if="false"/>
        <el-table-column label="备注" align="center" width="230px" prop="remark" >
          <template slot-scope="scope">
              <el-input v-model="scope.row.remark" disabled type="textarea" resize="none" :rows="3"/>
          </template>
        </el-table-column>
        <el-table-column label="条件" align="center" prop="gatewayConditionList" >
          <template slot-scope="scope" v-if="scope.row.gatewayConditionList">
            <div v-for="(item,pindex) in scope.row.gatewayConditionList" :key="pindex" style="border: 1px solid #ccc;padding: 3px;margin: 3px;">
              <div>
                <el-form :label-position="'right'" label-width="100px" :model="item">
                  <el-form-item label="规则名称：">
                    <el-input disabled v-model="item.ruleName"/>
                  </el-form-item>
                </el-form>
              </div>
              <div class="condition" v-for="(e,index) in scope.row.gatewayConditionList[pindex].ruleList" :key="index">
                <el-form :inline="true" :model="e">
                    <el-form-item label="参数：">
                        <el-select disabled v-model="e.variable">
                            <el-option
                            v-for="dict in variableOptions"
                            :key="dict.value"
                            :label="dict.label"
                            :value="dict.value"
                            ></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="条件：">
                        <el-select disabled style="width: 100px;" v-model="e.symbol" placeholder="请选择操作符">
                            <el-option
                            v-for="dict in dict.type.act_variable_symbol"
                            :key="dict.value"
                            :label="dict.label"
                            :value="dict.value"
                            ></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="参数：">
                        <el-input disabled v-model="e.variableValue" />
                    </el-form-item>
                    <el-form-item label="是否字符串：">
                        <el-tag v-if="e.isStr === true">是</el-tag>
                        <el-tag v-else>否</el-tag>
                    </el-form-item>
                </el-form>
              </div>
            </div>
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
      <el-tag v-if="condition && condition.remark" closable @close="handleClose()">{{condition.remark}}</el-tag>

    </div>
    <span slot="footer" class="dialog-footer">
        <el-button @click="visible = false">取 消</el-button>
        <el-button type="primary" @click="submit">确 定</el-button>
    </span>
  </el-dialog>
</template>

<script>
import { listGatewayCondition,getInfo } from "@/api/workflow/gatewayCondition";
import { addGatewayConditionRelate,delGatewayConditionRelate } from "@/api/workflow/gatewayConditionRelate";
import { queryListByKey } from "@/api/workflow/variableCondition";
export default {
  dicts: ['act_variable_symbol'],
  data() {
    return {
      // 弹出层
      visible: false,
      // 遮罩层
      loading: false,
      // 选中数组
      ids: [],
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 网关变量条件表格数据
      dataList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        remark: undefined,
        processDefinitionKey:undefined
      },
      variableList:[],
      // 变量
      variableOptions: [],
      // 表格的高度
      tableHeight: '400px',
      // 流程定义key
      processDefinitionKey:'',
      // 流程定义id
      processDefinitionId:'',
      // 连线id
      sequenceId:'',
      // 表单
      form: {},
      // 当前条件
      condition:{}
    };
  },
  methods: {
    init(key,processDefinitionId,sequenceId){
      this.processDefinitionKey = key
      this.queryParams.processDefinitionKey = key
      this.processDefinitionId = processDefinitionId
      this.sequenceId = sequenceId
      this.visible = true
      this.queryListByKey()
      this.getList()
    },
    queryListByKey(){
      this.variableOptions = []
      queryListByKey(this.processDefinitionKey).then(response => {
        if(response.data && response.data.length > 0){
          this.variableList = response.data
          response.data.forEach(e=>{
            let param = {
              label: e.variableName,
              value: e.variable
            }
            this.variableOptions.push(param)
          })
          getInfo(this.processDefinitionId,this.sequenceId).then(response=>{
            this.condition = response.data
          })
        }
      })
    },
    /** 查询网关变量条件列表 */
    getList() {
      this.loading = true;
      listGatewayCondition(this.queryParams).then(response => {
        this.dataList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 选中的数据
    handleCurrentChange(val) {
      this.form = {
        processDefinitionId: this.processDefinitionId,
        sequenceId: this.sequenceId,
        gatewayConditionId: val.id
      }
    },
    // 确认
    submit(){
        addGatewayConditionRelate(this.form).then(response => {
            this.$modal.msgSuccess("保存成功");
            this.visible = false
        })
    },
    // 删除
    handleClose(){
      this.$confirm('确定删除？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        delGatewayConditionRelate(this.processDefinitionId,this.sequenceId).then(response => {
          this.$modal.msgSuccess("删除成功");
          this.condition = {}
        });
      })
    },
  }
};
</script>
<style scoped>
.condition{
  margin: 10px;
}
.app-container {
  height: 550px;
}
</style>
