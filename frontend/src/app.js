import React, {Component} from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';


//components
// import Header from './components/header'
// import Description from './components/description'
// import Scorecard from './components/scorecard'
// import Joburl from './components/joburl'
import Joblist from './components/joblist'

class App extends Component {

  constructor(props) {
    super(props);
    this.state = { jobindex: []
    };
    this.getJobindex = this.getJobindex.bind(this);
  }

  componentDidMount(){
    this.getJobindex();
  }

  getJobindex(){
    axios.get('http://localhost:3000/jobs')
    .then(response => {
      console.log(response)
      this.setState({
        jobindex: response.data
      })
    })
      .catch(function(error){
        console.log(error);
      });
    }

    render() {
      return (
        <div className="container">
          <h1>JOBS</h1>

          <div classname= "joblist">

            {this.state.jobindex.map((job, indx) => (
                <Joblist job={job} key={indx} />
              ))}
          }
          </div>
        </div>
        )
    }


  }

export default App;