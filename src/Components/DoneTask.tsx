import React from "react";
import {Done} from "./Interface";
import './todo.css'

interface Props{
    task: Done;
    DoneToDelete(Delete:string):void;
}
const DoneTask = ( {task,DoneToDelete} : Props)=>{

    return(
        <>
            <div className="task">
                <div className="content">
                    <span>{task.DoneContent }</span>
                    <button onClick={()=>{
                        DoneToDelete(task.DoneContent)
                    }
                    }> X</button>
                </div>
            </div>
        </>
    )
}

export default DoneTask;