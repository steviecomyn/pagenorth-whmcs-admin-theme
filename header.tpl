<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="{$charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>WHMCS - {$pagetitle}</title>

    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600" rel="stylesheet">
    <link href="templates/{$template}/css/all.min.css?v={$versionHash}" rel="stylesheet" />
    <link href="templates/{$template}/css/theme.min.css?v={$versionHash}" rel="stylesheet" />
    <link href="templates/{$template}/css/pn-style.css" rel="stylesheet" />
    <link href="{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}/assets/css/fontawesome-all.min.css" rel="stylesheet" />
    <script type="text/javascript" src="templates/{$template}/js/vendor.min.js?v={$versionHash}"></script>
    <script type="text/javascript" src="templates/{$template}/js/scripts.min.js?v={$versionHash}"></script>
    <script>
        var datepickerformat = "{$datepickerformat}",
            csrfToken="{$csrfToken}",
            adminBaseRoutePath = "{\WHMCS\Admin\AdminServiceProvider::getAdminRouteBase()}",
            whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}";

        {if $jquerycode}
            $(document).ready(function(){ldelim}
                {$jquerycode}
            {rdelim});
        {/if}
        {if $jscode}
            {$jscode}
        {/if}
    </script>

    {$headoutput}

    <link rel="apple-touch-icon" sizes="180x180" href="templates/{$template}/images/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="templates/{$template}/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="templates/{$template}/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="templates/{$template}/images/favicons/site.webmanifest">
    <link rel="mask-icon" href="templates/{$template}/images/favicons/safari-pinned-tab.svg" color="#92c13e">
    <link rel="shortcut icon" href="templates/{$template}/images/favicons/favicon.ico">
    <meta name="apple-mobile-web-app-title" content="PageNorth Helpdesk Admin">
    <meta name="application-name" content="PageNorth Helpdesk Admin">
    <meta name="msapplication-TileColor" content="#2b5797">
    <meta name="msapplication-config" content="templates/{$template}/images/favicons/browserconfig.xml">
    <meta name="theme-color" content="#1e2c55">

    <style>
        /* PageNorth Customisations */

        :root {
            --pn-blue: #1e2c55;
            --pn-green: #92c13e;
            --pn-green-darker: #7ca92f;
            --pn-green-highlight: #e1edcc;
        }

        /* Styles the PageNorth Header section */
        .pn-header {
            background-color: #f5f5f5;
            padding: 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        /* Sets the logo size */
        .pn-header .logo img {
            width: 180px;
        }

        /* Styles the navbar */
        .navigation {
            background-color: var(--pn-blue);
        }

        /* Colours the search icon button */
        #intelliSearchForm > form > i {
            background-color: var(--pn-blue);
        }

        /* remove rounding from cards, buttons and inputs 
        .card, .btn, .form-control { border-radius: 0; } */

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

        .btn-primary .badge {
            color: #fff;
            background-color: var(--pn-blue);
            margin-left: 8px;
            padding-top: 2px;
        }

        /* Changes the stat boxes on the frontpage */
        .ticketstatbox {
            background-color: var(--pn-green-highlight) !important;
        }

        h2.ticket-subject {
            font-weight: bold;
        }

        .footerbar {
            padding: 2rem;
            background-color: var(--pn-blue);
        }

        .navigation ul li ul li:not(.disabled) a:hover {
            background-color: var(--pn-blue) !important;
            color: #fff;
        }

        .navigation ul li ul {
            background-color: var(--pn-green-highlight);
        }

        .sidebar {
            background-color: var(--pn-green-highlight);
        }

        .sidebar .sidebar-header i {
            color: var(--pn-blue);
        }

        /* removes the spacing between cells */
        table.datatable {
            border-spacing: 0px;
        }

        /* Changes the hover highlight color */
        .datatable tr:hover td {
            background-color: var(--pn-green-highlight) !important;
        }
        /* Colors the table header */
        table.datatable th {
            padding: 8px;
            background-color: var(--pn-blue);
            border-radius: 0px;
        }
   
        @media only screen and (max-width: 600px) {

            /* Styles the PageNorth Header section */
            .pn-header {
                background-color: #f5f5f5;
                padding: 1rem;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
            }

            /* Sets the logo size */
            .pn-header .logo img {
                width: 240px;
            }

        }
    </style>

</head>
<body class="{if empty($sidebar)}no-sidebar{/if}{if $globalAdminWarningMsg} has-warning-banner{/if}" data-phone-cc-input="{$phoneNumberInputStyle}">

    {$headeroutput}

    <div class="alert alert-warning global-admin-warning">
        {$globalAdminWarningMsg}
    </div>

    <div class="pn-header">
        <a href="index.php" class="logo" title="{$_ADMINLANG.home.title}">
            <img src="templates/{$template}/images/page-north-logo.svg">
        </a>
        <div class="pn-quicklinks">
            <a href="supporttickets.php?view=active" class="active-tickets btn btn-primary">
                Active Tickets<span class="badge badge-warning">{$ticketsallactive}</span>
            </a>
            <a href="logout.php" class="btn btn-default">
                <i class="fas fa-sign-out-alt" style="margin-right: 8px;"></i>Logout
            </a>
        </div>
    </div>

    <div class="navigation">
        {include file="$template/nav.tpl"}
    </div>

    <div class="sidebar{if $minsidebar} minimized{/if}" id="sidebar">
        <a href="#" class="sidebar-collapse-expand" id="sidebarCollapseExpand">
            <i class="fa fa-chevron-down"></i>
        </a>
        <div class="sidebar-collapse">
            {include file="$template/sidebar.tpl"}
        </div>
    </div>
    <a href="#" class="sidebar-opener{if $minsidebar} minimized{/if}" id="sidebarOpener">
        {$_ADMINLANG.openSidebar}
    </a>

    <div class="contentarea{if $minsidebar} sidebar-minimized{/if}" id="contentarea">
        <div style="float:left;width:100%;">
            <h1{if $pagetitle == $_ADMINLANG.global.hometitle} class="pull-left"{/if}>{$pagetitle}</h1>