import React from 'react'
import {Item, Button, Form} from 'semantic-ui-react'
import TeamForm from './TeamForm'

class TeamItem extends React.Component{
  state = {editing: false, team: {id: this.props.id, name: this.props.name, abbrev: this.props.abbrev}}

  handleChange = (propertyName) => (event) => {
    const { team } = this.state
    const newTeam = {
      ...team,
      [propertyName]: event.target.value
    };
    this.setState({ team: newTeam })
  }

  handleSubmit = (e) => {
    e.preventDefault()
    const {team} = this.state
    this.props.updateTeam(team.id, team.name, team.abbrev)
    this.setState({editing: false, team: {name: "", abbrev: ""}})
  }

  render(){
    if (this.state.editing === false){
      return(
        <Item>
          <Item.Content>
            <Item.Header>
              {this.props.name} ({this.props.abbrev})
            </Item.Header>
            <Item.Extra>
              <Button color='green' size='small'>Show Roster</Button>
              <Button size='tiny' color='yellow' onClick={() => this.setState({editing: true})}>Edit</Button>
              <Button size='tiny' color='red' onClick={() => this.props.destroyTeam(this.props.id)}>Delete</Button>
            </Item.Extra>
          </Item.Content>
        </Item>
      )
    }
    else{
      return(
        <TeamForm addTeam={this.addTeam} updateTeam={this.updateTeam} team={this.state.team} editing={true} />
      )
    }
  }



}

export default TeamItem