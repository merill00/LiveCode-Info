function createMenu(l){var e="null"===l?"":l;document.getElementById("panelContent").innerHTML='<div class="row"><div class="cols-4"><ul id="list-1" class="list"><li class="header">revIgniter</li><li class="item"><a href="'+e+'index.html">User Guide Home</a></li><li class="item"><a href="'+e+'toc.html">Table of Contents Page</a></li><li class="header">Basic Info</li><li class="item"><a href="'+e+'general/requirements.html">Server Requirements</a></li><li class="item"><a href="'+e+'license.html">License Agreement</a></li><li class="item"><a href="'+e+'changelog.html">Change Log</a></li><li class="item"><a href="'+e+'general/credits.html">Credits</a></li><li class="header">Installation</li><li class="item"><a href="'+e+'installation/downloads.html">Downloading revIgniter</a></li><li class="item"><a href="'+e+'installation/index.html">Installation Instructions</a></li><li class="item"><a href="'+e+'installation/upgrading.html">Upgrading from a Previous Version</a></li><li class="item"><a href="'+e+'installation/troubleshooting.html">Troubleshooting</a></li><li class="header">Introduction</li><li class="item"><a href="'+e+'overview/getting_started.html">Getting Started</a></li><li class="item"><a href="'+e+'overview/at_a_glance.html">revIgniter at a Glance</a></li><li class="item"><a href="'+e+'overview/cheatsheets.html">revIgniter Cheatsheets</a></li><li class="item"><a href="'+e+'overview/features.html">Supported Features</a></li><li class="item"><a href="'+e+'overview/appflow.html">Application Flow Chart</a></li><li class="item"><a href="'+e+'overview/mvc.html">Model-View-Controller</a></li><li class="item"><a href="'+e+'overview/hmvc.html">HMVC - Extending MVC</a></li><li class="item"><a href="'+e+'overview/goals.html">Architectural Goals</a></li></ul></div><div class="cols-4"><ul id="list-2" class="list"><li class="header">General Topics</li><li class="item"><a href="'+e+'general/urls.html">revIgniter URLs</a></li><li class="item"><a href="'+e+'general/controllers.html">Controllers</a></li><li class="item"><a href="'+e+'general/reserved_names.html">Reserved Names</a></li><li class="item"><a href="'+e+'general/views.html">Views</a></li><li class="item"><a href="'+e+'general/models.html">Models</a></li><li class="item"><a href="'+e+'general/helpers.html">Helpers</a></li><li class="item"><a href="'+e+'general/libraries.html">Using revIgniter Libraries</a></li><li class="item"><a href="'+e+'general/creating_libraries.html">Creating Your Own Libraries</a></li><li class="item"><a href="'+e+'general/core_libraries.html">Creating Core Libraries</a></li><li class="item"><a href="'+e+'general/using_stacks.html">Using Stacks</a></li><li class="item"><a href="'+e+'general/hooks.html">Hooks - Extending the Core</a></li><li class="item"><a href="'+e+'general/autoloader.html">Auto-loading Resources</a></li><li class="item"><a href="'+e+'general/common_handlers.html">Common Handlers</a></li><li class="item"><a href="'+e+'general/scaffolding.html">Scaffolding</a></li><li class="item"><a href="'+e+'general/routing.html">URI Routing</a></li><li class="item"><a href="'+e+'general/modules.html">Modules</a></li><li class="item"><a href="'+e+'general/extensions.html">Extensions</a></li><li class="item"><a href="'+e+'general/errors.html">Error Handling</a></li><li class="item"><a href="'+e+'general/caching.html">Caching</a></li><li class="item"><a href="'+e+'general/profiling.html">Profiling Your Application</a></li><li class="item"><a href="'+e+'general/managing_apps.html">Managing Applications</a></li><li class="item"><a href="'+e+'general/security.html">Security</a></li><li class="item"><a href="'+e+'general/cli.html">CLI</a></li><li class="header">Tutorial</li><li class="item"><a href="'+e+'tutorials/chat.html">Simple Chat Application</a></li></ul></div><div class="cols-4"><ul id="list-3" class="list"><li class="header">Library Reference</li><li class="item"><a href="'+e+'libraries/authentication/index.html">Authentication Library</a></li><li class="item"><a href="'+e+'libraries/benchmark.html">Benchmarking Library</a></li><li class="item"><a href="'+e+'libraries/calendar.html">Calendaring Library</a></li><li class="item"><a href="'+e+'libraries/captcha.html">Captcha Library</a></li><li class="item"><a href="'+e+'libraries/config.html">Config Library</a></li><li class="item"><a href="'+e+'database/index.html">Database Library</a></li><li class="item"><a href="'+e+'libraries/email.html">Email Library</a></li><li class="item"><a href="'+e+'libraries/encryption.html">Encryption Library</a></li><li class="item"><a href="'+e+'libraries/file_uploading.html">File Uploading Library</a></li><li class="item"><a href="'+e+'libraries/form_validation.html">Form Validation Library</a></li><li class="item"><a href="'+e+'libraries/ftp.html">FTP Library</a></li><li class="item"><a href="'+e+'libraries/table.html">HTML Table Library</a></li><li class="item"><a href="'+e+'libraries/image_lib.html">Image Manipulation Library</a></li><li class="item"><a href="'+e+'libraries/input.html">Input and Security Library</a></li><li class="item"><a href="'+e+'libraries/jquery.html">jQuery Library</a></li><li class="item"><a href="'+e+'libraries/language.html">Language Library</a></li><li class="item"><a href="'+e+'libraries/loader.html">Loader Library</a></li><li class="item"><a href="'+e+'libraries/modules.html">Modules Library</a></li><li class="item"><a href="'+e+'libraries/output.html">Output Library</a></li><li class="item"><a href="'+e+'libraries/pagination.html">Pagination Library</a></li><li class="item"><a href="'+e+'libraries/sessions.html">Session Library</a></li><li class="item"><a href="'+e+'libraries/trackback.html">Trackback Library</a></li><li class="item"><a href="'+e+'libraries/uri.html">URI Library</a></li><li class="item"><a href="'+e+'libraries/user_agent.html">User Agent Library</a></li></ul></div><div class="cols-4"><ul id="list-4" class="list"><li class="header">Helper Reference</li><li class="item"><a href="'+e+'helpers/array_helper.html">Array Helper</a></li><li class="item"><a href="'+e+'helpers/asset_helper.html">Asset Helper</a></li><li class="item"><a href="'+e+'helpers/cookie_helper.html">Cookie Helper</a></li><li class="item"><a href="'+e+'helpers/date_helper.html">Date Helper</a></li><li class="item"><a href="'+e+'helpers/download_helper.html">Download Helper</a></li><li class="item"><a href="'+e+'helpers/email_helper.html">Email Helper</a></li><li class="item"><a href="'+e+'helpers/file_helper.html">File Helper</a></li><li class="item"><a href="'+e+'helpers/form_helper.html">Form Helper</a></li><li class="item"><a href="'+e+'helpers/formmail_helper.html">Form-Mail Helper</a></li><li class="item"><a href="'+e+'helpers/galleria_helper.html">Galleria Helper</a></li><li class="item"><a href="'+e+'helpers/html_helper.html">HTML Helper</a></li><li class="item"><a href="'+e+'helpers/jwt_helper.html">JWT Helper</a></li><li class="item"><a href="'+e+'helpers/language_helper.html">Language Helper</a></li><li class="item"><a href="'+e+'helpers/markdown_helper.html">Markdown Helper</a></li><li class="item"><a href="'+e+'helpers/otp_helper.html">OTP Helper</a></li><li class="item"><a href="'+e+'helpers/querytojson_helper.html">QueryToJSON Helper</a></li><li class="item"><a href="'+e+'helpers/queryvalues_helper.html">QueryValues Helper</a></li><li class="item"><a href="'+e+'helpers/sitelinks_helper.html">SiteLinks Helper</a></li><li class="item"><a href="'+e+'helpers/string_helper.html">String Helper</a></li><li class="item"><a href="'+e+'helpers/url_helper.html">URL Helper</a></li><li class="item"><a href="'+e+'helpers/xml_helper.html">XML Helper</a></li></ul></div></div>'}