import React, { Component } from 'react';
import {Container, Grid, Header} from 'semantic-ui-react'
import axios from 'axios'
import TeamList from './components/TeamList'
import TeamForm from './components/TeamForm'
class App extends Component {
  state = {teams: []}
  
  componentDidMount(){
    axios.get('api/teams')
      .then( res => this.setState({teams: res.data}))
  }

  addTeam = (name, abbrev) => {
    axios.post('/api/teams', { name, abbrev })
    .then( res => this.setState({ teams: res.data }) )
  }

  destroyTeam = (id) => {
    axios.delete(`/api/teams/${id}`)
    .then( () => {
      const { teams } = this.state;
      this.setState({ teams: teams.filter( t => t.id !== id ) })
    })
  }

  updateTeam = (id, name, abbrev) => {
    axios.put(`api/teams/${id}`, {name, abbrev})
    .then( res => this.setState({ teams: res.data }) )
  }
  
  render() {
    return (
      <Container>
        <Header as="h1" textAlign="center">Welcome To Football Game Tracker</Header>
        <Grid columns={2} divided>
          <Grid.Column>
            <TeamForm addTeam={this.addTeam} updateTeam={this.updateTeam} editing={false}/>
            <TeamList teams={this.state.teams} destroyTeam={this.destroyTeam} updateTeam={this.updateTeam}/>
          </Grid.Column>
          <Grid.Column>
            Games Module Goes Here
          </Grid.Column>
        </Grid>
      </Container>  
    );
  }
}

export default App;
