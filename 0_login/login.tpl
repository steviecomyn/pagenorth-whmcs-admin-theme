<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>WHMCS - Login</title>

        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600" rel="stylesheet">
        <link href="templates/login.min.css" rel="stylesheet">
        <link href="templates/pagenorth-admin-theme/0_login/pn-login-style.css" rel="stylesheet">

        <link rel="apple-touch-icon" sizes="180x180" href="templates/pagenorth-admin-theme/images/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="templates/pagenorth-admin-theme/images/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="templates/pagenorth-admin-theme/images/favicons/favicon-16x16.png">
        <link rel="manifest" href="templates/pagenorth-admin-theme/images/favicons/site.webmanifest">
        <link rel="mask-icon" href="templates/pagenorth-admin-theme/images/favicons/safari-pinned-tab.svg" color="#92c13e">
        <link rel="shortcut icon" href="templates/pagenorth-admin-theme/images/favicons/favicon.ico">
        <meta name="apple-mobile-web-app-title" content="PageNorth Helpdesk Admin">
        <meta name="application-name" content="PageNorth Helpdesk Admin">
        <meta name="msapplication-TileColor" content="#2b5797">
        <meta name="msapplication-config" content="templates/pagenorth-admin-theme/images/favicons/browserconfig.xml">
        <meta name="theme-color" content="#1e2c55">

        <style>
            /* PageNorth Login Screen Customisations */
            :root {
                --pn-blue: #1e2c55;
                --pn-green: #92c13e;
                --pn-green-darker: #7ca92f;
                --pn-green-highlight: #e1edcc;
            }

            body {
                background-color: var(--pn-blue);
            }

            .login-container .logo img {
                width: 240px;
            }

            /* Styles all buttons to pagenorth green */
            .btn-primary {
                color: #fff;
                font-weight: bold;
                background-color: var(--pn-green);
                border-color: var(--pn-green-darker);
            }

            .btn-primary:hover, .btn-primary:focus, .btn-primary:active {
                background-color: var(--pn-green-darker);
                border-color: var(--pn-green-darker);
            }

            .btn-primary.active.focus, .btn-primary.active:focus, .btn-primary.active:hover, .btn-primary:active.focus, .btn-primary:active:focus, .btn-primary:active:hover, .open>.dropdown-toggle.btn-primary.focus, .open>.dropdown-toggle.btn-primary:focus, .open>.dropdown-toggle.btn-primary:hover {
                color: #fff;
                background-color: var(--pn-green-darker);
                border-color: var(--pn-green-darker);
            }
        </style>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
      </head>
      <body>
        <div class="login-container">
            <h1 class="logo">
                <a href="login.php">
                    <img src="templates/pagenorth-admin-theme/images/page-north-logo-white-text.svg" alt="PageNorth" />
                </a>
            </h1>
            <div class="login-body">
                <h2>{$displayTitle}</h2>
                {if $infoMsg}
                    <div id="alertLoginInfo" class="alert alert-info text-center" role="alert">
                        {$infoMsg}
                    </div>
                {/if}
                {if $successMsg}
                    <div id="alertLoginSuccess" class="alert alert-success text-center" role="alert">
                        {$successMsg}
                    </div>
                {/if}
                {if $errorMsg}
                    <div id="alertLoginError" class="alert alert-danger text-center" role="alert">
                        {$errorMsg}
                    </div>
                {/if}
                {if $step eq "login"}
                    <form method="post" action="dologin.php">
                        <input type="hidden" name="language" id="inputLanguage" />
                        <input type="hidden" name="redirect" value="{$redirectUri}" />
                        <div class="form-group">
                            <input type="text" name="username" class="form-control" placeholder="Username" autofocus />
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="Password" />
                        </div>
                        {if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}
                            {if $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
                                <div class="form-group recaptcha-container"></div>
                            {/if}
                            {if !$captcha->recaptcha->isEnabled()}
                                <div class="form-group captcha-container text-center">
                                    <p>
                                        Please enter the characters you see in the image below into the text box provided.
                                        This is required to prevent automated submissions.
                                    </p>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <img id="inputCaptchaImage" class="captchaimage" src="../includes/verifyimage.php" align="middle" />
                                        </div>

                                        <div class="col-xs-6">
                                            <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control" autocomplete="off"/>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        {/if}
                        <div class="row">
                            <div class="col-sm-7">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="rememberme" value="1">
                                        Remember me
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <input type="submit" value="Login" class="btn btn-primary btn-block{$captcha->getButtonClass($captchaForm)}">
                            </div>
                        </div>
                    </form>
                {elseif $step eq "reset"}
                    <form action="login.php" method="post" id="{if $verify}frmPasswordChange{else}frmResetPassword{/if}">
                        <input type="hidden" name="action" value="reset" />
                        {if $verify}
                            <input type="hidden" name="sub" value="newPassword" />
                            <input type="hidden" name="verify" value="{$verify}" />
                            <div class="form-group">
                                <input type="password" id="password" name="password" class="form-control" placeholder="New Password" autofocus autocomplete="off" data-placement="left" data-trigger="manual" />
                                <span class="form-control-feedback glyphicon glyphicon-password"></span>
                            </div>
                            <div class="form-group">
                                <input type="password" id="passwordConfirm" name="password2" class="form-control" placeholder="New Password (verify)" autocomplete="off" data-placement="left" data-trigger="manual" />
                                <span class="form-control-feedback glyphicon glyphicon-password"></span>
                            </div>
                            <div class="form-group">
                                <input type="submit" id="setPasswordButton" value="Reset Password" class="btn btn-primary btn-block{$captcha->getButtonClass($captchaForm)}" />
                            </div>
                        {else}
                            <input type="hidden" name="sub" value="send" />
                            <div class="form-group">
                                <input type="text" name="email" class="form-control" placeholder="Username or Email address" autofocus />
                            </div>
                            {if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}
                                {if $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
                                    <div class="form-group recaptcha-container"></div>
                                {/if}
                                {if !$captcha->recaptcha->isEnabled()}
                                    <div class="form-group captcha-container text-center">
                                        <p>
                                            Please enter the characters you see in the image below into the text box provided.
                                            This is required to prevent automated submissions.
                                        </p>
                                        <div class="row">
                                            <div class="col-xs-6">
                                                <img id="inputCaptchaImage" class="captchaimage" src="../includes/verifyimage.php" align="middle" />
                                            </div>

                                            <div class="col-xs-6">
                                                <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control" autocomplete="off"/>
                                            </div>
                                        </div>
                                    </div>
                                {/if}
                            {/if}
                            <div class="form-group">
                                <input type="submit" value="Reset Password" class="btn btn-primary btn-block{$captcha->getButtonClass($captchaForm)}" />
                            </div>
                        {/if}
                    </form>
                {elseif $step eq "twofa"}
                    <div class="text-center" align="center">
                        <form method="post" action="{$issuerurl}dologin.php" role="form">
                            {$challengeHtml}
                        </form>
                    </div>
                {elseif $step eq "twofabackupcode"}
                    {if $successMsg}
                        <p>Write this down on paper and keep it safe.<br />It will be needed if you ever lose your 2nd factor device or it is unavailable to you again in future.</p>
                        <form method="post" action="dologin.php">
                            <input type="hidden" name="redirect" value="{$redirectUri}" />
                            <div class="form-group">
                                <input type="submit" value="Continue &raquo;" class="btn btn-primary btn-block" />
                            </div>
                        </form>
                    {else}
                        <form action="dologin.php" method="post">
                            <input type="hidden" name="backupcode" value="1" />
                            <input type="hidden" name="redirect" value="{$redirectUri}" />
                            <div class="form-group">
                                <input type="text" name="code" class="form-control" placeholder="Backup code" autofocus />
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Login" class="btn btn-primary btn-block" />
                            </div>
                        </form>
                    {/if}
                {/if}
            </div>
            <div class="footer">
                {if $step eq "login"}
                    {if $showPasswordResetLink}
                        <a href="login.php?action=reset">
                            Forgot password?
                        </a>
                    {else}
                        <span>&nbsp;</span>
                    {/if}
                {elseif $step eq "reset"}
                    <a href="login.php">
                        &laquo; Back to Login
                    </a>
                {elseif $step eq "twofa"}
                    <a href="login.php?{if $redirectUri}redirect={$redirectUri|urlencode}&amp;{/if}backupcode=1">
                        Can't Access Your 2nd Factor Device?<br />Login using Backup Code
                    </a>
                {/if}
            </div>
        </div>
        <div class="language-chooser">
            <div class="btn-group pull-right">
                <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span id="languageName">Choose Language</span> <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    {foreach $languages as $language}
                        <li><a href="#">{$language|ucfirst}</a></li>
                    {/foreach}
                </ul>
            </div>
        </div>
        <div class="poweredby text-center">
            <a href="http://www.pagenorth.co.uk/" target="_blank">Powered by PageNorth ltd</a>
        </div>
        <script type="text/javascript">
            var recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
        </script>
        <script type="text/javascript" src="templates/login.min.js"></script>
    </body>
</html>
