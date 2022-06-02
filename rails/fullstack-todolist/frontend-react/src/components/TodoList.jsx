import './TodoList.css';
import TodoForm from './TodoForm';
import TodoTab from './TodoTab';
import { Tabs, Layout, Row, Col, message } from 'antd';
import { useState } from 'react';
import { createTodo, deleteTodo, loadTodos, updateTodo } from '../services/todoService';
import { useCallback } from 'react';
import { useEffect } from 'react';
const { TabPane } = Tabs;
const { Content } = Layout;

const TodoList = () => {
  const [refreshing, setRefreshing] = useState(false);
  const [todos, setTodos] = useState([]);
  const [activeTodos, setActivesTodos] = useState([]);
  const [completedTodos, setCompletedTodos] = useState();

  const handleFormSubmit = (todo) => {
    createTodo(todo).then(onRefresh());
    message.warn('Todo removed');
  }

  const handleRemovedTodo = (todo) => {
    deleteTodo(todo.id).then(onRefresh());
    message.warn('Todo removed')
  }

  const handleToggleTodoStatus = (todo) => {
    todo.completed = !todo.completed;
    updateTodo(todo).then(onRefresh());
    message.info('Todo status updated!');
  }

  const refresh = () => {
    loadTodos()
    .then(json => {
      setTodos(json);
      setActivesTodos(json.filter(todo => todo.completed === false));
      setCompletedTodos(json.filter(todo => todo.completed === true));
    })
  }

  const onRefresh = useCallback( async () => {
    setRefreshing(true);
    let data = await loadTodos;
    setTodos(data);
    setActivesTodos(data.filter(todo => todo.completed === false));
    setCompletedTodos(data.filter(todo => todo.completed === true));
    setRefreshing(false);
  }, [refreshing]);

  useEffect(() => {
    refresh();
  }, [onRefresh])

  return (
    <Layout className='layout'>
      <Content style={{ padding: '0 50px' }}>
        <div className='todoList'>
          <Row>
            <Col>
              <h1>Todos</h1>
              <TodoForm onFormSubmit={handleFormSubmit} />
              <br />
              <Tabs defaultActiveKey="all">
                <TabPane tab="all" key="all">
                  <TodoTab todos={todos} onTodoToggle={handleToggleTodoStatus} onTodoRemoval={handleRemovedTodo} />
                </TabPane>
                <TabPane tab="active" key="active">
                <TodoTab todos={activeTodos} onTodoToggle={handleToggleTodoStatus} onTodoRemoval={handleRemovedTodo} />
                </TabPane>
                <TabPane tab="complete" key="complete">
                <TodoTab todos={completedTodos} onTodoToggle={handleToggleTodoStatus} onTodoRemoval={handleRemovedTodo} />
                </TabPane>
              </Tabs>
            </Col>
          </Row>
        </div>
      </Content>
    </Layout>
  )
}

export default TodoList;
