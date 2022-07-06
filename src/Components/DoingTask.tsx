import React from "react";
import {Doing} from "./Interface";
import './todo.css'

interface Props{
    task: Doing;
    CheckedTask(CheCke:string):void;
}
const DoingTask = ( {task,CheckedTask} : Props)=>{
    return(
        <>
            <div className="task">
                <div className="content">
                    <span>{task.doingContent }</span>
                    <button onClick={
                        ()=>{
                            CheckedTask(task.doingContent)
                        }
                    }> X</button>
                </div>
            </div>
        </>
    )
}

export default DoingTask;