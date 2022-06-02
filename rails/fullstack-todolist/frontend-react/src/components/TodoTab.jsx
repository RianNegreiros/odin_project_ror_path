import React from 'react';
import { List } from 'antd';
import TodoItem from './TodoItem';

const TodoTab = ({ todos, onTodoRemoval, onTodoToggle }) => {
  return (
    <>
      <List
      dataSource={todos}
      renderItem={(todo) => {
        <TodoItem>
          todo={todo}
          onTodoToggle={onTodoToggle}
          onTodoRemoval={onTodoRemoval}
        </TodoItem>
      }}
      pagination={{
        position: 'bottom',
        pageSize: 10
      }}
      />
    </>
  )
}

export default TodoTab;