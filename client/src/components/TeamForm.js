import React from 'react';
import {Form} from 'semantic-ui-react'
class TeamForm extends React.Component{
  state = {team: {id: 0, name: "", abbrev: ""}, editing: false}

  componentDidMount(){
    if (this.props.editing)
      this.setState({team: {name: this.props.team.name, abbrev:this.props.team.abbrev}, editing: true })
  }

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
    if (this.state.editing === false)
      this.props.addTeam(team.name, team.abbrev)
    else
      this.props.updateTeam(team.id, team.name, team.abbrev)    
    this.setState({team: {name: "", abbrev: ""}})
  }

  render(){
    return(
      <Form onSubmit={this.handleSubmit}>
        <Form.Group>
          <Form.Input
            required
            label="Team Name"
            value={this.state.team.name}
            onChange={this.handleChange("name")}
            width={8}
          />
          <Form.Input
            required
            label="Abbreviation"
            value={this.state.team.abbrev}
            onChange={this.handleChange("abbrev")}
            width={8}
          />
        </Form.Group>
        <Form.Button primary>Save</Form.Button>
      </Form>
    )
  }
}

export default TeamForm