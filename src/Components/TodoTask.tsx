import React from "react";
import {Task} from "./Interface";
import './todo.css'
interface Props{
    task: Task;
    TaskAreaToDelete(TaskToDelete:string):void;
}
const TodoTask = ( {task,TaskAreaToDelete} : Props)=>{

    return(
        <>
            <div className="task">
               <div className="content">
                   <span>{task.taskName }</span>
                   <button className="" onClick={
                       ()=>{
                           TaskAreaToDelete(task.taskName)
                       }
                   }> X</button>
               </div>
            </div>
        </>
    )
}

export default TodoTask;