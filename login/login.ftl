<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "custom-login">
        <div class="login-in__container">
            <div class="login-in__left-side">
                <img src="${url.resourcesPath}/img/mine/signIn.svg" alt="login image">
            </div>

            <div class="login-in__right-side">
                <div class="right-side__header">
                    <h1>DSS</h1>
                    <h3>Welcome to DSS</h3>
                    <div class="right-side__splitter">
                        <p>
                            <span>Sign in with email</span>
                        </p>
                    </div>
                </div>
                <div class="login-form__container">
                    <#if realm.password>
                        <form id="kc-form-login" class="login-form"
                              onsubmit="login.disabled = true; return true;"
                              action="${url.loginAction}" method="post">
<#-------------------------------------------- username/email --------------------------------------------------------->
                            <#if !usernameHidden??>
                                <div class="username">

                                    <label for="username" class="">
                                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                        <#else>${msg("email")}</#if>
                                    </label>

                                    <input tabindex="1" id="username" class="" name="username"
                                           value="${(login.username!'')}"
                                           type="text" autofocus autocomplete="off"
                                           placeholder="${msg("emailPlaceholder")}"
                                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                    />

                                    <#-- field errors: we can handle them our own way, in the future  -->
                                    <#if messagesPerField.existsError('username','password')>
                                        <span id="input-error" class="" aria-live="polite">
                                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                        </span>
                                    </#if>
                                    <#-- End of: field errors -->
                                </div>
                            </#if>
<#-------------------------------------------- End of: username/email --------------------------------------------------------->
<#-------------------------------------------- Password --------------------------------------------------------->
                            <div class="password">
                                <label for="password" class="">${msg("password")}</label>

                                <input tabindex="2" id="password" class=""
                                       name="password" type="password" autocomplete="off"
                                       placeholder="${msg("passwordPlaceholder")}"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                />

                                <#-- field errors: we can handle them our own way, in the future  -->
                                <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                    <span id="input-error" class="" aria-live="polite">
                                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                         </span>
                                </#if>
                                <#-- End of: field errors -->
                            </div>
<#-------------------------------------------- End of: Password --------------------------------------------------------->
<#-------------------------------------------- Remember me and forget password --------------------------------------------------------->
                            <div class="remember-me-and-forget-password">
<#-------------------------------------------- Remember me --------------------------------------------------------->
                                <#if realm.rememberMe && !usernameHidden??>
                                    <div id="kc-form-options" class="remember-me-container">
                                        <label>
                                            <#if login.rememberMe??>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                                ${msg("rememberMe")}
                                            <#else>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">
                                                ${msg("rememberMe")}
                                            </#if>
                                        </label>
                                    </div>
                                </#if>
<#--------------------------------------------  forget password --------------------------------------------------------->
                                <div class="password-container">
                                    <#if realm.resetPasswordAllowed>
                                        <span>
                                            <a tabindex="5" href="${url.loginResetCredentialsUrl}">
                                                ${msg("doForgotPassword")}
                                            </a>
                                        </span>
                                    </#if>
                                </div>
                            </div>
<#-------------------------------------------- End of: Remember me and forget password --------------------------------------------------------->
<#-------------------------------------------- Submit button --------------------------------------------------------->
                            <div id="kc-form-buttons" class="login-btn">
                                <input type="hidden" id="id-hidden-input" name="credentialId"
                                       <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>
                                />
                                <input tabindex="4"  name="login"
                                       id="kc-login" type="submit" value="${msg("doLogIn")}"
                                />
                            </div>
<#-------------------------------------------- End of: Submit button --------------------------------------------------------->

                        </form>
                    </#if>

<#------------------------------------- register button ---------------------------------------------------------------->
                    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                        <div id="kc-registration-container">
                            <div id="kc-registration">
                                <span>
                                    ${msg("noAccount")}
                                    <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a>
                                </span>
                            </div>
                        </div>
                    </#if>
<#------------------------------------- End of: register button ---------------------------------------------------------------->
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
