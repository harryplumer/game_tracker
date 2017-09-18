import React from 'react'
import {Item} from 'semantic-ui-react'
import TeamItem from './TeamItem'
 
class TeamList extends React.Component{
  state = {}

  render(){
    const teams = this.props.teams.map(t => <TeamItem key={t.id} {...t} updateTeam={this.props.updateTeam} destroyTeam={this.props.destroyTeam} />)
    return(
      <Item.Group>
        {teams}
      </Item.Group>
    )
  }


}

export default TeamList