<template>
  <el-dialog  title="网关条件" :visible.sync="visible" v-if="visible" append-to-body v-dialogDrag width="95%">
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
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAddOpen"
            v-hasPermi="['workflow:gatewayCondition:add']"
          >新增</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['workflow:gatewayCondition:export']"
          >导出</el-button>
        </el-col>
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>

      <el-table v-loading="loading" border :data="dataList" @selection-change="handleSelectionChange" :max-height="tableHeight">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="主键" align="center" prop="id" v-if="false"/>
        <el-table-column label="备注" align="center" width="300px" prop="remark" >
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
        <el-table-column label="操作" align="center" width="100px" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['workflow:gatewayCondition:remove']"
            >删除</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['workflow:gatewayCondition:edit']"
            >修改</el-button>
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

      <!-- 添加或修改网关变量条件对话框 -->
      <el-dialog :title="title" :visible.sync="open" width="95%" v-if="open" append-to-body>
        <el-col :span="24" style="line-height: 20px">
          <el-alert title="填写的参数要与变量一致！例：当请假天数填写为2.0天时，参数也要填写为如(大于2.0)写为3.0" type="warning" show-icon :closable="false"/>
        </el-col>
        <div style="margin-bottom: 20px;">
          <span style="line-height: 30px;">备注：</span><el-input type="textarea" maxlength="500" show-word-limit v-model="form.remark" resize="none" :rows="3"/>
        </div>
        <el-table v-loading="loading" border :data="form.gatewayConditionList" :max-height="tableHeight">
          <el-table-column label="条件" align="center" prop="gatewayConditionList" >
            <template slot-scope="scope">
              <div style="display: flex;justify-content: space-between;border: 1px solid #ccc;padding: 3px;margin: 3px;">
                <div class="remark" style="width:25%;display: flex;align-items: center;">
                  <span style="width: 100px;">规则名称：</span>
                  <el-input type="textarea" resize="none" :rows="3" v-model="scope.row.ruleName"/>
                </div>
                <div style="width: 75%;display: flex;justify-content: space-between;align-items: center;padding: 5px;" >
                  <div style="border: 1px solid #ccc;">
                    <div class="condition" v-for="(e,index) in scope.row.ruleList" :key="index">
                     <el-form :inline="true" :model="e">
                        <el-form-item label="参数：">
                            <el-select @visible-change="queryListByKey()" @change="changeVariable(e.variable,scope.$index,index)" v-model="e.variable" placeholder="请选择参数">
                                <el-option
                                    v-for="dict in variableOptions"
                                    :key="dict.value"
                                    :label="dict.label"
                                    :value="dict.value"
                                ></el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="条件：">
                            <el-select style="width: 150px;" v-model="e.symbol" placeholder="请选择条件">
                                <el-option
                                    v-for="dict in e.symbolList"
                                    :key="dict.value"
                                    :label="dict.label"
                                    :value="dict.value"
                                ></el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="参数：">
                            <el-input v-model="e.variableValue"/>
                        </el-form-item>
                        <el-form-item label="是否字符串：">
                            <el-tag v-if="e.isStr === true">是</el-tag>
                            <el-tag v-else>否</el-tag>
                        </el-form-item>
                        <el-form-item label="">
                            <el-button type="text" size="mini" style="width: 20px;" @click="handleAddSub(scope.$index)">添加</el-button>
                            <el-button type="text" size="mini" style="width: 20px;" @click="handleDelSub(scope.$index,index)">删除</el-button>
                        </el-form-item>
                     </el-form>
                    </div>
                  </div>
                  <div style="display: flex;align-items: center">
                      <el-button type="text" size="mini" style="width: 20px;"  @click="handleAdd()">添加</el-button>
                      <el-button type="text" size="mini" style="width: 20px;"  @click="handleDel(scope.$index)">删除</el-button>
                  </div>
                </div>
              </div>
            </template>
          </el-table-column>
        </el-table>
        <span slot="footer" class="dialog-footer">
          <el-button @click="open = false">取 消</el-button>
          <el-button type="primary" @click="submitForm">确 定</el-button>
        </span>
      </el-dialog>

    </div>

  </el-dialog>
</template>

<script>
import { listGatewayCondition ,addGatewayCondition,updateGatewayCondition,delGatewayCondition,getGatewayCondition } from "@/api/workflow/gatewayCondition";
import { queryListByKey } from "@/api/workflow/variableCondition";
export default {
  dicts: ['act_variable_symbol'],
  data() {
    return {
      // 弹出层
      visible: false,
      // 按钮loading
      buttonLoading: false,
      // 遮罩层
      loading: false,
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
      // 网关变量条件表格数据
      dataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        remark: undefined,
        processDefinitionKey:undefined
      },
      // 表单参数
      form: {
        remark:'',
        gatewayConditionList: []
      },
      variableList:[],
      // 变量
      variableOptions: [],
      // 表格的高度
      tableHeight: '450px',
      // 流程定义key
      processDefinitionKey:'',
      // 操作符字典
      symbolOptions: []
    };
  },
  methods: {
    init(key){
      this.processDefinitionKey = key
      this.queryParams.processDefinitionKey = key
      this.visible = true
      this.queryListByKey()
      this.getList(),
      this.getDicts("act_variable_symbol").then(response => {
        this.symbolOptions = response.data;
      });
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
    changeVariable(data,pIndex,index){
      this.form.gatewayConditionList[pIndex].ruleList[index].symbolList = []
      this.variableList.find(e => e.variable === data).symbol.split(",").forEach(e => {
        let dict = this.symbolOptions.find((v) => {
            return v.dictValue === e;
        });
        if(dict){
            this.form.gatewayConditionList[pIndex].ruleList[index].symbol = ''
            let param = {
                label: dict.dictLabel,
                value: dict.dictValue
            }
            this.form.gatewayConditionList[pIndex].ruleList[index].symbolList.push(param)
        }
      })

      this.variableList.filter(e => e.variable === data).forEach(e => {
        this.form.gatewayConditionList[pIndex].ruleList[index].isStr = e.isStr
      })
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    // 新增打开
    handleAddOpen(){
      this.title = "添加条件"
      this.queryListByKey()
      this.open = true
      this.form.remark = ''
      this.form.gatewayConditionList = []
      this.handleAdd()
    },
    // 新增
    handleAdd() {
      let param = {
          ruleName:'',
          ruleList:[
            {
              variable:'',
              symbol:'',
              variableValue:'',
              symbolList:[],
              isStr: true
            }
          ]
      }
      this.form.gatewayConditionList.push(param);
    },
    // 删除
    handleDel(index){
      if(this.form.gatewayConditionList.length > 1){
        this.form.gatewayConditionList.splice(index,1);
      }
    },
    // 新增子集
    handleAddSub(pIndex){
      let param = {
            variable:'',
            symbol:'',
            variableValue:'',
            symbolList:[],
            isStr: true
          }
      this.form.gatewayConditionList[pIndex].ruleList.push(param);
    },
    // 删除子集
    handleDelSub(pIndex,index){
      if(this.form.gatewayConditionList[pIndex].ruleList.length > 1){
        this.form.gatewayConditionList[pIndex].ruleList.splice(index,1);
      }
    },

    // 删除
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除网关变量条件？').then(() => {
        this.loading = true;
        return delGatewayCondition(ids);
      }).then(() => {
        this.loading = false;
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      }).finally(() => {
        this.loading = false;
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.open = true
      this.title = "修改条件"
      this.loading = true;
      this.form.remark = ''
      this.form.gatewayConditionList = []
      getGatewayCondition(row.id).then(response => {
        this.loading = false;
        this.form = response.data;
        this.open = true;
        this.title = "修改网关变量条件";
      });
    },

    /** 提交按钮 */
    submitForm() {
      this.buttonLoading = true;
      this.form.gatewayConditionList = this.form.gatewayConditionList
      this.form.processDefinitionKey = this.processDefinitionKey
      if (this.form.id != null) {
        updateGatewayCondition(this.form).then(response => {
          this.$modal.msgSuccess("修改成功");
          this.open = false;
          this.getList();
        }).finally(() => {
          this.buttonLoading = false;
        });
      } else {
        addGatewayCondition(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.open = false;
          this.getList();
        }).finally(() => {
          this.buttonLoading = false;
        });
      }
    },
    /** 导出按钮操作 */
    handleExport() {
        this.download('workflow/gatewayCondition/export', {
          ...this.queryParams
        }, `gatewayCondition_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
<style scoped>
.condition{
  margin: 10px;
}
.remark{
  margin: 10px;
}
.app-container {
  height: 600px;
}
</style>
