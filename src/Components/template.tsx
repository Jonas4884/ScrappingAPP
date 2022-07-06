import React, {ChangeEvent, FC, useState} from "react";
import './template.css';
import {Task,Doing,Done} from "./Interface";
import TodoTask from "./TodoTask";
import DoingTask from "./DoingTask";
import DoneTask from "./DoneTask";



const FormBase: FC = ()=>{
    const [add,setAdd]=useState<string>("")
    const [todo,setTodoList]=useState<Task[]>([]);
    const [doing,setDoing]=useState<Doing[]>([]);
    const [done,setDone]=useState<Done[]>([]);

    const handleChange  = (event: ChangeEvent<HTMLInputElement>) : void => {
               setAdd(event.target.value)
      };
const addIng = ():void => {
    const newTask = {
        taskName : add
    }
    setAdd("");
    setTodoList([...todo,newTask]);
    }
    const addIng1 = ():void => {
        const newDoing = {
            doingContent : add
        }
        setAdd("");
        setDoing([...doing,newDoing]);
    }
    const addIng2 = ():void => {
        const newDone = {
            DoneContent : add
        }
        setAdd("");
        setDone([...done,newDone]);
    }
    const TaskAreaToDelete = (TaskToDelete:string):void =>{
    setTodoList(todo.filter((task)=>{
        return task.taskName !=TaskToDelete
    }))
    }
    const DoingToDelete = (TaskToDelete:string):void =>{
        setDoing(doing.filter((task)=>{
            return task.doingContent !=TaskToDelete
        }))
    }
    const DoneToDelete = (TaskToDelete:string):void =>{
        setDone(done.filter((task)=>{
            return task.DoneContent !=TaskToDelete
        }))
    }
    return(
        <div className="One">
            <div className="head"> TO DO LIST</div>
                <div className="colonne">
                    <input type="text" onChange={handleChange} value={add}/>
                    <div className="row">
                        <button onClick={addIng} className="btn depth">TO DO</button>
                        <button onClick={addIng1} className="btn depth">DOING</button>
                        <button onClick={addIng2} className="btn depth">DONE</button>
                    </div>


                </div>
            <div className="List">
                <div className="perso1">
                    <h2>To DO LIST</h2>
                        <div className="todo">
                            {todo.map((task,key)=>{
                                    return (
                                        <div className="doucement">
                                            <TodoTask key={key} task={task}  TaskAreaToDelete={TaskAreaToDelete}/>
                                        </div>

                                    )
                                }
                            )
                            }

                        </div>


                </div>

                    <div className="perso1">
                        <h2 className="">Doing</h2>
                        <div className="doing">
                        {doing.map((doing,key)=>{

                                return  (
                                    <div className="doucement">
                                        <DoingTask key={key} task={doing} CheckedTask={DoingToDelete}/>
                                    </div>


                                )

                            }
                        )
                        }
                    </div>

                </div>
               <div className="perso1">
                   <h2 className="">Task Done</h2>
                   <div className="done">
                       {done.map((done,key)=>{
                               return (
                                   <div className="doucement">
                                       <DoneTask key={key} task={done} DoneToDelete={DoneToDelete}/>
                                   </div>
                               )
                           }
                       )
                       }
                   </div>
               </div>

            </div>
        </div>
    )
}

export default FormBase;