<template>
  <el-dialog  title="流程变量" :visible.sync="visible" v-if="visible" append-to-body v-dialogDrag width="65%">
    <div class="app-container">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="变量名称" prop="variableName">
          <el-input
            v-model="queryParams.variableName"
            placeholder="请输入变量名称"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="变量" prop="variable">
          <el-input
            v-model="queryParams.variable"
            placeholder="请输入变量"
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
            @click="handleAdd"
            v-hasPermi="['workflow:variableCondition:add']"
          >新增</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['workflow:variableCondition:edit']"
          >修改</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['workflow:variableCondition:remove']"
          >删除</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="warning"
            plain
            icon="el-icon-download"
            size="mini"
            @click="handleExport"
            v-hasPermi="['workflow:variableCondition:export']"
          >导出</el-button>
        </el-col>
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>
  
      <el-table v-loading="loading" :data="variableConditionList" @selection-change="handleSelectionChange" :max-height="tableHeight">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="变量名称" align="center" prop="variableName" />
        <el-table-column label="变量" align="center" prop="variable" />
        <el-table-column label="操作符" align="center" prop="symbol">
          <template slot-scope="scope">
            <el-tag style="margin: 2px;" v-for="(item,index) in scope.row.symbol.split(',')" :key="index">{{ item }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['workflow:variableCondition:edit']"
            >修改</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
              v-hasPermi="['workflow:variableCondition:remove']"
            >删除</el-button>
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
      <el-dialog :title="title" :visible.sync="open" width="600px" v-if="open" append-to-body>
        <el-form ref="form" :model="form" :rules="rules" label-width="120px">  
          <el-form-item label="流程定义Key" prop="processDefinitionKey">
            <el-input v-model="form.processDefinitionKey" disabled placeholder="请输入流程定义Key" />
          </el-form-item>
          <el-form-item label="变量名称" prop="variableName">
            <el-input v-model="form.variableName" placeholder="请输入变量名称" />
          </el-form-item>
          <el-form-item label="变量" prop="variableName">
            <el-input v-model="form.variable" placeholder="请输入变量" />
          </el-form-item>
          <el-form-item label="是否字符串" prop="isStr">
            <el-radio-group @change="change($event)" v-model="form.isStr">
                <el-radio-button :label="true">字符串</el-radio-button>
                <el-radio-button :label="false">数值</el-radio-button>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="操作符" prop="symbol">
            <el-select style="width:100%" multiple v-model="symbolList" placeholder="请选择操作符">
              <el-option
                v-for="dict in dict.type.act_variable_symbol"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              ></el-option>
            </el-select>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </el-dialog>
    </div>
  </el-dialog>
</template>
  
  <script>
  import { listVariableCondition, getVariableCondition, delVariableCondition, addVariableCondition, updateVariableCondition } from "@/api/workflow/variableCondition";

  export default {
    dicts: ['act_variable_symbol'],
    data() {
      return {
        visible:  false,
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
        // 网关变量条件表格数据
        variableConditionList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          variableName: undefined,
          variable: undefined,
          processDefinitionKey:''
        },
        // 表单参数
        form: {
          isStr: true,
          processDefinitionKey:''
        },
        // 表单校验
        rules: {
          variableName: [
            { required: true, message: "变量名称不能为空", trigger: "blur" }
          ],
          variable: [
            { required: true, message: "变量不能为空", trigger: "blur" }
          ],
          symbol: [
            { required: true, message: "条件不能为空", trigger: "change" }
          ],
          processDefinitionKey: [
            { required: true, message: "流程定义Key不能为空", trigger: "blur" }
          ],
          isStr: [
            { required: true, message: "是否字符串不能为空", trigger: "blur" }
          ]
        },
        // 流程定义key
        processDefinitionKey:'',
        // 表格的高度
        tableHeight: '350px',
        // 操作符
        symbolList: [],
        // 操作符
        symbolOptions: []
      };
    },
    methods: {
      init(key){
        this.visible = true
        this.processDefinitionKey = key
        this.queryParams.processDefinitionKey = key
        this.form.processDefinitionKey = key
        this.getList()
        this.getDicts("act_variable_symbol").then(response => {
          this.symbolOptions = response.data;
        });
      },
      change(e){
        this.$forceUpdate(e)
        this.$refs["form"].clearValidate()
      },
      /** 查询网关变量条件列表 */
      getList() {    
        this.loading = true;
        listVariableCondition(this.queryParams).then(response => {
          this.variableConditionList = response.rows;
          if(this.variableConditionList && this.variableConditionList.length > 0){
            this.variableConditionList.forEach(element => {
              if(element.symbol){
                let symbolArr = []
                element.symbol.split(',').forEach(e => {
                  let dict = this.symbolOptions.find((v) => {
                      return v.dictValue === e;
                  });
                  if(dict){
                    symbolArr.push(dict.dictLabel)
                  }
                })
                if(symbolArr && symbolArr.length > 0){
                  element.symbol = symbolArr.join(",")
                }
              }
            });
          }
          this.total = response.total;
          this.loading = false;
        });
      },
      // 取消按钮
      cancel() {
        this.open = false;
        this.reset();
      },
      // 表单重置
      reset() {
        this.form = {
          id: undefined,
          variableName: undefined,
          variable: undefined,
          symbol: undefined,
          processDefinitionKey: undefined
        };
        this.resetForm("form");
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
      /** 新增按钮操作 */
      handleAdd() {
        this.reset()
        this.open = true;
        this.title = "添加网关变量条件";
        this.form.isStr = true
        this.form.processDefinitionKey = this.processDefinitionKey
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.loading = true;
        this.reset();
        const id = row.id || this.ids
        getVariableCondition(id).then(response => {
          this.loading = false;
          this.form = response.data;
          this.symbolList = this.form.symbol.split(",")
          this.open = true;
          this.title = "修改网关变量条件";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.form.symbol = this.symbolList.join(",")
        this.$refs["form"].validate(valid => {
          if (valid) {
            this.buttonLoading = true;
            if (this.form.id != null) {
              updateVariableCondition(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }).finally(() => {
                this.buttonLoading = false;
              });
            } else {
              addVariableCondition(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              }).finally(() => {
                this.buttonLoading = false;
              });
            }
          }
        });
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const ids = row.id || this.ids;
        this.$modal.confirm('是否确认删除网关变量条件编号为"' + ids + '"的数据项？').then(() => {
          this.loading = true;
          return delVariableCondition(ids);
        }).then(() => {
          this.loading = false;
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {
        }).finally(() => {
          this.loading = false;
        });
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('workflow/variableCondition/export', {
          ...this.queryParams
        }, `variableCondition_${new Date().getTime()}.xlsx`)
      }
    }
  };
  </script>
  <style scoped>
  .app-container {
      height: 550px;
  }
 
</style>
  