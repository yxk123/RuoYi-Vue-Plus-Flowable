import { listMessage,readMessage,readAll } from "@/api/workflow/message";
import store from '@/store'
const notice = {
    state: {
        notices: []
    },
    mutations: {
        //添加
        ADD_NOTICE: (state, notice) => {
            let data = {
                id : notice.id,
                title : notice.title,
                readTime : notice.readTime,
                messageContent : notice.messageContent,
                createTime : notice.createTime
            }
            state.notices.push(data);
        },
        //消息列表
        MESSAGE_LIST(state, data) {
            if(data && data.length > 0){
              state.notices = []
              data.forEach(notice => {
                let data = {
                  id : notice.id,
                  title : notice.title,
                  readTime : notice.readTime,
                  messageContent : notice.messageContent,
                  createTime : notice.createTime
                }
                state.notices.push(data)
              });
            }
        },
        //实现全部已读
        READ_ALL(state) {
            state.notices = []
        }
    },
    actions: {
        //添加
        addNotice({ commit }, data) {
            commit('ADD_NOTICE', data)
        },
        //清空
        clearNotice({ commit }) {
            commit('CLEAR_NOTICE')
        },
        //阅读消息
        readMessage({ commit }, id) {
            return new Promise((resolve, reject) => {
              readMessage(id).then(response => {
                store.dispatch('listMessage')
                resolve(response)
              }).catch(error => {
                reject(error)
              })
            })
        },
        //阅读全部消息
        readAll({ commit }) {
            return new Promise((resolve, reject) => {
              readAll().then(response => {
                commit('READ_ALL')
                resolve(response)
              }).catch(error => {
                reject(error)
              })
            })
        },
        //消息列表
        listMessage({ commit }) {
          return new Promise((resolve, reject) => {
            listMessage({pageNum:1,pageSize:3,type:'ALL',readTime:null}).then(response => {
              commit('MESSAGE_LIST',response.rows)
              resolve(response)
            }).catch(error => {
              reject(error)
            })
          })
        }
    }
}

export default notice
