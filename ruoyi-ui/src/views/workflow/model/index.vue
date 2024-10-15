<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="4" :xs="24">
        <el-card shadow="hover">
          <div class="head-container">
            <el-input v-model="categoryName" placeholder="请输入分类名称" clearable size="small" prefix-icon="el-icon-search"
              style="margin-bottom: 20px;margin-top: 3px;" />
          </div>
          <el-tree :data="categoryOptions" :props="defaultProps" :expand-on-click-node="false"
            :filter-node-method="filterNode" ref="tree" default-expand-all>
            <span class="custom-tree-node" slot-scope="{ data }">
              <el-tooltip effect="dark" :content="data.categoryName" placement="bottom-end">
                <span @click="handleNodeClick(data)">{{ `${data.categoryName}` }}</span>
              </el-tooltip>
            </span>
          </el-tree>
        </el-card>
      </el-col>
      <el-col :span="20" :xs="24">
        <el-card shadow="hover">
          <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="70px" size="small">
            <el-form-item label="模型名称" prop="name">
              <el-input v-model="queryParams.name" placeholder="请输入模型名称" clearable
                @keyup.enter.native="handleQuery" />
            </el-form-item>
            <el-form-item label="标识KEY" prop="key">
              <el-input v-model="queryParams.key" placeholder="请输入标识KEY" clearable
                @keyup.enter.native="handleQuery" />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
              <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
            </el-form-item>
          </el-form>
        </el-card>
        <el-card shadow="hover">
          <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
              <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd">新增</el-button>
            </el-col>
            <el-col :span="1.5">
              <el-button type="success" :disabled="single" plain icon="el-icon-edit" size="mini" @click="handleEdit">编辑</el-button>
            </el-col>
            <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
          </el-row>
        </el-card>
        <el-card shadow="hover">
          <el-table border v-loading="loading" :data="modelList" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column align="center" type="index" label="序号" width="50"></el-table-column>
            <el-table-column align="center" prop="name" label="模型名称"></el-table-column>
            <el-table-column align="center" prop="key" label="标识KEY"></el-table-column>
            <el-table-column align="center" prop="version" label="版本号" width="90">
              <template slot-scope="{row}"> v{{ row.version }}.0</template>
            </el-table-column>
            <el-table-column align="center" prop="metaInfo" label="备注说明"></el-table-column>
            <el-table-column align="center" prop="createTime" label="创建时间"></el-table-column>
            <el-table-column align="center" prop="lastUpdateTime" label="更新时间"></el-table-column>
            <el-table-column label="操作" align="center" width="140">
              <template slot-scope="scope">
                <el-row :gutter="10" class="mb8">
                  <el-col :span="1.5">
                    <el-button type="text" size="small" icon="el-icon-thumb"
                      @click="clickDesign(scope.row.id)">设计流程</el-button>
                  </el-col>
                  <el-col :span="1.5">
                    <el-button type="text" size="small" icon="el-icon-download"
                      @click="clickExportZip(scope.row)">导出</el-button>
                  </el-col>
                </el-row>
                <el-row :gutter="10" class="mb8">
                  <el-col :span="1.5">
                    <el-button type="text" size="small" icon="el-icon-c-scale-to-original"
                      @click="clickDeploy(scope.row.id, scope.row.key)">流程部署</el-button>
                  </el-col>
                  <el-col :span="1.5">
                    <el-button size="mini" type="text" icon="el-icon-delete"
                      @click="handleDelete(scope.row)">删除</el-button>
                  </el-col>
                </el-row>
              </template>
            </el-table-column>
          </el-table>

          <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum"
            :limit.sync="queryParams.pageSize" @pagination="getList" />
        </el-card>
        <!-- 设计流程开始 -->
        <el-dialog title="设计模型" :before-close="handleClose" :visible.sync="bpmnJsModelVisible" v-if="bpmnJsModelVisible"
          fullscreen :modal-append-to-body='false'>
          <bpmnJs ref="bpmnJsModel" @close-bpmn="closeBpmn" :modelId="modelId" />
        </el-dialog>
        <!-- 设计流程结束 -->

        <el-dialog :title="title" :visible.sync="dialogVisible" width="50%"
          :close-on-click-modal="false">
          <el-card shadow="hover" v-loading="loading">
            <el-form ref="form" :model="form" :rules="rules" label-width="80px">
              <el-form-item label="模型分类" prop="categoryCode">
                <treeselect v-model="form.categoryCode" :normalizer="normalizer" style="width: 100%"
                  :options="categoryOptions" :show-count="true" placeholder="请选择分类" />
              </el-form-item>
              <el-form-item label="模型名称" prop="modelName">
                <el-input v-model="form.modelName" :disabled="disabled"></el-input>
              </el-form-item>
              <el-form-item label="模型KEY" prop="modelKey">
                <el-input v-model="form.modelKey" :disabled="disabled"></el-input>
              </el-form-item>
              <el-form-item label="备注">
                <el-input type="textarea" :rows="3" resize="none" placeholder="请输入内容" v-model="form.remark">
                </el-input>
              </el-form-item>
            </el-form>
          </el-card>
          <span slot="footer" class="dialog-footer">
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" :loading="buttonLoading" @click="submitForm('form')">确 定</el-button>
          </span>
        </el-dialog>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { list, add, del, deploy, getEditorXml,update } from "@/api/workflow/model";
import { categoryList } from "@/api/workflow/category";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import BpmnJs from './bpmnJs'
export default {
  name: 'Model', // 和对应路由表中配置的name值一致
  components: { BpmnJs, Treeselect },
  data () {
    return {
      // 按钮loading
      buttonLoading: false,
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
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
      // 是否显示弹出层
      bpmnJsModelVisible: false,
      // 模型定义表格数据
      modelList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: undefined,
        key: undefined,
        categoryCode: undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        categoryCode: [
          { required: true, message: "分类不能为空", trigger: "blur" }
        ],
        modelName: [
          { required: true, message: "模型名称不能为空", trigger: "blur" }
        ],
        modelKey: [
          { required: true, message: "模型KEY不能为空", trigger: "blur" }
        ]
      },
      modelId: null, // 模型id
      categoryOptions: [],
      defaultProps: {
        children: "children",
        label: "categoryName"
      },
      // 分类名称
      categoryName: '',
      dialogVisible: false,
      title:'',
      disabled: false
    }
  },
  watch: {
    // 根据名称筛选分类树
    categoryName (val) {
      this.$refs.tree.filter(val);
    }
  },
  created () {
    this.getList();
    this.getTreeCategoryList();
  },
  methods: {
    /** 搜索按钮操作 */
    handleQuery () {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery () {
      this.daterangeCreateTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange (selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    //分页
    getList () {
      this.loading = true;
      list(this.queryParams).then(response => {
        this.modelList = response.rows;
        this.total = response.total;
        this.loading = false;
      })
    },
    /** 删除按钮操作 */
    handleDelete (row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除模型KEY为【' + row.key + '】的数据项？').then(() => {
        this.loading = true;
        return del(ids);
      }).then(() => {
        this.loading = false;
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).finally(() => {
        this.loading = false;
      });
    },
    // 流程部署
    clickDeploy (id, key) {
      this.$modal.confirm('是否部署模型key为【' + key + '】流程？').then(() => {
        this.loading = true;
        return deploy(id);
      }).then(() => {
        this.loading = false;
        this.getList();
        this.$modal.msgSuccess("部署成功");
      }).finally(() => {
        this.loading = false;
      });
    },
    handleAdd () {
      this.title = '新增模型'
      this.form = {}
      this.dialogVisible = true
    },
    handleEdit () {
      this.title = '编辑模型'
      this.dialogVisible = true
      this.form = {
        modelId:undefined,
        modelKey:undefined,
        modelName:undefined,
        categoryCode:undefined,
        remark:undefined
      }
      this.$nextTick(()=>{
        this.loading = true
        this.disabled = true
        getEditorXml(this.ids[0]).then(response=>{
          let result = response.data.model
          this.form.modelId = result.id
          this.form.modelKey = result.key
          this.form.modelName = result.name
          this.form.categoryCode = result.category
          this.form.remark = result.metaInfo
          this.loading = false
        })
      })
    },
    /** 提交按钮 */
    submitForm (formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          if(this.form.modelId){
            this.buttonLoading = true;
            update(this.form).then(response => {
              this.$modal.msgSuccess("编辑成功");
              this.dialogVisible = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          }else{
            this.form.xml = this.init(this.form.modelKey, this.form.modelName)
            this.buttonLoading = true;
            add(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.dialogVisible = false;
              this.getList();
            }).finally(() => {
              this.buttonLoading = false;
            });
          }
        }
      });
    },
    // 打开设计流程
    clickDesign (id) {
      this.modelId = id
      this.bpmnJsModelVisible = true
    },
    // 关闭设计流程
    closeBpmn () {
      this.getList()
      this.bpmnJsModelVisible = false
    },
    handleClose () {
      this.$confirm('请记得点击保存按钮，确定关闭设计窗口?', '确认关闭', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.bpmnJsModelVisible = false
        // 刷新数据
        this.getList()
      }).catch(() => { })
    },
    // 导出流程模型
    clickExportZip (data) {
      this.$download.zip('/workflow/model/export/zip/' + data.id, data.name + "-" + data.key);
    },
    // 筛选节点
    filterNode (value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    /** 转换数据结构 */
    normalizer (node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.categoryCode,
        label: node.categoryName,
        children: node.children
      };
    },
    // 流程分类
    getTreeCategoryList () {
      categoryList().then(response => {
        this.categoryOptions = this.handleTree(response.data, "id", "parentId");
      });
    },
    // 节点单击事件
    handleNodeClick (data) {
      if (data.categoryCode === 'ALL') {
        this.queryParams.categoryCode = undefined
      } else {
        this.queryParams.categoryCode = data.categoryCode;
      }
      this.getList()
    },
    //初始化
    init (modelKey, modelName) {
      return `<?xml version="1.0" encoding="UTF-8"?>
          <definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:omgdc="http://www.omg.org/spec/DD/20100524/DC" xmlns:bioc="http://bpmn.io/schema/bpmn/biocolor/1.0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:flowable="http://flowable.org/bpmn" targetNamespace="http://www.flowable.org/processdef">
            <process id="${modelKey}" name="${modelName}">
              <startEvent id="startNode1" name="开始" />
            </process>
            <bpmndi:BPMNDiagram id="BPMNDiagram_flow">
              <bpmndi:BPMNPlane id="BPMNPlane_flow" bpmnElement="T-2d89e7a3-ba79-4abd-9f64-ea59621c258c">
                <bpmndi:BPMNShape id="BPMNShape_startNode1" bpmnElement="startNode1" bioc:stroke="">
                  <omgdc:Bounds x="240" y="200" width="30" height="30" />
                  <bpmndi:BPMNLabel>
                    <omgdc:Bounds x="242" y="237" width="23" height="14" />
                  </bpmndi:BPMNLabel>
                </bpmndi:BPMNShape>
              </bpmndi:BPMNPlane>
            </bpmndi:BPMNDiagram>
          </definitions>
          `
    }
  }

}
</script>
<style scoped lang="scss">
.custom-tree-node {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;
}

::v-deep .el-tree .el-tree-node__expand-icon.expanded {
  -webkit-transform: rotate(0deg);
  transform: rotate(0deg);
}

::v-deep .el-tree .el-icon-caret-right:before {
  content: "\e783";
  font-size: 18px;
}

::v-deep .el-tree .el-tree-node__expand-icon.expanded.el-icon-caret-right:before {
  content: "\e781";
  font-size: 18px;
}
</style>
