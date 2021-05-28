import React from "react"
import PropTypes from 'prop-types'
import { Button } from '@material-ui/core';

const usersBasePath = "/users"
const signInPath = `${usersBasePath}/sign_in`
const signOutPath = `${usersBasePath}/sign_out`
const signUpPath = `${usersBasePath}/sign_up`

function accountButtons(token, userSignedIn) {
  if (userSignedIn) {
    return (
      <form className="buttonTo" method="post" action={signOutPath}>
        <Button color="primary" type="submit">Logout</Button>
        <input type="hidden" name="_method" value="delete" />
        <input type="hidden" name="authenticity_token" value={token} />
      </form>
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
    {accountButtons(props.token, props.userSignedIn)}
  </div>
)

Header.defaultProps = {
  userSignedIn: false,
}

Header.propTypes = {
  token: PropTypes.string,
  userSignedIn: PropTypes.bool,
}

export default Header
