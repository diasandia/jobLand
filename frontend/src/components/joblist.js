import React, {Component} from 'react';


class Joblist extends Component {

  render(){
    const job = this.props.job
    return(
      <div>
        <p>
          <strong>{job.company} </strong> : {job.job_title}
        </p>
      </div>
      )
 }
}

export default Joblist;