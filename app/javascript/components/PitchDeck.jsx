import React from "react"
import PropTypes from 'prop-types'
import axios from 'axios'

const projectBasePath = '/projects'

class PitchDeck extends React.Component {
  constructor(props) {
    super(props)
    this.state = { urls: [] }
    this.fetchSlideUrls().then((urls) => { this.setState({ urls: urls }) })
  }

  async fetchSlideUrls() {
    const response = await axios.get(`${projectBasePath}/${this.props.projectName}/slides`)
    return response.data.urls
  }

  generateImages(url, index) {
    return <img key={index} src={url} className="slide" />
  }

  render() {
    return (
      <div>
        {this.state.urls.map(this.generateImages)}
      </div>
    )
  }
}

PitchDeck.defaultProps = {
  projectName: null,
}

PitchDeck.propTypes = {
  projectName: PropTypes.string,
}

export default PitchDeck
