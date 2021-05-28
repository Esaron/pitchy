import React from "react"
import PropTypes from 'prop-types'
import { Button } from '@material-ui/core';

const usersBasePath = "/users"
const signInPath = `${usersBasePath}/sign_in`
const signOutPath = `${usersBasePath}/sign_out`
const signUpPath = `${usersBasePath}/sign_up`

function accountButtons(token, username) {
  if (username) {
    return (
      <span className="flex">
        <Button className="account-button" href={`${usersBasePath}/${username}`}>Profile</Button>
        <form className="buttonTo" method="post" action={signOutPath}>
          <Button className="account-button" type="submit">Logout</Button>
          <input type="hidden" name="_method" value="delete" />
          <input type="hidden" name="authenticity_token" value={token} />
        </form>
      </span>
    )
  } else {
    return (
      <span>
        <Button className="account-button" href={signInPath}>Login</Button>
        <Button className="account-button" href={signUpPath}>Sign Up</Button>
      </span>
    )
  }
}

const Header = props => (
  <div className="header">
    <a className="home-link" href="/">Pitchy</a>
    {accountButtons(props.token, props.username)}
  </div>
)

Header.defaultProps = {
  userSignedIn: false,
}

Header.propTypes = {
  token: PropTypes.string,
  username: PropTypes.string,
}

export default Header
