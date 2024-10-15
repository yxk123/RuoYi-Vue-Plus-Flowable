<template>
  <div>
    <el-form label-width="110px" :model="formData" :rules="rulesFrom" ref="formDataRef">
        <el-form-item label="流程定义KEY" prop="processDefinitionKey">
          <el-input v-model="formData.processDefinitionKey" disabled></el-input>
        </el-form-item>
        <el-form-item label="流程定义名称" prop="processDefinitionName">
          <el-input v-model="formData.processDefinitionName" disabled></el-input>
        </el-form-item>
        <el-form-item label="选人方式" prop="defaultProcess">
          <el-radio-group @change="change($event)" v-model="formData.defaultProcess">
            <el-radio-button :label="true">审批者选人</el-radio-button>
            <el-radio-button :label="false">提交者选人</el-radio-button>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="事件" prop="task">
          <el-popover
            placement="right"
            width="700"
            trigger="click">
            <el-button type="primary" size="small" @click="addListener">添加</el-button>
            <el-alert style="margin:10px 0px 10px 0" title="说明:写java类注入Spring中实现FlowProcessHandler接口,执行退回。撤回,终止,作废时会执行该接口中方法" type="warning" :closable="false"></el-alert>
            <el-table :data="formData.taskListenerList">
              <el-table-column label="事件类型" width="150" align="center" prop="paramType" >
                  <template slot-scope="scope">
                      <el-select v-model="scope.row.eventType" placeholder="请选择">
                      <el-option
                        v-for="item in options"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </template>
              </el-table-column>
              <el-table-column label="状态" width="200" align="center" prop="paramType" >
                  <template slot-scope="scope">
                      <el-select multiple v-model="scope.row.status" placeholder="请选择">
                      <el-option
                        v-for="item in statusOptions"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                      </el-option>
                    </el-select>
                  </template>
              </el-table-column>
              <el-table-column label="bean名称" align="center" prop="paramType" >
                  <template slot-scope="scope">
                      <el-input v-model="scope.row.beanName"/>
                  </template>
              </el-table-column>
              <el-table-column label="操作" width="80">
                  <template slot-scope="scope">
                      <el-button @click="deleteListener(scope.$index)" type="danger" size="small">删除</el-button>
                  </template>
              </el-table-column>
            </el-table>
            <el-badge :value="formData.taskListenerList.length" slot="reference" class="item">
              <el-button type="primary" icon="el-icon-circle-plus-outline">事件</el-button>
            </el-badge>
          </el-popover>
        </el-form-item>
        <el-form-item label="表名称" prop="tableName">
          <el-input v-model="formData.tableName" placeholder="请选择表名称" disabled style="width:180px;padding-right: 5px;"/>
          <el-button type="primary" @click="handerOpenTable" icon="el-icon-search"></el-button>
        </el-form-item>
        <el-form-item label="组件名称" prop="componentName">
          <el-input placeholder="请输入组件名称" v-model="formData.componentName"/>
        </el-form-item>
        <el-form-item label="备注" prop="remork">
          <el-input type="textarea" v-model="formData.remork"></el-input>
        </el-form-item>
    </el-form>
    <span class="btn-footer">
      <el-button type="danger" v-if="this.formData.id" @click="deleteForm()">重 置</el-button>
      <el-button type="primary" @click="submitForm('formDataRef')">确 定</el-button>
    </span>
    <!-- 业务表 -->
    <sysTable ref="sysTableRef" @handleTableClick="handleTableClick"/>
  </div>
</template>

<script>
import { addProcessDefSetting,checkProcessDefSetting,delProcessDefSetting } from "@/api/workflow/processDefSetting";
import sysTable from "@/views/workflow/definition/components/sysTable";
export default {
  props:{
    dataObj: {
      type: Object,
      default:()=>{}
    }
  },
  components: { sysTable },
  data() {
    return {
      // 显示隐藏
      formVisible: false,
      // 按钮loading
      buttonLoading: false,
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 弹出层标题
      title: "",
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        formKey: undefined,
        formName: undefined,
      },
      // 表单校验
      rulesFrom: {
        defaultProcess: [
          { required: true, message: '流程设置', trigger: 'blur' }
        ],
        processDefinitionKey: [
          { required: true, message: '流程定义Key不能为空', trigger: 'blur' }
        ],
        processDefinitionName: [
          { required: true, message: '流程定义名称不能为空', trigger: 'blur' }
        ],
        formKey: [
          { required: true, message: '表单Key不能为空', trigger: 'blur' }
        ],
        formName: [
          { required: true, message: '表单名称不能为空', trigger: 'blur' }
        ],
        tableName: [
          { required: true, message: '表名称不能为空', trigger: 'blur' }
        ],
        componentName: [
          { required: true, message: '组件名称不能为空', trigger: 'blur' }
        ]
      },
      formData: {
        taskListenerList:[],
      },
      options: [{
        value: 'before',
        label: '完成前'
      }, {
        value: 'after',
        label: '完成后'
      }],
      statusOptions: [{
        value: 'back',
        label: '退回'
      }, {
        value: 'cancel',
        label: '撤回'
      }, {
        value: 'termination',
        label: '终止'
      }, {
        value: 'invalid',
        label: '作废'
      }]
    };
  },
  watch: {
      // 根据名称筛选分类树
      dataObj(val) {
        this.formData = val
      }
   },
  methods: {
    change(e){
        this.$forceUpdate(e)
        this.$refs["formDataRef"].clearValidate()
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
    // 打开表单
    handerOpenForm(){
      this.getList();
      this.formVisible = true
    },
    // 选中数据
    handleFormClick(row) {
      this.$set(this.formData,'formId',row.id)
      this.$set(this.formData,'formKey',row.formKey)
      this.$set(this.formData,'formName',row.formName)
      this.formVisible = false;
    },
    // 选中数据
    handleTableClick(row){
      this.$set(this.formData,'tableName',row.tableName)
    },
    /** 打开表弹窗 */
    handerOpenTable() {
      this.$refs.sysTableRef.handerOpenTable()
    },
    // 确认
    submitForm(formName){
      this.loading = true;
      this.$refs[formName].validate((valid) => {
       if (valid) {
        let param = {
            processDefinitionId: this.formData.processDefinitionId,
            processDefinitionKey: this.formData.processDefinitionKey,
            componentName: this.formData.componentName,
            tableName: this.formData.tableName,
            id: this.formData.id,
            defaultProcess: this.formData.defaultProcess
        }
        checkProcessDefSetting(param).then(response => {
          if(response.data){
            this.$confirm(response.msg, '提示', {
              confirmButtonText: '确定',
              cancelButtonText: '取消',
              type: 'warning'
            }).then(() => {
              this.formData.settingIds = response.data
              addProcessDefSetting(this.formData).then(response => {
                this.formData = response.data
                this.$modal.msgSuccess("保存成功");
                this.loading = false;
                this.$emit("callbackFn")
              });
            })
          }else{
            addProcessDefSetting(this.formData).then(response => {
              this.formData = response.data
              this.$modal.msgSuccess("保存成功");
              this.loading = false;
              this.$emit("callbackFn")
            });
          }
        })
       }
      })
    },
    //删除设置
    deleteForm(){
      if(this.formData.id){
        this.$modal.confirm('确定删除重置？').then(() => {
          delProcessDefSetting(this.formData.id).then(response=>{
            this.$modal.msgSuccess("重置成功");
          })
        })
      }
    },
    // 添加参数
    addListener(){
        let param = {
            eventType:'',
            beanName:''
        }
        this.formData.taskListenerList.push(param);
    },
    // 删除参数
    deleteListener(index){
      this.formData.taskListenerList.splice(index,1)
    },
  }
};
</script>
<style scoped>
.line{
  padding-bottom: 20px;
}
.btn-footer{
  float: right;
  margin-top: 20px;
}
.item {
  margin-top: 10px;
  margin-right: 40px;
}
</style>
