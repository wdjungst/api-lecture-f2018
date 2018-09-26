import React from 'react'
import { Grid, Button } from 'semantic-ui-react'
import axios from 'axios'
import Tweets from './Tweets'

class App extends React.Component {
  state = { tweets: [] }

  getTweets = () => {
    axios.get('/api/tweets')
      .then( res => this.setState({ tweets: res.data }) )
  }

  render() {
    return (
      <div>
        <Button onClick={this.getTweets}>Click Me</Button>
        <Grid>
          <Grid.Row>
            <Grid.Column mobile={16} tablet={16} computer={4}>
            </Grid.Column>
            <Grid.Column mobile={16} tablet={16} computer={12}>
              <Tweets tweets={this.state.tweets} />
            </Grid.Column>
          </Grid.Row>
        </Grid>
      </div>
    )
  }
}

export default App
