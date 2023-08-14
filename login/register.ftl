<#import "template.ftl" as layout>
<#import "register-commons.ftl" as registerCommons>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "custom-register">
        <div class="login-in__container register">
            <div class="login-in__right-side register">
                <div class="right-side__header register">
                    <h1>DSS</h1>
                    <div class="right-side__splitter register">
                        <p>
                            <span>Sign up with email</span>
                        </p>
                    </div>
                </div>
                <div class="login-form__container register">
                       <form id="kc-register-form" class="login-form register"
                            action="${url.registrationAction}" method="post"
                        >
<#-------------------------------------------- first and last name --------------------------------------------------------->
                           <div class="name-container">
                               <div class="first-name">
                                   <label for="firstName">${msg("firstName")}</label>
                                   <input type="text" id="firstName" name="firstName"
                                          placeholder="First Name"
                                          value="${(register.formData.firstName!'')}"
                                          class="${properties.kcInputClass!}"
                                          aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                                   />

                                   <#if messagesPerField.existsError('firstName')>
                                       <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                                   </span>
                                   </#if>
                               </div>

                               <div class="last-name">
                                   <label for="lastName">${msg("lastName")}</label>
                                   <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName"
                                          value="${(register.formData.lastName!'')}"
                                          aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                                            placeholder="Last Name"
                                   />

                                   <#if messagesPerField.existsError('lastName')>
                                       <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                   </span>
                                   </#if>
                               </div>
                           </div>
<#-------------------------------------------- End of: first and last name --------------------------------------------------------->
<#-------------------------------------------- username/email --------------------------------------------------------->
                           <div class="email">
                                   <label for="email">${msg("email")}</label>
                                   <input type="text" id="email" name="email"
                                          value="${(register.formData.email!'')}" autocomplete="email"
                                          placeholder="Email Address"
                                          class="${properties.kcInputClass!}"
                                          aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                                   />

                                   <#if messagesPerField.existsError('email')>
                                       <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                                        </span>
                                   </#if>
                           </div>
<#-------------------------------------------- End of: username/email --------------------------------------------------------->
<#-------------------------------------------- Password --------------------------------------------------------->
                           <#if passwordRequired??>
                               <div class="password">
                                   <label for="password">${msg("password")}</label>
                                   <input type="password" id="password" name="password" autocomplete="new-password"
                                          placeholder="password"
                                          class="${properties.kcInputClass!}"
                                          aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                   />

                                   <#if messagesPerField.existsError('password')>
                                       <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                       </span>
                                   </#if>
                               </div>

                               <div class="confirm-password">
                                   <label for="password-confirm">${msg("passwordConfirm")}</label>
                                   <input type="password" id="password-confirm" name="password-confirm"
                                          aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                          placeholder="confirm password"
                                          class="${properties.kcInputClass!}"
                                   />

                                   <#if messagesPerField.existsError('password-confirm')>
                                       <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                           ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                       </span>
                                   </#if>
                               </div>
                           </#if>
<#-------------------------------------------- End of: Password --------------------------------------------------------->

<#-------------------------------------------- Term and Condition --------------------------------------------------------->
                           <div class="term-conditions">
                               <div class="term-conditions__input">
                                   <input type="checkbox" id="termsAccepted" name="termsAccepted"
                                          aria-invalid="<#if messagesPerField.existsError('termsAccepted')>true</#if>"
                                   />
                                   <label for="termsAccepted" class="${properties.kcLabelClass!}">${msg("acceptTerms")}</label>
                               </div>

                               <#if messagesPerField.existsError('termsAccepted')>
                                   <div class="${properties.kcLabelWrapperClass!}">
                                        <span id="input-error-terms-accepted" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('termsAccepted'))?no_esc}
                                        </span>
                                   </div>
                               </#if>
                           </div>
<#-------------------------------------------- End of: Term and Condition --------------------------------------------------------->
<#-------------------------------------------- Form button --------------------------------------------------------->
                            <div class="form-btn-group">
                                 <div id="kc-form-options" class="back-to-login">
                                    <span><a href="${url.loginUrl}">I'm existing user</a></span>
                                </div>
                                <div id="kc-form-buttons" class="login-btn">
                                    <input id="register-btn" type="submit" value="Get Started"/>
                                </div>
                            </div>
                            <#-------------------------------------------- End of: Form button --------------------------------------------------------->

                        </form>

                        <#--    add a script to disable the register button till the checkbox is checked-->
                        <script>
                            const registerButton = document.querySelector('#register-btn');
                            const termsAccepted = document.querySelector('#termsAccepted');
                            registerButton.disabled = true;
                            termsAccepted.addEventListener('change', function () {
                                registerButton.disabled = !this.checked;
                            });
                        </script>
                    </#if>
                </div>
            </div>
        </div>


</@layout.registrationLayout>
